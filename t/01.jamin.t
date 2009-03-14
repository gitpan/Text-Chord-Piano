use strict;
use Test::More tests => 18;
use Text::Chord::Piano;

my $p = Text::Chord::Piano->new;


eval { $p->chord; };
like($@, qr/no chord/, 'no chord');

eval { $p->chord('H'); };
like($@, qr/undefined chord/, 'undefined chord');

eval { $p->chord('C#b9'); }; # C#-9
like($@, qr/undefined kind of chord/, 'undefined kind of chord');


is(
    $p->chord('C'),
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |  |_| |_| |_|  |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "| * |   | * |   | * |   |   |   |   |   |   |   |   |   |\n".
    "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|\n".
    "C\n",
    "C[chord]"
);

is(
    $p->generate('C', (0,4,7)),
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |  |_| |_| |_|  |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "| * |   | * |   | * |   |   |   |   |   |   |   |   |   |\n".
    "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|\n".
    "C\n",
    "C[generate]"
);

is(
    $p->gen('C', (0,4,7)),
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |  |_| |_| |_|  |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "| * |   | * |   | * |   |   |   |   |   |   |   |   |   |\n".
    "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|\n".
    "C\n",
    "C[gen]"
);

is(
    $p->gen('Cm', (0,3,7)),
    $p->chord('Cm'),
    "Cm"
);
is(
    $p->gen('C7', (0,4,7,10)),
    $p->chord('C7'),
    "C7"
);
is(
    $p->gen('C7(9,13)', (0,4,7,10,14,21)),
    $p->chord('C7(9,13)'),
    "C7(9,13)"
);


is(
    $p->gen('C#', (1,5,8)),
    $p->chord('C#'),
    'C#'
);

is(
    $p->gen('Db', (1,5,8)),
    $p->chord('Db'),
    "Db"
);

is(
    $p->gen('Edim7', (4,7,10,13)),
    $p->chord('Edim7'),
    "Edim7"
);

is(
    $p->gen('B7(9,13)', (11,15,18,21,13,20)),
    $p->chord('B7(9,13)'),
    "B7(9,13)"
);


is(66, scalar(@{$p->all_chords}), "all_chord");

is(
    $p->put_keyboard,
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |  |_| |_| |_|  |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|\n",
    "put_keyboard"
);

is($p->finger, "*", "get finger");

$p->finger('+'); # change * -> +

is($p->finger, "+", "set finger * -> +");

is(
    $p->chord('C'),
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |\n".
    "|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |  |_| |_| |_|  |\n".
    "|   |   |   |   |   |   |   |   |   |   |   |   |   |   |\n".
    "| + |   | + |   | + |   |   |   |   |   |   |   |   |   |\n".
    "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|\n".
    "C\n",
    "C[set finger('+')]"
);

