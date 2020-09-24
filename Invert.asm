BasicUpstart2(enter)

.var Screen = $0400         // this is the screen pointer
enter:

    ldx #0                          // starting with nothing
Loop:
    lda Screen,x                    //  screen banking 0, adding 1
    eor #128
    sta Screen,x
    lda Screen + $0100,x            //  banking 1
    eor #128
    sta Screen + $0100,x
    lda Screen + $0200,x            //  banking 2
    eor #128
    sta Screen + $0200,x
    lda Screen + $0300,x            //  banking 3
    eor #128
    sta Screen + $0300,x
    inx
    bne Loop

    rts