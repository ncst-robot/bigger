# PIC课程作业

## 20181014

### 第二次作业

```assembly
; =============================
; ========== 题目一 ============
;==============================

;功能：将0x50和0x51清零

        BSF     STATUS, IRP ;选体
        MOVLW   0X50        ;给W寄存器赋值0x50
        MOVWF   FSR         ;FSR指向0x50
NEXT    CLRF    INDF        ;清除INDF，即清除FSR所指向的内容0x50单元的值
        INCF    FSR         ;FSR加1
        BTFSS   FSR, 7      ;若FSR第7位为1，则跳过下一步，否则顺序执行
GOTO 	NEXT                ;
CONTINUE ......

; =============================
; ========== 题目二 ============
;==============================

;功能：两个数比较大小（40H寄存器存较大的数，20H和30H寄存器存放要比较的数据）

        MOVF    20H, W      ;将20H寄存器的内容移动到W寄存器
        SUBWF   30H, W      ;30H寄存器的值减去W寄存器的值，存到W寄存器
        BTFSS   STATUS, C   ;如果STATUS寄存器的C位是1，间跳
        GOTO    LL20H       ;执行函数LL20H
        MOVF    30H, W      ;将30H寄存器的内容赋给W寄存器
        MOVWF   40H         ;将W寄存器的内容赋给40H寄存器
        GOTO    POP         ;执行函数POP
LL20H   MOVF    20H, W      ;将20H寄存器的值赋给W寄存器
        MOVWF   40H         ;将W寄存器的内容赋给40H寄存器
POP     GOTO    POP         ;死循环
```

### 第三次作业

```assembly
; =============================
; ========== 题干说明 ==========
;==============================

;将通用寄存器20H到2FH赋值30H到3FH，并注释

        MOVLW      20H
        MOVWF      FSR
        COUNT      EQU 30H ;COUNT记录30H到3FH
;循环赋值
NEXT    MOVLW      COUNT       ;将COUNT送给W寄存器
        MOVWF      INDF        ;将W寄存器的值赋给INDF寄存器
        INCF       FSR, COUNT  ;FSR指向下一个地址
        BTFSS      FSR, 4      ;如果达到30H，跳出循环
        GOTO       NEXT
STEP GOTO STEP                 ;程序结束，原地踏步
```

