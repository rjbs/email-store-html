use Test::More tests => 11;
use File::Slurp;
BEGIN { unlink("t/test.db"); }
use Email::Store "dbi:SQLite2:dbname=t/test.db";
Email::Store->setup( );
ok(1, "Set up");

my $data = read_file("t/inlinehtmltest.mail");
Email::Store::Mail->store($data);
my ($m) = Email::Store::Mail->retrieve_all(); #('myfakeid@localhost');
ok($m, "Got the mail back");



my (@html, $html, $body, $raw, $scrubbed, $as_text);
ok(@html     = $m->html,      "Got html");
is(@html, 1, "Only one part");

$html = shift @html;

ok($body     = $m->simple->body,   "Got body");
ok($raw      = $html->raw,      "Got raw");
ok($scrubbed = $html->scrubbed, "Got scrubbed");
ok($as_text  = $html->as_text,  "Got text");

unlike($body,     qr/</, "No html in body");
unlike($body,     qr/^\s*$/s, "Not blank");
like($raw,        qr/</, "Got html in raw");

