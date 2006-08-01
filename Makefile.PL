use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Email::Store::HTML',
  VERSION_FROM  => 'lib/Email/Store/HTML.pm',
  PREREQ_PM     => {
    'Email::Store' => 0,
    'HTML::Scrubber' => 0,
    'HTML::FormatText::WithLinks' => 0,
    'Test::More' => '0.47',
  },
);
