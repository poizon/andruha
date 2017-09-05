package Myblog::Model::Fetch::Main;
use Mojo::Base -base;
use DDP;


sub list {
  my $self = shift;
  my $array_ref = $self->{dbh}->selectall_arrayref("SELECT * from mainpage ORDER BY time DESC LIMIT 10 ");
  return $array_ref;
}

1;
