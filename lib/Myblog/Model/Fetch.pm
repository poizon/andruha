package Myblog::Model::Fetch;
use Mojo::Base -base;
use DDP;
use lib qw(../../);

use Myblog::Model::Fetch::Main;


has main => sub {
  my $self = shift;
  Myblog::Model::Fetch::Main->new(dbh => $self->{dbh}, conf => $self->{conf});
};


1;
