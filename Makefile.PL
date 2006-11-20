use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Email::Store::HTML',
  VERSION_FROM  => 'lib/Email/Store/HTML.pm',
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM     => {
    'Email::Store'   => 0,
    'HTML::Scrubber' => 0,
    'Test::More'     => '0.47',
    'HTML::FormatText::WithLinks' => 0,
  },
);
