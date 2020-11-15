BasicUpstart2(entry)

//  ***     displaying text old fasshioned way
    .label CHROUT       = $FFD2     // our Kernal routine
    .label Message      = 36        // amount of characters in our byte string below
entry:

    jmp BEGIN   

TEXT:   .byte 5,84,72,69,32,77,79,82,69               // the hidden message in chr$ values
        .byte 32,87,69,32,67,79,68,69
        .byte 32,84,72,69,32,66,69,84,84
        .byte 69,82,32,87,69,32,71,69,84,115

BEGIN: ldx #0   // load 0 into xReg then start text loop

LOOP:   lda TEXT,x          //uses the CHROUT kernal to input the byte data above
        jsr CHROUT
        inx                 // increment the loop until we hit 35(or whate we set buflen)
        cpx #Message        // compare xReg with message value
        bne LOOP
        rts