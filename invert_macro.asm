//
// This is the same as E3scrn but with a macro

BasicUpstart2(enter)

.var Screen = $0400         // this is the screen pointer

    .macro ReverseScreen(Screen)  
    {
    
    lda Screen,x
    eor #128
    sta Screen,x
    }


enter:

    ldx #0                          // starting with nothing
Loop:
    ReverseScreen(Screen)               // using the macro forbank 0
    ReverseScreen(Screen + $0100)       // using the macro forbank 1 
    ReverseScreen(Screen + $0200)       // using the macro forbank 3
    ReverseScreen(Screen + $0300)       // using the macro forbank 4
    inx
    bne Loop

    rts
    