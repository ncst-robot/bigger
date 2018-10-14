# PIC指令系统

## 宏观理解

![汇编指令举例](asm-advanced.png)

## 核心助记符

| 助记符 | 功能说明 | 英文全称 |
|-------|--------|----------|
|ADD | 相加|add|
|SUB | 相减|substract|
|RL | 循环左移 |rotate left|
|RR | 循环右移 |rotate right|
|AND | 与| and |
|IOR | 或| inclusive or|
|XOR | 异或|exclusive or|
|COM | 取反|complement|
|INC | 加1|increase|
|DEC | 减1|decrease|
|MOV | 传送|move|
|CLR | 清零|clear
|RET | 返回|return|
|BTF | 位测试|bit test|

## 指令系统补充字符说明

| 字符 | 功能说明 | 英文全称 |
|-------| -------------------|------------|
|W|工作寄存器（即累加器）|-|
|f|寄存器地址（取7位寄存器地址,00H~7FH）|-|
|b|8位寄存器f内位地址（0~7）|bit|
|K|立即数（8位常数或11位地址）、常量或标号|-|
|L|指令操作数中含有8位立即数K|-|
|d|目标地址选择：d=0,结果至W;d=1,结果至f|destination|
|FSZ|寄存器f为0,则间跳|skip if 0|
|FSC|寄存器f的b位为0,则间跳|skip if clear|
|FSS|寄存器f的b位为1,则间跳|skip if set|
|( )|表示寄存器的内容|-|
|(( ))|表示寄存器间接寻址的内容|-|
|→|表示运算结果送入目标寄存器|-|

## 常用指令实例

> *指令没找到？[点这里](INSTRUCTION_SET.pdf)*

### 标志位寄存器：STATUS

![status](status.png)

### 寄存器加1指令：INCF

【格式】 INCF    F,d

【功能】寄存器F加1

【说明】

（1）INCF是Increment F的缩写;

（2）在PIC系列8位单片机中,常用符号F代表片内的各种寄存器和F的序号地址;

（3）d＝0时,结果存入W;d＝1时,结果存入F。

【实例】 
```assembly
INCF    PORTC,1    ;将PORTC加1
```
### 寄存器减1指令：DECF

【格式】 DECF    F,d

【功能】寄存器F减1

【说明】

（1）DECF是Decrement F的缩写;

（2）d＝0时,结果存入W;d＝1时,结果存入F。

【实例】

```assembly
ENCODER     EQU 0X21

            ……

            DECF     ENCODER,1 ;将ENCODER减1
```

### 寄存器清零指令：CLRF

【格式】 CLRF    F

【功能】寄存器清零

【说明】

（1）CLRF是Clear F的缩写;

（2）F寄存器被清为全0,使状态位Z＝1。

【实例】 

```assembly
CLRF    TRISC       ;对TRISC 清零
```

### W清零指令：CLRW

【格式】 CLRW

【功能】寄存器W清零

【说明】

（1）CLRW是Clear W的缩写;

（2）W为PIC单片机的工作寄存器;

（3）W寄存器被清为全0,使状态位Z＝1。

【实例】 
```assembly
CLRW        ;W＝00H
```
### F寄存器传送指令：MOVF

【格式】 MOVF    F,d

【功能】将F寄存器内容传送到F或W

【说明】

（1）MOVF是Move F的缩写;

（2）当d＝1时,传到F本身;当d＝0时,传到W;

（3）影响状态位Z

【实例】 
```assembly
MOVF       PORTB,0    ;PORTB口内容送W

MOVWF      PORTA　    ;W内容即PORTB口内容送PORTA
```
### W寄存器传送指令：MOVWF 

【格式】 MOVWF       F

【功能】 W寄存器传送

【说明】

（1）MOVWF是Move W to F的缩写;

（2）将W寄存器内容传到F,W内容不变;

（3）不影响状态位。

【实例】
```assembly
MOVLW   0x0B        ;送0BH送W

MOVWF   PORTB       ;送W内容到PORTB口
```
### 递增跳转指令：INCFSZ

【格式】 INCFSZ     F,d

【功能】 递增跳转

【说明】

（1）INCFSZ是Increment F,Skip if 0的缩写;

（2）F寄存器内容加1后,当d＝1时结果存入F,当d＝0时存入W;

（3）若结果为0则跳过下一条指令,否则顺序执行;

（4）影响状态位Z。

【实例】
```assembly
LOOP   INCFSZ     COUNT1,1   ;COUNT1加1,结果存到COUNT1

       GOTO       LOOP　     ;结果不为零,循环

       MOVWF      COUNT2     ;结果为零时,执行该语句
```
### 递减跳转指令：DECFSZ

【格式】 DECFSZ      F,d

【功能】递减跳转

【说明】

（1）DECFSZ是Decrement F,Skip if 0的缩写;

（2）F寄存器内容减1,结果存入F本身（d＝1）或W（d＝0）;

（3）如果结果为0则跳过下一条指令,否则顺序执行;

（4）影响状态位Z;

（5）实际指令中,当d=1时,该项常常被略去。

【实例】
```assembly
DELAY   MOVLW    25          ;延时子程序

        MOVWF    N           ;给N赋值25

        LOOP     DECFSZ N,1  ;N-1送回N并判结果＝0？是！跳出循环

        GOTO     LOOP        ;否！循环回去

        RETURN               ;返回
```

### 位清零指令：BCF
【格式】 BCF     F,B

【功能】位清0

【说明】

（1）BCF是Bit Clear F的缩写;

（2）符号B是表示片内某个8位数据寄存器F的位号(或位地址);

（3）指令的意思是：将寄存器的第B位清0。

【实例】 
```assembly
BCF     REG1,2     ;把寄存器REG1的第2位清零
```
### 位置1指令：BSF
【格式】 BSF     F,B

【功能】位置1

【说明】（1）BSF是Bit Set F的缩写;

（2）将寄存器F的第B位置1。

【实例】 
```assembly
BSF     STATUS,RP0      ;设置文件寄存器的体1
```
### 位测试为零跳转指令：BTFSC
【格式】 BTFSC   F,B

【功能】位测试为0跳转

【说明】

（1）BTFSC是Bit Test,Skip if Clear的缩写;

（2）测试F寄存器的第B位,若F（B）＝0则调到下一条指令,否则顺序执行。

【实例】
```assembly
BTFSC       PORTB,0    ;检测PORTB口中的第0位是否为0？是！跳过下一条指令

GOTO       CHECK       ;否！则转到标号为CHECK的语句

CALL       DELAY       ;PORTB的第0位是1则直接执行该语句,调用延时子程序
```
### 位测试为1跳转指令：BTFSS
【格式】 BTFSS       F,B

【功能】位测试位1跳转指令

【说明】

（1）BTFSS是Bit Test F,Skip if Set的缩写;

（2）测试F寄存器的第B位,若F（B）＝1,则跳转到下一条指令,否则顺序执行。

【实例】
```assembly
BTFSS       PORTB,0     ;检测PORTB口中的第0位是否为1？是！跳过下一条指令

GOTO        CHECK       ;否！则转到标号为CHECK的语句

CALL        DELAY       ;PORTB的第0位是1则直接执行该句,调用延时子程序
```
### 常数传送指令：MOVLW    
【格式】 MOVLW       K

【功能】常数传送

【说明】（1）MOVLW是Move literal to W的缩写;

（2）将8位立即数传送到W寄存器,k表示常数、立即数和标号;

（3）不影响状态位

【实例】 
```assembly
MOVLW       0x1E    ;常数30送W
```
### 子程序调用指令：CALL
【格式】 CALL    K

【功能】子程序调用

【说明】

（1）CALL是CALL subroutine的缩写;

（2）K为立即地址;

（3）不影响状态位。

【实例】      
```assembly
CALL    DELAY         ;调用延时子程序

DELAY   ……            ;延时子程序DELAY

        ……

        RETURN
```
### 无条件跳转指令：GOTO
【格式】 GOTO    K

【功能】无条件跳转

【说明】

（1）GOTO是Go to address的缩写;

（2）指令中的K,常与程序中的标号联系起来;

（3）不影响状态位。

【实例】 
```assembly
STOP    GOTO    STOP    ;循环执行GOTO语句,从而停机
```

### 子程序返回指令：RETURN
【格式】 RETURN

【功能】子程序返回

【说明】

（1）RETURN是Return from Subroutine的缩写;

（2）将堆栈顶端单元内容弹出并送入PC,从而返回主程序断点处;

（3）不影响状态位。

【实例】 
```assembly
SUB  MOVLW   01H     ;子程序

     ……

     RETURN          ;子程序返回
```
### 空操作指令：NOP 
【格式】 NOP

【功能】空操作

【说明】 

（1）NOP是No Operation的缩写;

（2）不产生任何操作,仅使PC加1,消耗一个指令周期NOP;

（3）不影响状态位。

【实例】 
```assembly
MOVLW       0xOF　　    ;送OFH到W
　　　　
MOVWF       PORTB       ;W内容写入B口
　　　　 
NOP　　　　　            ;空操作

MOVF        PORTB,W     ;读操作
```
## 常用伪指令实例

### 符号名赋值伪指令：EQU

【格式】符号名 EQU nn

【功能】符号名赋值

【说明】

（1）给符号名或寄存器赋值,符号名一旦由EQU赋值,其值就不能再重新定义;

（2）nn是一个长度不同的二进制数值。

【实例】 
```assembly
COUNT       EQU     100     ;定义COUNT为常数100
```
### 程序起始地址伪指令：ORG
【格式】 ORG nnnn

【功能】程序起始地址

【说明】

（1）用于指定该伪指令后面的源程序存放的起始地址,也就是汇编后的机器码目标程序在单片机的程序存贮器中开始存放的首地址;

（2）nnnn是一个13为长的地址参数。

【实例】 
```assembly
ORG 0x00     ;程序汇编地址从00H开始
```
### 程序结束伪指令：END
【格式】 END

【功能】程序结束

【说明】

（1）指令末的伪指令END是通知汇编程序MPASM结束对源程序的汇编,即使后面还有语句,也不再予以汇编;

（2）在一个源程序中必须有END伪指令;

（3）只能有一个END;

（4）放在整个程序的最后。

【实例】直接在程序末尾使用,从而结束程序

### 调入外部函数伪指令：INCLUDE
【格式】 INCLUDE “文件名”

【功能】调入外部函数

【说明】

（1）用来告诉汇编器,将一个预先编好的外部程序文件包含进来,作为本源程序的一部分;

（2）这样可以减少重复劳动,提高编程效率。

## 汇编指令速查

> [汇编指令手册下载](https://pan.baidu.com/s/1lVdiYWjy3BMaHmBvKx8wbg) 

| 指令       | 功能                                                         |
| ---------- | ------------------------------------------------------------ |
| AAA        | 调整加                                                       |
| AAD        | 调整除                                                       |
| AAM        | 调整乘                                                       |
| AAS        | 调整减                                                       |
| ADC        | 进位加                                                       |
| ADD        | 加                                                           |
| AND        | 与                                                           |
| ARPL       | 调整优先级                                                   |
| BOUND      | 检查数组                                                     |
| BSF        | [位右扫描](https://blog.csdn.net/hgy413/article/details/17913195) |
| BSR        | 位左扫描                                                     |
| BSWAP      | 交换字节                                                     |
| BT         | 位测试                                                       |
| BTC        | 位测试求反                                                   |
| BTR        | 位测试清零                                                   |
| BTS        | 位测试置一                                                   |
| CALL       | 过程调用                                                     |
| CBW        | 转换字节                                                     |
| CDQ        | 转换双字                                                     |
| CLC        | 进位清零                                                     |
| CLD        | 方向清零                                                     |
| CLI        | 中断清零                                                     |
| CLTS       | 任务清除                                                     |
| CMC        | 进位求反                                                     |
| CMOVA      | 高于传送                                                     |
| CMOVB      | 低于传送                                                     |
| CMOVE      | 相等传送                                                     |
| CMOVG      | 大于传送                                                     |
| CMOVL      | 小于传送                                                     |
| CMOVNA     | 不高于传送                                                   |
| CMOVNB     | 不低于传送                                                   |
| CMOVNE     | 不等传送                                                     |
| CMOVNG     | 不大于传送                                                   |
| CMOVNL     | 不小于传送                                                   |
| CMOVNO     | 不溢出传送                                                   |
| CMOVNP     | 非奇偶传送                                                   |
| CMOVNS     | 非负传送                                                     |
| CMOVO      | 溢出传送                                                     |
| CMOVP      | 奇偶传送                                                     |
| CMOVS      | 负号传送                                                     |
| CMP        | 比较                                                         |
| CMPSB      | 比较字节串                                                   |
| CMPSD      | 比较双字串                                                   |
| CMPSW      | 比较字串                                                     |
| CMPXCHG    | 比较交换                                                     |
| CMPXCHG486 | 比较交换486                                                  |
| CMPXCHG8B  | 比较交换8字节                                                |
| CPUID      | CPU标识                                                      |
| CWD        | 转换字                                                       |
| CWDE       | 扩展字                                                       |
| DAA        | 调整加十                                                     |
| DAS        | 调整减十                                                     |
| DEC        | 减一                                                         |
| DIV        | 除                                                           |
| ENTER      | 建立堆栈帧                                                   |
| HLT        | 停                                                           |
| IDIV       | 符号整除                                                     |
| IMUL       | 符号乘法                                                     |
| IN         | 端口输入                                                     |
| INC        | 加一                                                         |
| INSB       | 端口输入字节串                                               |
| INSD       | 端口输入双字串                                               |
| INSW       | 端口输入字串                                                 |
| JA         | 高于跳转                                                     |
| JB         | 低于跳转                                                     |
| JBE        | 不高于跳转                                                   |
| JCXZ       | 计数一六零跳转                                               |
| JE         | 相等跳转                                                     |
| JECXZ      | 计数三二零跳转                                               |
| JG         | 大于跳转                                                     |
| JL         | 小于跳转                                                     |
| JMP        | 跳转                                                         |
| JMPE       | 跳转扩展                                                     |
| JNB        | 不低于跳转                                                   |
| JNE        | 不等跳转                                                     |
| JNG        | 不大于跳转                                                   |
| JNL        | 不小于跳转                                                   |
| JNO        | 不溢出跳转                                                   |
| JNP        | 非奇偶跳转                                                   |
| JNS        | 非负跳转                                                     |
| JO         | 溢出跳转                                                     |
| JP         | 奇偶跳转                                                     |
| JS         | 负号跳转                                                     |
| LAHF       | 加载标志低八                                                 |
| LAR        | 加载访问权限                                                 |
| LDS        | 加载数据段                                                   |
| LEA        | 加载有效地址                                                 |
| LEAVE      | 清除过程堆栈                                                 |
| LES        | 加载附加段                                                   |
| LFS        | 加载标志段                                                   |
| LGDT       | 加载全局描述符                                               |
| LGS        | 加载全局段                                                   |
| LIDT       | 加载中断描述符                                               |
| LMSW       | 加载状态字                                                   |
| LOADALL    | 加载所有                                                     |
| LOADALL286 | 加载所有286                                                  |
| LOCK       | 锁                                                           |
| LODSB      | 加载源变址字节串                                             |
| LODSD      | 加载源变址双字串                                             |
| LODSW      | 加载源变址字串                                               |
| LOOP       | 计数循环                                                     |
| LOOPE      | 相等循环                                                     |
| LOOPNE     | 不等循环                                                     |
| LOOPNZ     | 非零循环                                                     |
| LOOPZ      | 为零循环                                                     |
| LSL        | 加载段界限                                                   |
| LSS        | 加载堆栈段                                                   |
| LTR        | 加载任务                                                     |
| MONITOR    | 监视                                                         |
| MOV        | 传送                                                         |
| MOVSB      | 传送字节串                                                   |
| MOVSD      | 传送双字串                                                   |
| MOVSW      | 传送字串                                                     |
| MOVSX      | 符号传送                                                     |
| MOVZX      | 零传送                                                       |
| MUL        | 乘                                                           |
| MWAIT      |                                                              |
| NEG        | 求补                                                         |
| NOP        | 空                                                           |
| NOT        | 非                                                           |
| OR         | 或                                                           |
| OUT        | 端口输出                                                     |
| OUTSB      | 端口输出字节串                                               |
| OUTSD      | 端口输出双字串                                               |
| OUTSW      | 端口输出字串                                                 |
| POP        | 出栈                                                         |
| POPA       | 全部出栈                                                     |
| POPF       | 标志出栈                                                     |
| PUSH       | 压栈                                                         |
| PUSHA      | 全部压栈                                                     |
| PUSHF      | 标志压栈                                                     |
| RCL        | 进位循环左移                                                 |
| RCR        | 进位循环右移                                                 |
| RDMSR      | 读专用模式                                                   |
| RDPMC      | 读执行监视计数                                               |
| RDSHR      |                                                              |
| RDTSC      | 读时间戳计数                                                 |
| REP        | 重复                                                         |
| REPE       | 相等重复                                                     |
| REPNE      | 不等重复                                                     |
| RET        | 过程返回                                                     |
| RETF       | 远过程返回                                                   |
| RETN       | 近过程返回                                                   |
| ROL        | 循环左移                                                     |
| ROR        | 循环右移                                                     |
| RSM        | 恢复系统管理                                                 |
| SAHF       | 恢复标志低八                                                 |
| SAL        | 算术左移                                                     |
| SALC       |                                                              |
| SAR        | 算术右移                                                     |
| SBB        | 借位减                                                       |
| SCASB      | 扫描字节串                                                   |
| SCASD      | 扫描双字串                                                   |
| SCASW      | 扫描字串                                                     |
| SETA       | 高于置位                                                     |
| SETB       | 低于置位                                                     |
| SETE       | 相等置位                                                     |
| SETG       | 大于置位                                                     |
| SETL       | 小于置位                                                     |
| SETNA      | 不高于置位                                                   |
| SETNB      | 不低于置位                                                   |
| SETNE      | 不等置位                                                     |
| SETNG      | 不大于置位                                                   |
| SETNL      | 不小于置位                                                   |
| SETNO      | 不溢出置位                                                   |
| SETNP      | 非奇偶置位                                                   |
| SETNS      | 非负置位                                                     |
| SETO       | 溢出置位                                                     |
| SETP       | 奇偶置位                                                     |
| SETS       | 负号置位                                                     |
| SGDT       | 保存全局描述符                                               |
| SHL        | 逻辑左移                                                     |
| SHLD       | 双精度左移                                                   |
| SHR        | 逻辑右移                                                     |
| SHRD       | 双精度右移                                                   |
| SIDT       | 保存中断描述符                                               |
| SLDT       | 保存局部描述符                                               |
| SMI        |                                                              |
| SMINT      |                                                              |
| SMINTOLD   |                                                              |
| SMSW       | 保存状态字                                                   |
| STC        | 进位设置                                                     |
| STD        | 方向设置                                                     |
| STI        | 中断设置                                                     |
| STOSB      | 保存字节串                                                   |
| STOSD      | 保存双字串                                                   |
| STOSW      | 保存字串                                                     |
| STR        | 保存任务                                                     |
| SUB        | 减                                                           |
| SYSCALL    | 系统调用                                                     |
| SYSENTER   | 系统进入                                                     |
| SYSEXIT    | 系统退出                                                     |
| SYSRET     | 系统返回                                                     |
| TEST       | 数测试                                                       |
| UD0        | 未定义指令0                                                  |
| UD1        | 未定义指令1                                                  |
| UD2        | 未定义指令2                                                  |
| UMOV       |                                                              |
| VERW       | 校验写                                                       |
| WAIT       | 等                                                           |
| WBINVD     | 回写无效高速缓存                                             |
| WRMSR      | 写专用模式                                                   |
| WRSHR      |                                                              |
| XADD       | 交换加                                                       |
| XBTS       |                                                              |
| XCHG       | 交换                                                         |
| XLAT       | 换码                                                         |
| XOR        | 异或                                                         |
| XSTORE     |                                                              |

> [更多#8658](http://www.cnblogs.com/del/archive/2010/03/16/1687665.html)

