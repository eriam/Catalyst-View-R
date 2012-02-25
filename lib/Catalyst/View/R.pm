package Catalyst::View::R;

use strict;
use warnings;
use base 'Catalyst::View::TT';
use File::Slurp;
use File::Temp qw/ tempfile tempdir /;
use Statistics::R;

our $VERSION = "0.01_2";

sub process {
   my ( $self, $c ) = @_;
   
   my $template = $c->stash->{r}
      ||  $c->action . '.r';
      
   my $output_format = $c->stash->{output_format} 
      || 'png';
   
   unless (defined $template) {
     $c->log->debug('No R script specified for rendering') if $c->debug;
     return 0;
   }

   my $result_file;
   my $rscript_file;
   
   if ($^O eq 'MSWin32') {
      $result_file   = File::Temp->new(UNLINK => 0, SUFFIX => '.'.$output_format, DIR => './' );
   }
   else {
      $result_file = File::Temp->new(UNLINK => 0, SUFFIX => '.'.$output_format );
   }
   
   $c->stash->{result_file} = $result_file->filename;
   
   
   my $output = $self->render($c, $template);
   
   my $R = Statistics::R->new() ;
      
   $R->run($output);
      
   $R->stop();

   my $content_type = $c->stash->{content_type}
      || 'image/png';
      
   $c->response->content_type($content_type);
   
   my $bin_data = read_file( $result_file->filename, binmode => ':raw' ) ;    
   
   $c->response->body($bin_data);

   unlink($result_file->filename);

   return 1;
}



1;
=head1 NAME

Catalyst::View::R - A Catalyst view for R

=head1 SYNOPSIS

In a controller:

	sub main : Path {
	    my ( $self, $c ) = @_;
	    
	   $c->log->info('ok');
	   $c->stash->{r} = 'iris.r';  
	   
	   $c->forward( $c->component('R') );
	}

With the correspondig view:

	data(iris)
	plot(iris)

=head1 METHODS

=head2 process

The process is the method used by Catalyst.

=head1 SOURCE AVAILABILITY

This source is in Github:

        git://github.com/eriam/Catalyst-View-R.git

=head1 AUTHOR

Eriam Schaffter, C<< <eriam@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2012 Eriam Schaffter.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut