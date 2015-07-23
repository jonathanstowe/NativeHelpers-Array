use v6;

=begin pod

=head1 NAME

=head1 DESCRIPTION

=head1 SUBROUTINES

=end pod


module NativeHelpers::Array {

    use NativeCall;

    sub copy-to-carray(@items, Mu $type) returns CArray is export {
        my $array = CArray[$type].new;
        $array[$_] = @items[$_] for ^@items.elems;
        $array;
    }

    sub copy-to-array(CArray $carray, Int $items) returns Array is export {
        my @array;
        @array[$_] = $carray[$_] for ^$items;
        @array;
    }

    sub copy-buf-to-carray(Buf $buf) returns CArray[uint8] is export {
        my $carray = CArray[uint8].new;
        $carray[$_] = $buf[$_] for ^$buf.elems;
        $carray;
    }

    sub copy-carray-to-buf(CArray $array, Int $no-elems) returns Buf is export {
        my $buf = Buf.new;
        $buf[$_] = $array[$_] for ^$no-elems;
        $buf;
    }

}
# vim: expandtab shiftwidth=4 ft=perl6
