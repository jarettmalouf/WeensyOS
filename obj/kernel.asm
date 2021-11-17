
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <entry_from_boot>:
# The entry_from_boot routine sets the stack pointer to the top of the
# OS kernel stack, then jumps to the `kernel` routine.

.globl entry_from_boot
entry_from_boot:
        movq $0x80000, %rsp
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
        movq %rsp, %rbp
   40007:	48 89 e5             	mov    %rsp,%rbp
        pushq $0
   4000a:	6a 00                	pushq  $0x0
        popfq
   4000c:	9d                   	popfq  
        // Check for multiboot command line; if found pass it along.
        cmpl $0x2BADB002, %eax
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
        jne 1f
   40012:	75 0d                	jne    40021 <entry_from_boot+0x21>
        testl $4, (%rbx)
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
        je 1f
   4001a:	74 05                	je     40021 <entry_from_boot+0x21>
        movl 16(%rbx), %edi
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
        jmp 2f
   4001f:	eb 07                	jmp    40028 <entry_from_boot+0x28>
1:      movq $0, %rdi
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
2:      jmp kernel
   40028:	e9 6e 01 00 00       	jmpq   4019b <kernel>
   4002d:	90                   	nop

000000000004002e <gpf_int_handler>:
# Interrupt handlers
.align 2

        .globl gpf_int_handler
gpf_int_handler:
        pushq $13               // trap number
   4002e:	6a 0d                	pushq  $0xd
        jmp generic_exception_handler
   40030:	eb 6e                	jmp    400a0 <generic_exception_handler>

0000000000040032 <pagefault_int_handler>:

        .globl pagefault_int_handler
pagefault_int_handler:
        pushq $14
   40032:	6a 0e                	pushq  $0xe
        jmp generic_exception_handler
   40034:	eb 6a                	jmp    400a0 <generic_exception_handler>

0000000000040036 <timer_int_handler>:

        .globl timer_int_handler
timer_int_handler:
        pushq $0                // error code
   40036:	6a 00                	pushq  $0x0
        pushq $32
   40038:	6a 20                	pushq  $0x20
        jmp generic_exception_handler
   4003a:	eb 64                	jmp    400a0 <generic_exception_handler>

000000000004003c <sys48_int_handler>:

sys48_int_handler:
        pushq $0
   4003c:	6a 00                	pushq  $0x0
        pushq $48
   4003e:	6a 30                	pushq  $0x30
        jmp generic_exception_handler
   40040:	eb 5e                	jmp    400a0 <generic_exception_handler>

0000000000040042 <sys49_int_handler>:

sys49_int_handler:
        pushq $0
   40042:	6a 00                	pushq  $0x0
        pushq $49
   40044:	6a 31                	pushq  $0x31
        jmp generic_exception_handler
   40046:	eb 58                	jmp    400a0 <generic_exception_handler>

0000000000040048 <sys50_int_handler>:

sys50_int_handler:
        pushq $0
   40048:	6a 00                	pushq  $0x0
        pushq $50
   4004a:	6a 32                	pushq  $0x32
        jmp generic_exception_handler
   4004c:	eb 52                	jmp    400a0 <generic_exception_handler>

000000000004004e <sys51_int_handler>:

sys51_int_handler:
        pushq $0
   4004e:	6a 00                	pushq  $0x0
        pushq $51
   40050:	6a 33                	pushq  $0x33
        jmp generic_exception_handler
   40052:	eb 4c                	jmp    400a0 <generic_exception_handler>

0000000000040054 <sys52_int_handler>:

sys52_int_handler:
        pushq $0
   40054:	6a 00                	pushq  $0x0
        pushq $52
   40056:	6a 34                	pushq  $0x34
        jmp generic_exception_handler
   40058:	eb 46                	jmp    400a0 <generic_exception_handler>

000000000004005a <sys53_int_handler>:

sys53_int_handler:
        pushq $0
   4005a:	6a 00                	pushq  $0x0
        pushq $53
   4005c:	6a 35                	pushq  $0x35
        jmp generic_exception_handler
   4005e:	eb 40                	jmp    400a0 <generic_exception_handler>

0000000000040060 <sys54_int_handler>:

sys54_int_handler:
        pushq $0
   40060:	6a 00                	pushq  $0x0
        pushq $54
   40062:	6a 36                	pushq  $0x36
        jmp generic_exception_handler
   40064:	eb 3a                	jmp    400a0 <generic_exception_handler>

0000000000040066 <sys55_int_handler>:

sys55_int_handler:
        pushq $0
   40066:	6a 00                	pushq  $0x0
        pushq $55
   40068:	6a 37                	pushq  $0x37
        jmp generic_exception_handler
   4006a:	eb 34                	jmp    400a0 <generic_exception_handler>

000000000004006c <sys56_int_handler>:

sys56_int_handler:
        pushq $0
   4006c:	6a 00                	pushq  $0x0
        pushq $56
   4006e:	6a 38                	pushq  $0x38
        jmp generic_exception_handler
   40070:	eb 2e                	jmp    400a0 <generic_exception_handler>

0000000000040072 <sys57_int_handler>:

sys57_int_handler:
        pushq $0
   40072:	6a 00                	pushq  $0x0
        pushq $57
   40074:	6a 39                	pushq  $0x39
        jmp generic_exception_handler
   40076:	eb 28                	jmp    400a0 <generic_exception_handler>

0000000000040078 <sys58_int_handler>:

sys58_int_handler:
        pushq $0
   40078:	6a 00                	pushq  $0x0
        pushq $58
   4007a:	6a 3a                	pushq  $0x3a
        jmp generic_exception_handler
   4007c:	eb 22                	jmp    400a0 <generic_exception_handler>

000000000004007e <sys59_int_handler>:

sys59_int_handler:
        pushq $0
   4007e:	6a 00                	pushq  $0x0
        pushq $59
   40080:	6a 3b                	pushq  $0x3b
        jmp generic_exception_handler
   40082:	eb 1c                	jmp    400a0 <generic_exception_handler>

0000000000040084 <sys60_int_handler>:

sys60_int_handler:
        pushq $0
   40084:	6a 00                	pushq  $0x0
        pushq $60
   40086:	6a 3c                	pushq  $0x3c
        jmp generic_exception_handler
   40088:	eb 16                	jmp    400a0 <generic_exception_handler>

000000000004008a <sys61_int_handler>:

sys61_int_handler:
        pushq $0
   4008a:	6a 00                	pushq  $0x0
        pushq $61
   4008c:	6a 3d                	pushq  $0x3d
        jmp generic_exception_handler
   4008e:	eb 10                	jmp    400a0 <generic_exception_handler>

0000000000040090 <sys62_int_handler>:

sys62_int_handler:
        pushq $0
   40090:	6a 00                	pushq  $0x0
        pushq $62
   40092:	6a 3e                	pushq  $0x3e
        jmp generic_exception_handler
   40094:	eb 0a                	jmp    400a0 <generic_exception_handler>

0000000000040096 <sys63_int_handler>:

sys63_int_handler:
        pushq $0
   40096:	6a 00                	pushq  $0x0
        pushq $63
   40098:	6a 3f                	pushq  $0x3f
        jmp generic_exception_handler
   4009a:	eb 04                	jmp    400a0 <generic_exception_handler>

000000000004009c <default_int_handler>:

        .globl default_int_handler
default_int_handler:
        pushq $0
   4009c:	6a 00                	pushq  $0x0
        jmp generic_exception_handler
   4009e:	eb 00                	jmp    400a0 <generic_exception_handler>

00000000000400a0 <generic_exception_handler>:


generic_exception_handler:
        pushq %gs
   400a0:	0f a8                	pushq  %gs
        pushq %fs
   400a2:	0f a0                	pushq  %fs
        pushq %r15
   400a4:	41 57                	push   %r15
        pushq %r14
   400a6:	41 56                	push   %r14
        pushq %r13
   400a8:	41 55                	push   %r13
        pushq %r12
   400aa:	41 54                	push   %r12
        pushq %r11
   400ac:	41 53                	push   %r11
        pushq %r10
   400ae:	41 52                	push   %r10
        pushq %r9
   400b0:	41 51                	push   %r9
        pushq %r8
   400b2:	41 50                	push   %r8
        pushq %rdi
   400b4:	57                   	push   %rdi
        pushq %rsi
   400b5:	56                   	push   %rsi
        pushq %rbp
   400b6:	55                   	push   %rbp
        pushq %rbx
   400b7:	53                   	push   %rbx
        pushq %rdx
   400b8:	52                   	push   %rdx
        pushq %rcx
   400b9:	51                   	push   %rcx
        pushq %rax
   400ba:	50                   	push   %rax
        movq %rsp, %rdi
   400bb:	48 89 e7             	mov    %rsp,%rdi
        call exception
   400be:	e8 1f 0a 00 00       	callq  40ae2 <exception>

00000000000400c3 <exception_return>:
        # `exception` should never return.


        .globl exception_return
exception_return:
        movq %rdi, %rsp
   400c3:	48 89 fc             	mov    %rdi,%rsp
        popq %rax
   400c6:	58                   	pop    %rax
        popq %rcx
   400c7:	59                   	pop    %rcx
        popq %rdx
   400c8:	5a                   	pop    %rdx
        popq %rbx
   400c9:	5b                   	pop    %rbx
        popq %rbp
   400ca:	5d                   	pop    %rbp
        popq %rsi
   400cb:	5e                   	pop    %rsi
        popq %rdi
   400cc:	5f                   	pop    %rdi
        popq %r8
   400cd:	41 58                	pop    %r8
        popq %r9
   400cf:	41 59                	pop    %r9
        popq %r10
   400d1:	41 5a                	pop    %r10
        popq %r11
   400d3:	41 5b                	pop    %r11
        popq %r12
   400d5:	41 5c                	pop    %r12
        popq %r13
   400d7:	41 5d                	pop    %r13
        popq %r14
   400d9:	41 5e                	pop    %r14
        popq %r15
   400db:	41 5f                	pop    %r15
        popq %fs
   400dd:	0f a1                	popq   %fs
        popq %gs
   400df:	0f a9                	popq   %gs
        addq $16, %rsp
   400e1:	48 83 c4 10          	add    $0x10,%rsp
        iretq
   400e5:	48 cf                	iretq  

00000000000400e7 <sys_int_handlers>:
   400e7:	3c 00                	cmp    $0x0,%al
   400e9:	04 00                	add    $0x0,%al
   400eb:	00 00                	add    %al,(%rax)
   400ed:	00 00                	add    %al,(%rax)
   400ef:	42 00 04 00          	add    %al,(%rax,%r8,1)
   400f3:	00 00                	add    %al,(%rax)
   400f5:	00 00                	add    %al,(%rax)
   400f7:	48 00 04 00          	rex.W add %al,(%rax,%rax,1)
   400fb:	00 00                	add    %al,(%rax)
   400fd:	00 00                	add    %al,(%rax)
   400ff:	4e 00 04 00          	rex.WRX add %r8b,(%rax,%r8,1)
   40103:	00 00                	add    %al,(%rax)
   40105:	00 00                	add    %al,(%rax)
   40107:	54                   	push   %rsp
   40108:	00 04 00             	add    %al,(%rax,%rax,1)
   4010b:	00 00                	add    %al,(%rax)
   4010d:	00 00                	add    %al,(%rax)
   4010f:	5a                   	pop    %rdx
   40110:	00 04 00             	add    %al,(%rax,%rax,1)
   40113:	00 00                	add    %al,(%rax)
   40115:	00 00                	add    %al,(%rax)
   40117:	60                   	(bad)  
   40118:	00 04 00             	add    %al,(%rax,%rax,1)
   4011b:	00 00                	add    %al,(%rax)
   4011d:	00 00                	add    %al,(%rax)
   4011f:	66 00 04 00          	data16 add %al,(%rax,%rax,1)
   40123:	00 00                	add    %al,(%rax)
   40125:	00 00                	add    %al,(%rax)
   40127:	6c                   	insb   (%dx),%es:(%rdi)
   40128:	00 04 00             	add    %al,(%rax,%rax,1)
   4012b:	00 00                	add    %al,(%rax)
   4012d:	00 00                	add    %al,(%rax)
   4012f:	72 00                	jb     40131 <sys_int_handlers+0x4a>
   40131:	04 00                	add    $0x0,%al
   40133:	00 00                	add    %al,(%rax)
   40135:	00 00                	add    %al,(%rax)
   40137:	78 00                	js     40139 <sys_int_handlers+0x52>
   40139:	04 00                	add    $0x0,%al
   4013b:	00 00                	add    %al,(%rax)
   4013d:	00 00                	add    %al,(%rax)
   4013f:	7e 00                	jle    40141 <sys_int_handlers+0x5a>
   40141:	04 00                	add    $0x0,%al
   40143:	00 00                	add    %al,(%rax)
   40145:	00 00                	add    %al,(%rax)
   40147:	84 00                	test   %al,(%rax)
   40149:	04 00                	add    $0x0,%al
   4014b:	00 00                	add    %al,(%rax)
   4014d:	00 00                	add    %al,(%rax)
   4014f:	8a 00                	mov    (%rax),%al
   40151:	04 00                	add    $0x0,%al
   40153:	00 00                	add    %al,(%rax)
   40155:	00 00                	add    %al,(%rax)
   40157:	90                   	nop
   40158:	00 04 00             	add    %al,(%rax,%rax,1)
   4015b:	00 00                	add    %al,(%rax)
   4015d:	00 00                	add    %al,(%rax)
   4015f:	96                   	xchg   %eax,%esi
   40160:	00 04 00             	add    %al,(%rax,%rax,1)
   40163:	00 00                	add    %al,(%rax)
	...

0000000000040167 <free_pt>:
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void free_pt(x86_64_pagetable *pt) {
   40167:	55                   	push   %rbp
   40168:	48 89 e5             	mov    %rsp,%rbp
   4016b:	48 83 ec 18          	sub    $0x18,%rsp
   4016f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    int pn = PAGENUMBER(pt);
   40173:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40177:	48 c1 e8 0c          	shr    $0xc,%rax
   4017b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    pageinfo[pn].owner = PO_FREE;
   4017e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40181:	48 98                	cltq   
   40183:	c6 84 00 40 ee 04 00 	movb   $0x0,0x4ee40(%rax,%rax,1)
   4018a:	00 
    pageinfo[pn].refcount = 0;
   4018b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4018e:	48 98                	cltq   
   40190:	c6 84 00 41 ee 04 00 	movb   $0x0,0x4ee41(%rax,%rax,1)
   40197:	00 
}
   40198:	90                   	nop
   40199:	c9                   	leaveq 
   4019a:	c3                   	retq   

000000000004019b <kernel>:

void kernel(const char* command) {
   4019b:	55                   	push   %rbp
   4019c:	48 89 e5             	mov    %rsp,%rbp
   4019f:	48 83 ec 20          	sub    $0x20,%rsp
   401a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   401a7:	e8 47 17 00 00       	callq  418f3 <hardware_init>
    pageinfo_init();
   401ac:	e8 ef 0d 00 00       	callq  40fa0 <pageinfo_init>
    console_clear();
   401b1:	e8 b8 3a 00 00       	callq  43c6e <console_clear>
    timer_init(HZ);
   401b6:	bf 64 00 00 00       	mov    $0x64,%edi
   401bb:	e8 23 1c 00 00       	callq  41de3 <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   401c0:	48 8b 05 39 0e 01 00 	mov    0x10e39(%rip),%rax        # 51000 <kernel_pagetable>
   401c7:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   401cd:	b9 00 00 10 00       	mov    $0x100000,%ecx
   401d2:	ba 00 00 00 00       	mov    $0x0,%edx
   401d7:	be 00 00 00 00       	mov    $0x0,%esi
   401dc:	48 89 c7             	mov    %rax,%rdi
   401df:	e8 4d 29 00 00       	callq  42b31 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   401e4:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   401e9:	be 00 80 0b 00       	mov    $0xb8000,%esi
   401ee:	48 8b 05 0b 0e 01 00 	mov    0x10e0b(%rip),%rax        # 51000 <kernel_pagetable>
   401f5:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   401fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40200:	48 89 c7             	mov    %rax,%rdi
   40203:	e8 29 29 00 00       	callq  42b31 <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40208:	ba 00 0e 00 00       	mov    $0xe00,%edx
   4020d:	be 00 00 00 00       	mov    $0x0,%esi
   40212:	bf 20 e0 04 00       	mov    $0x4e020,%edi
   40217:	e8 69 31 00 00       	callq  43385 <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   4021c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40223:	eb 44                	jmp    40269 <kernel+0xce>
        processes[i].p_pid = i;
   40225:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40228:	48 63 d0             	movslq %eax,%rdx
   4022b:	48 89 d0             	mov    %rdx,%rax
   4022e:	48 c1 e0 03          	shl    $0x3,%rax
   40232:	48 29 d0             	sub    %rdx,%rax
   40235:	48 c1 e0 05          	shl    $0x5,%rax
   40239:	48 8d 90 20 e0 04 00 	lea    0x4e020(%rax),%rdx
   40240:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40243:	89 02                	mov    %eax,(%rdx)
        processes[i].p_state = P_FREE;
   40245:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40248:	48 63 d0             	movslq %eax,%rdx
   4024b:	48 89 d0             	mov    %rdx,%rax
   4024e:	48 c1 e0 03          	shl    $0x3,%rax
   40252:	48 29 d0             	sub    %rdx,%rax
   40255:	48 c1 e0 05          	shl    $0x5,%rax
   40259:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   4025f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    for (pid_t i = 0; i < NPROC; i++) {
   40265:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40269:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   4026d:	7e b6                	jle    40225 <kernel+0x8a>
    }

    if (command && strcmp(command, "fork") == 0) {
   4026f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40274:	74 29                	je     4029f <kernel+0x104>
   40276:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4027a:	be a0 3c 04 00       	mov    $0x43ca0,%esi
   4027f:	48 89 c7             	mov    %rax,%rdi
   40282:	e8 6f 31 00 00       	callq  433f6 <strcmp>
   40287:	85 c0                	test   %eax,%eax
   40289:	75 14                	jne    4029f <kernel+0x104>
        process_setup(1, 4);
   4028b:	be 04 00 00 00       	mov    $0x4,%esi
   40290:	bf 01 00 00 00       	mov    $0x1,%edi
   40295:	e8 94 04 00 00       	callq  4072e <process_setup>
   4029a:	e9 c2 00 00 00       	jmpq   40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   4029f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402a4:	74 29                	je     402cf <kernel+0x134>
   402a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402aa:	be a5 3c 04 00       	mov    $0x43ca5,%esi
   402af:	48 89 c7             	mov    %rax,%rdi
   402b2:	e8 3f 31 00 00       	callq  433f6 <strcmp>
   402b7:	85 c0                	test   %eax,%eax
   402b9:	75 14                	jne    402cf <kernel+0x134>
        process_setup(1, 5);
   402bb:	be 05 00 00 00       	mov    $0x5,%esi
   402c0:	bf 01 00 00 00       	mov    $0x1,%edi
   402c5:	e8 64 04 00 00       	callq  4072e <process_setup>
   402ca:	e9 92 00 00 00       	jmpq   40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   402cf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402d4:	74 26                	je     402fc <kernel+0x161>
   402d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402da:	be ae 3c 04 00       	mov    $0x43cae,%esi
   402df:	48 89 c7             	mov    %rax,%rdi
   402e2:	e8 0f 31 00 00       	callq  433f6 <strcmp>
   402e7:	85 c0                	test   %eax,%eax
   402e9:	75 11                	jne    402fc <kernel+0x161>
        process_setup(1, 6);
   402eb:	be 06 00 00 00       	mov    $0x6,%esi
   402f0:	bf 01 00 00 00       	mov    $0x1,%edi
   402f5:	e8 34 04 00 00       	callq  4072e <process_setup>
   402fa:	eb 65                	jmp    40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   402fc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40301:	74 39                	je     4033c <kernel+0x1a1>
   40303:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40307:	be b3 3c 04 00       	mov    $0x43cb3,%esi
   4030c:	48 89 c7             	mov    %rax,%rdi
   4030f:	e8 e2 30 00 00       	callq  433f6 <strcmp>
   40314:	85 c0                	test   %eax,%eax
   40316:	75 24                	jne    4033c <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   40318:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   4031f:	eb 13                	jmp    40334 <kernel+0x199>
            process_setup(i, 6);
   40321:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40324:	be 06 00 00 00       	mov    $0x6,%esi
   40329:	89 c7                	mov    %eax,%edi
   4032b:	e8 fe 03 00 00       	callq  4072e <process_setup>
        for (pid_t i = 1; i <= 2; ++i) {
   40330:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   40334:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   40338:	7e e7                	jle    40321 <kernel+0x186>
   4033a:	eb 25                	jmp    40361 <kernel+0x1c6>
        }
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   4033c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   40343:	eb 16                	jmp    4035b <kernel+0x1c0>
            process_setup(i, i - 1);
   40345:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40348:	8d 50 ff             	lea    -0x1(%rax),%edx
   4034b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4034e:	89 d6                	mov    %edx,%esi
   40350:	89 c7                	mov    %eax,%edi
   40352:	e8 d7 03 00 00       	callq  4072e <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   40357:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4035b:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   4035f:	7e e4                	jle    40345 <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   40361:	bf 00 e1 04 00       	mov    $0x4e100,%edi
   40366:	e8 d8 0b 00 00       	callq  40f43 <run>

000000000004036b <get_free_page_number>:
}

int get_free_page_number() {
   4036b:	55                   	push   %rbp
   4036c:	48 89 e5             	mov    %rsp,%rbp
   4036f:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   40373:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4037a:	eb 1a                	jmp    40396 <get_free_page_number+0x2b>
        if (pageinfo[i].owner == PO_FREE) return i;
   4037c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4037f:	48 98                	cltq   
   40381:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   40388:	00 
   40389:	84 c0                	test   %al,%al
   4038b:	75 05                	jne    40392 <get_free_page_number+0x27>
   4038d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40390:	eb 12                	jmp    403a4 <get_free_page_number+0x39>
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   40392:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40396:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   4039d:	7e dd                	jle    4037c <get_free_page_number+0x11>
    }
    return -1;
   4039f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   403a4:	c9                   	leaveq 
   403a5:	c3                   	retq   

00000000000403a6 <copy_kernel_mapping>:

void copy_kernel_mapping(x86_64_pagetable *pt) {
   403a6:	55                   	push   %rbp
   403a7:	48 89 e5             	mov    %rsp,%rbp
   403aa:	48 83 ec 30          	sub    $0x30,%rsp
   403ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   403b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   403b9:	eb 44                	jmp    403ff <copy_kernel_mapping+0x59>
        vamapping map = virtual_memory_lookup(kernel_pagetable, va);
   403bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403be:	48 63 d0             	movslq %eax,%rdx
   403c1:	48 8b 0d 38 0c 01 00 	mov    0x10c38(%rip),%rcx        # 51000 <kernel_pagetable>
   403c8:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   403cc:	48 89 ce             	mov    %rcx,%rsi
   403cf:	48 89 c7             	mov    %rax,%rdi
   403d2:	e8 15 2b 00 00       	callq  42eec <virtual_memory_lookup>
        virtual_memory_map(pt, va, map.pa, PAGESIZE, map.perm);
   403d7:	8b 4d f0             	mov    -0x10(%rbp),%ecx
   403da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   403de:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403e1:	48 63 f0             	movslq %eax,%rsi
   403e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   403e8:	41 89 c8             	mov    %ecx,%r8d
   403eb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   403f0:	48 89 c7             	mov    %rax,%rdi
   403f3:	e8 39 27 00 00       	callq  42b31 <virtual_memory_map>
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   403f8:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
   403ff:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%rbp)
   40406:	7e b3                	jle    403bb <copy_kernel_mapping+0x15>
    }
}
   40408:	90                   	nop
   40409:	90                   	nop
   4040a:	c9                   	leaveq 
   4040b:	c3                   	retq   

000000000004040c <alloc_pt>:

x86_64_pagetable *alloc_pt(pid_t pid) {
   4040c:	55                   	push   %rbp
   4040d:	48 89 e5             	mov    %rsp,%rbp
   40410:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   40414:	89 7d 8c             	mov    %edi,-0x74(%rbp)
    size_t sz_pt = sizeof(struct x86_64_pagetable);
   40417:	48 c7 45 f8 00 10 00 	movq   $0x1000,-0x8(%rbp)
   4041e:	00 
    int i = 5;
   4041f:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%rbp)

// L1
    int page_number = get_free_page_number();
   40426:	b8 00 00 00 00       	mov    $0x0,%eax
   4042b:	e8 3b ff ff ff       	callq  4036b <get_free_page_number>
   40430:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) return NULL;
   40433:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40437:	75 0a                	jne    40443 <alloc_pt+0x37>
   40439:	b8 00 00 00 00       	mov    $0x0,%eax
   4043e:	e9 e9 02 00 00       	jmpq   4072c <alloc_pt+0x320>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   40443:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40446:	48 98                	cltq   
   40448:	48 c1 e0 0c          	shl    $0xc,%rax
   4044c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   40450:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40453:	0f be d0             	movsbl %al,%edx
   40456:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4045a:	89 d6                	mov    %edx,%esi
   4045c:	48 89 c7             	mov    %rax,%rdi
   4045f:	e8 91 04 00 00       	callq  408f5 <assign_physical_page>
   40464:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40467:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4046b:	75 0a                	jne    40477 <alloc_pt+0x6b>
   4046d:	b8 00 00 00 00       	mov    $0x0,%eax
   40472:	e9 b5 02 00 00       	jmpq   4072c <alloc_pt+0x320>

    memset((void *) l1_addr, 0, sz_pt);
   40477:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4047b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4047f:	be 00 00 00 00       	mov    $0x0,%esi
   40484:	48 89 c7             	mov    %rax,%rdi
   40487:	e8 f9 2e 00 00       	callq  43385 <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   4048c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40490:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    
// L2
    page_number = get_free_page_number();
   40494:	b8 00 00 00 00       	mov    $0x0,%eax
   40499:	e8 cd fe ff ff       	callq  4036b <get_free_page_number>
   4049e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   404a1:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   404a5:	75 16                	jne    404bd <alloc_pt+0xb1>
        free_pt(l1);
   404a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   404ab:	48 89 c7             	mov    %rax,%rdi
   404ae:	e8 b4 fc ff ff       	callq  40167 <free_pt>
        return NULL;
   404b3:	b8 00 00 00 00       	mov    $0x0,%eax
   404b8:	e9 6f 02 00 00       	jmpq   4072c <alloc_pt+0x320>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   404bd:	8b 45 f0             	mov    -0x10(%rbp),%eax
   404c0:	48 98                	cltq   
   404c2:	48 c1 e0 0c          	shl    $0xc,%rax
   404c6:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

    page_result = assign_physical_page(l2_addr, pid);
   404ca:	8b 45 8c             	mov    -0x74(%rbp),%eax
   404cd:	0f be d0             	movsbl %al,%edx
   404d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   404d4:	89 d6                	mov    %edx,%esi
   404d6:	48 89 c7             	mov    %rax,%rdi
   404d9:	e8 17 04 00 00       	callq  408f5 <assign_physical_page>
   404de:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   404e1:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   404e5:	75 0a                	jne    404f1 <alloc_pt+0xe5>
   404e7:	b8 00 00 00 00       	mov    $0x0,%eax
   404ec:	e9 3b 02 00 00       	jmpq   4072c <alloc_pt+0x320>

    memset((void *) l2_addr, 0, sz_pt);
   404f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   404f5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   404f9:	be 00 00 00 00       	mov    $0x0,%esi
   404fe:	48 89 c7             	mov    %rax,%rdi
   40501:	e8 7f 2e 00 00       	callq  43385 <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   40506:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4050a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

// L3
    page_number = get_free_page_number();
   4050e:	b8 00 00 00 00       	mov    $0x0,%eax
   40513:	e8 53 fe ff ff       	callq  4036b <get_free_page_number>
   40518:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   4051b:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   4051f:	75 22                	jne    40543 <alloc_pt+0x137>
        free_pt(l1); free_pt(l2);
   40521:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40525:	48 89 c7             	mov    %rax,%rdi
   40528:	e8 3a fc ff ff       	callq  40167 <free_pt>
   4052d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40531:	48 89 c7             	mov    %rax,%rdi
   40534:	e8 2e fc ff ff       	callq  40167 <free_pt>
        return NULL;
   40539:	b8 00 00 00 00       	mov    $0x0,%eax
   4053e:	e9 e9 01 00 00       	jmpq   4072c <alloc_pt+0x320>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   40543:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40546:	48 98                	cltq   
   40548:	48 c1 e0 0c          	shl    $0xc,%rax
   4054c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    page_result = assign_physical_page(l3_addr, pid);
   40550:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40553:	0f be d0             	movsbl %al,%edx
   40556:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4055a:	89 d6                	mov    %edx,%esi
   4055c:	48 89 c7             	mov    %rax,%rdi
   4055f:	e8 91 03 00 00       	callq  408f5 <assign_physical_page>
   40564:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40567:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4056b:	75 0a                	jne    40577 <alloc_pt+0x16b>
   4056d:	b8 00 00 00 00       	mov    $0x0,%eax
   40572:	e9 b5 01 00 00       	jmpq   4072c <alloc_pt+0x320>

    memset((void *) l3_addr, 0, sz_pt);
   40577:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4057b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4057f:	be 00 00 00 00       	mov    $0x0,%esi
   40584:	48 89 c7             	mov    %rax,%rdi
   40587:	e8 f9 2d 00 00       	callq  43385 <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   4058c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40590:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

// L4i
    page_number = get_free_page_number();
   40594:	b8 00 00 00 00       	mov    $0x0,%eax
   40599:	e8 cd fd ff ff       	callq  4036b <get_free_page_number>
   4059e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   405a1:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   405a5:	75 2e                	jne    405d5 <alloc_pt+0x1c9>
        free_pt(l1); free_pt(l2); free_pt(l3);
   405a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   405ab:	48 89 c7             	mov    %rax,%rdi
   405ae:	e8 b4 fb ff ff       	callq  40167 <free_pt>
   405b3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   405b7:	48 89 c7             	mov    %rax,%rdi
   405ba:	e8 a8 fb ff ff       	callq  40167 <free_pt>
   405bf:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   405c3:	48 89 c7             	mov    %rax,%rdi
   405c6:	e8 9c fb ff ff       	callq  40167 <free_pt>
        return NULL;
   405cb:	b8 00 00 00 00       	mov    $0x0,%eax
   405d0:	e9 57 01 00 00       	jmpq   4072c <alloc_pt+0x320>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   405d5:	8b 45 f0             	mov    -0x10(%rbp),%eax
   405d8:	48 98                	cltq   
   405da:	48 c1 e0 0c          	shl    $0xc,%rax
   405de:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

    page_result = assign_physical_page(l4i_addr, pid);
   405e2:	8b 45 8c             	mov    -0x74(%rbp),%eax
   405e5:	0f be d0             	movsbl %al,%edx
   405e8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   405ec:	89 d6                	mov    %edx,%esi
   405ee:	48 89 c7             	mov    %rax,%rdi
   405f1:	e8 ff 02 00 00       	callq  408f5 <assign_physical_page>
   405f6:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   405f9:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   405fd:	75 0a                	jne    40609 <alloc_pt+0x1fd>
   405ff:	b8 00 00 00 00       	mov    $0x0,%eax
   40604:	e9 23 01 00 00       	jmpq   4072c <alloc_pt+0x320>

    memset((void *) l4i_addr, 0, sz_pt);
   40609:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4060d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40611:	be 00 00 00 00       	mov    $0x0,%esi
   40616:	48 89 c7             	mov    %rax,%rdi
   40619:	e8 67 2d 00 00       	callq  43385 <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   4061e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40622:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

// L4j
    page_number = get_free_page_number();
   40626:	b8 00 00 00 00       	mov    $0x0,%eax
   4062b:	e8 3b fd ff ff       	callq  4036b <get_free_page_number>
   40630:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40633:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40637:	75 3a                	jne    40673 <alloc_pt+0x267>
        free_pt(l1); free_pt(l2); free_pt(l3); free_pt(l4i);
   40639:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4063d:	48 89 c7             	mov    %rax,%rdi
   40640:	e8 22 fb ff ff       	callq  40167 <free_pt>
   40645:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40649:	48 89 c7             	mov    %rax,%rdi
   4064c:	e8 16 fb ff ff       	callq  40167 <free_pt>
   40651:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40655:	48 89 c7             	mov    %rax,%rdi
   40658:	e8 0a fb ff ff       	callq  40167 <free_pt>
   4065d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40661:	48 89 c7             	mov    %rax,%rdi
   40664:	e8 fe fa ff ff       	callq  40167 <free_pt>
        return NULL;
   40669:	b8 00 00 00 00       	mov    $0x0,%eax
   4066e:	e9 b9 00 00 00       	jmpq   4072c <alloc_pt+0x320>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   40673:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40676:	48 98                	cltq   
   40678:	48 c1 e0 0c          	shl    $0xc,%rax
   4067c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

    page_result = assign_physical_page(l4j_addr, pid);
   40680:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40683:	0f be d0             	movsbl %al,%edx
   40686:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4068a:	89 d6                	mov    %edx,%esi
   4068c:	48 89 c7             	mov    %rax,%rdi
   4068f:	e8 61 02 00 00       	callq  408f5 <assign_physical_page>
   40694:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40697:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4069b:	75 0a                	jne    406a7 <alloc_pt+0x29b>
   4069d:	b8 00 00 00 00       	mov    $0x0,%eax
   406a2:	e9 85 00 00 00       	jmpq   4072c <alloc_pt+0x320>

    memset((void *) l4j_addr, 0, sz_pt);
   406a7:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   406ab:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   406af:	be 00 00 00 00       	mov    $0x0,%esi
   406b4:	48 89 c7             	mov    %rax,%rdi
   406b7:	e8 c9 2c 00 00       	callq  43385 <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   406bc:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   406c0:	48 89 45 98          	mov    %rax,-0x68(%rbp)

// Linking

    int user_perms = PTE_U | PTE_P | PTE_W;
   406c4:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%rbp)

    l1->entry[0] = (x86_64_pageentry_t) l2 | user_perms;
   406cb:	8b 45 94             	mov    -0x6c(%rbp),%eax
   406ce:	48 63 d0             	movslq %eax,%rdx
   406d1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   406d5:	48 09 c2             	or     %rax,%rdx
   406d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   406dc:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = (x86_64_pageentry_t) l3 | user_perms;
   406df:	8b 45 94             	mov    -0x6c(%rbp),%eax
   406e2:	48 63 d0             	movslq %eax,%rdx
   406e5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   406e9:	48 09 c2             	or     %rax,%rdx
   406ec:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   406f0:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = (x86_64_pageentry_t) l4i | user_perms;
   406f3:	8b 45 94             	mov    -0x6c(%rbp),%eax
   406f6:	48 63 d0             	movslq %eax,%rdx
   406f9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   406fd:	48 09 c2             	or     %rax,%rdx
   40700:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40704:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = (x86_64_pageentry_t) l4j | user_perms;
   40707:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4070a:	48 63 d0             	movslq %eax,%rdx
   4070d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40711:	48 09 c2             	or     %rax,%rdx
   40714:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40718:	48 89 50 08          	mov    %rdx,0x8(%rax)


    copy_kernel_mapping(l1);
   4071c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40720:	48 89 c7             	mov    %rax,%rdi
   40723:	e8 7e fc ff ff       	callq  403a6 <copy_kernel_mapping>
    return l1;
   40728:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
}
   4072c:	c9                   	leaveq 
   4072d:	c3                   	retq   

000000000004072e <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   4072e:	55                   	push   %rbp
   4072f:	48 89 e5             	mov    %rsp,%rbp
   40732:	48 83 ec 40          	sub    $0x40,%rsp
   40736:	89 7d cc             	mov    %edi,-0x34(%rbp)
   40739:	89 75 c8             	mov    %esi,-0x38(%rbp)
    process_init(&processes[pid], 0);
   4073c:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4073f:	48 63 d0             	movslq %eax,%rdx
   40742:	48 89 d0             	mov    %rdx,%rax
   40745:	48 c1 e0 03          	shl    $0x3,%rax
   40749:	48 29 d0             	sub    %rdx,%rax
   4074c:	48 c1 e0 05          	shl    $0x5,%rax
   40750:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   40756:	be 00 00 00 00       	mov    $0x0,%esi
   4075b:	48 89 c7             	mov    %rax,%rdi
   4075e:	e8 12 19 00 00       	callq  42075 <process_init>

    x86_64_pagetable *pt = alloc_pt(pid);
   40763:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40766:	89 c7                	mov    %eax,%edi
   40768:	e8 9f fc ff ff       	callq  4040c <alloc_pt>
   4076d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   40771:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   40776:	0f 84 76 01 00 00    	je     408f2 <process_setup+0x1c4>

    processes[pid].p_pagetable = pt;
   4077c:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4077f:	48 63 d0             	movslq %eax,%rdx
   40782:	48 89 d0             	mov    %rdx,%rax
   40785:	48 c1 e0 03          	shl    $0x3,%rax
   40789:	48 29 d0             	sub    %rdx,%rax
   4078c:	48 c1 e0 05          	shl    $0x5,%rax
   40790:	48 8d 90 f0 e0 04 00 	lea    0x4e0f0(%rax),%rdx
   40797:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4079b:	48 89 02             	mov    %rax,(%rdx)
    int r = program_load(&processes[pid], program_number, NULL);
   4079e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407a1:	48 63 d0             	movslq %eax,%rdx
   407a4:	48 89 d0             	mov    %rdx,%rax
   407a7:	48 c1 e0 03          	shl    $0x3,%rax
   407ab:	48 29 d0             	sub    %rdx,%rax
   407ae:	48 c1 e0 05          	shl    $0x5,%rax
   407b2:	48 8d 88 20 e0 04 00 	lea    0x4e020(%rax),%rcx
   407b9:	8b 45 c8             	mov    -0x38(%rbp),%eax
   407bc:	ba 00 00 00 00       	mov    $0x0,%edx
   407c1:	89 c6                	mov    %eax,%esi
   407c3:	48 89 cf             	mov    %rcx,%rdi
   407c6:	e8 18 28 00 00       	callq  42fe3 <program_load>
   407cb:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   407ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   407d2:	79 14                	jns    407e8 <process_setup+0xba>
   407d4:	ba b9 3c 04 00       	mov    $0x43cb9,%edx
   407d9:	be fa 00 00 00       	mov    $0xfa,%esi
   407de:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   407e3:	e8 4a 20 00 00       	callq  42832 <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   407e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407eb:	48 63 d0             	movslq %eax,%rdx
   407ee:	48 89 d0             	mov    %rdx,%rax
   407f1:	48 c1 e0 03          	shl    $0x3,%rax
   407f5:	48 29 d0             	sub    %rdx,%rax
   407f8:	48 c1 e0 05          	shl    $0x5,%rax
   407fc:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   40802:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40809:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4080c:	48 63 d0             	movslq %eax,%rdx
   4080f:	48 89 d0             	mov    %rdx,%rax
   40812:	48 c1 e0 03          	shl    $0x3,%rax
   40816:	48 29 d0             	sub    %rdx,%rax
   40819:	48 c1 e0 05          	shl    $0x5,%rax
   4081d:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   40823:	48 8b 00             	mov    (%rax),%rax
   40826:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   4082c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int stack_page_number = get_free_page_number();
   40830:	b8 00 00 00 00       	mov    $0x0,%eax
   40835:	e8 31 fb ff ff       	callq  4036b <get_free_page_number>
   4083a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (stack_page_number == -1) {
   4083d:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40841:	75 11                	jne    40854 <process_setup+0x126>
        free_pt(pt);
   40843:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40847:	48 89 c7             	mov    %rax,%rdi
   4084a:	e8 18 f9 ff ff       	callq  40167 <free_pt>
        return;
   4084f:	e9 9f 00 00 00       	jmpq   408f3 <process_setup+0x1c5>
    }
    uintptr_t stack_addr = PAGEADDRESS(stack_page_number);
   40854:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40857:	48 98                	cltq   
   40859:	48 c1 e0 0c          	shl    $0xc,%rax
   4085d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int assign_status = assign_physical_page(stack_addr, pid);
   40861:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40864:	0f be d0             	movsbl %al,%edx
   40867:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4086b:	89 d6                	mov    %edx,%esi
   4086d:	48 89 c7             	mov    %rax,%rdi
   40870:	e8 80 00 00 00       	callq  408f5 <assign_physical_page>
   40875:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (assign_status == -1) {
   40878:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   4087c:	75 1a                	jne    40898 <process_setup+0x16a>
        free_pt(pt); free_pt((x86_64_pagetable *) stack_addr);
   4087e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40882:	48 89 c7             	mov    %rax,%rdi
   40885:	e8 dd f8 ff ff       	callq  40167 <free_pt>
   4088a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4088e:	48 89 c7             	mov    %rax,%rdi
   40891:	e8 d1 f8 ff ff       	callq  40167 <free_pt>
        return;
   40896:	eb 5b                	jmp    408f3 <process_setup+0x1c5>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_addr,
   40898:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4089b:	48 63 d0             	movslq %eax,%rdx
   4089e:	48 89 d0             	mov    %rdx,%rax
   408a1:	48 c1 e0 03          	shl    $0x3,%rax
   408a5:	48 29 d0             	sub    %rdx,%rax
   408a8:	48 c1 e0 05          	shl    $0x5,%rax
   408ac:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   408b2:	48 8b 00             	mov    (%rax),%rax
   408b5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   408b9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   408bd:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   408c3:	b9 00 10 00 00       	mov    $0x1000,%ecx
   408c8:	48 89 c7             	mov    %rax,%rdi
   408cb:	e8 61 22 00 00       	callq  42b31 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   408d0:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408d3:	48 63 d0             	movslq %eax,%rdx
   408d6:	48 89 d0             	mov    %rdx,%rax
   408d9:	48 c1 e0 03          	shl    $0x3,%rax
   408dd:	48 29 d0             	sub    %rdx,%rax
   408e0:	48 c1 e0 05          	shl    $0x5,%rax
   408e4:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   408ea:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   408f0:	eb 01                	jmp    408f3 <process_setup+0x1c5>
    if (pt == NULL) return;
   408f2:	90                   	nop
}
   408f3:	c9                   	leaveq 
   408f4:	c3                   	retq   

00000000000408f5 <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   408f5:	55                   	push   %rbp
   408f6:	48 89 e5             	mov    %rsp,%rbp
   408f9:	48 83 ec 10          	sub    $0x10,%rsp
   408fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40901:	89 f0                	mov    %esi,%eax
   40903:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   40906:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4090a:	25 ff 0f 00 00       	and    $0xfff,%eax
   4090f:	48 85 c0             	test   %rax,%rax
   40912:	75 20                	jne    40934 <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   40914:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4091b:	00 
   4091c:	77 16                	ja     40934 <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   4091e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40922:	48 c1 e8 0c          	shr    $0xc,%rax
   40926:	48 98                	cltq   
   40928:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4092f:	00 
   40930:	84 c0                	test   %al,%al
   40932:	74 07                	je     4093b <assign_physical_page+0x46>
        return -1;
   40934:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40939:	eb 2c                	jmp    40967 <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   4093b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4093f:	48 c1 e8 0c          	shr    $0xc,%rax
   40943:	48 98                	cltq   
   40945:	c6 84 00 41 ee 04 00 	movb   $0x1,0x4ee41(%rax,%rax,1)
   4094c:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   4094d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40951:	48 c1 e8 0c          	shr    $0xc,%rax
   40955:	48 98                	cltq   
   40957:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   4095b:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        return 0;
   40962:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40967:	c9                   	leaveq 
   40968:	c3                   	retq   

0000000000040969 <syscall_mapping>:

void syscall_mapping(proc* p){
   40969:	55                   	push   %rbp
   4096a:	48 89 e5             	mov    %rsp,%rbp
   4096d:	48 83 ec 70          	sub    $0x70,%rsp
   40971:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40975:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40979:	48 8b 40 38          	mov    0x38(%rax),%rax
   4097d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40981:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40985:	48 8b 40 30          	mov    0x30(%rax),%rax
   40989:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   4098d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40991:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40998:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4099c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   409a0:	48 89 ce             	mov    %rcx,%rsi
   409a3:	48 89 c7             	mov    %rax,%rdi
   409a6:	e8 41 25 00 00       	callq  42eec <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   409ab:	8b 45 e0             	mov    -0x20(%rbp),%eax
   409ae:	48 98                	cltq   
   409b0:	83 e0 06             	and    $0x6,%eax
   409b3:	48 83 f8 06          	cmp    $0x6,%rax
   409b7:	75 73                	jne    40a2c <syscall_mapping+0xc3>
	return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   409b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409bd:	48 83 c0 17          	add    $0x17,%rax
   409c1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   409c5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   409c9:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   409d0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   409d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   409d8:	48 89 ce             	mov    %rcx,%rsi
   409db:	48 89 c7             	mov    %rax,%rdi
   409de:	e8 09 25 00 00       	callq  42eec <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   409e3:	8b 45 c8             	mov    -0x38(%rbp),%eax
   409e6:	48 98                	cltq   
   409e8:	83 e0 03             	and    $0x3,%eax
   409eb:	48 83 f8 03          	cmp    $0x3,%rax
   409ef:	75 3e                	jne    40a2f <syscall_mapping+0xc6>
	return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   409f1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   409f5:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   409fc:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a00:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40a04:	48 89 ce             	mov    %rcx,%rsi
   40a07:	48 89 c7             	mov    %rax,%rdi
   40a0a:	e8 dd 24 00 00       	callq  42eec <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40a0f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40a13:	48 89 c1             	mov    %rax,%rcx
   40a16:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a1a:	ba 18 00 00 00       	mov    $0x18,%edx
   40a1f:	48 89 c6             	mov    %rax,%rsi
   40a22:	48 89 cf             	mov    %rcx,%rdi
   40a25:	e8 f2 28 00 00       	callq  4331c <memcpy>
   40a2a:	eb 04                	jmp    40a30 <syscall_mapping+0xc7>
	return;
   40a2c:	90                   	nop
   40a2d:	eb 01                	jmp    40a30 <syscall_mapping+0xc7>
	return;
   40a2f:	90                   	nop
}
   40a30:	c9                   	leaveq 
   40a31:	c3                   	retq   

0000000000040a32 <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40a32:	55                   	push   %rbp
   40a33:	48 89 e5             	mov    %rsp,%rbp
   40a36:	48 83 ec 18          	sub    $0x18,%rsp
   40a3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40a3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a42:	48 8b 40 38          	mov    0x38(%rax),%rax
   40a46:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40a49:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40a4d:	75 14                	jne    40a63 <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40a4f:	0f b6 05 aa 45 00 00 	movzbl 0x45aa(%rip),%eax        # 45000 <disp_global>
   40a56:	84 c0                	test   %al,%al
   40a58:	0f 94 c0             	sete   %al
   40a5b:	88 05 9f 45 00 00    	mov    %al,0x459f(%rip)        # 45000 <disp_global>
   40a61:	eb 36                	jmp    40a99 <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   40a63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40a67:	78 2f                	js     40a98 <syscall_mem_tog+0x66>
   40a69:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40a6d:	7f 29                	jg     40a98 <syscall_mem_tog+0x66>
   40a6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a73:	8b 00                	mov    (%rax),%eax
   40a75:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40a78:	75 1e                	jne    40a98 <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40a7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a7e:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40a85:	84 c0                	test   %al,%al
   40a87:	0f 94 c0             	sete   %al
   40a8a:	89 c2                	mov    %eax,%edx
   40a8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a90:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40a96:	eb 01                	jmp    40a99 <syscall_mem_tog+0x67>
            return;
   40a98:	90                   	nop
    }
}
   40a99:	c9                   	leaveq 
   40a9a:	c3                   	retq   

0000000000040a9b <get_free_process_slot>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

int get_free_process_slot() {
   40a9b:	55                   	push   %rbp
   40a9c:	48 89 e5             	mov    %rsp,%rbp
   40a9f:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 1; i < NPROC; i++) {
   40aa3:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40aaa:	eb 29                	jmp    40ad5 <get_free_process_slot+0x3a>
        if (processes[i].p_state == P_FREE) return i;
   40aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40aaf:	48 63 d0             	movslq %eax,%rdx
   40ab2:	48 89 d0             	mov    %rdx,%rax
   40ab5:	48 c1 e0 03          	shl    $0x3,%rax
   40ab9:	48 29 d0             	sub    %rdx,%rax
   40abc:	48 c1 e0 05          	shl    $0x5,%rax
   40ac0:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40ac6:	8b 00                	mov    (%rax),%eax
   40ac8:	85 c0                	test   %eax,%eax
   40aca:	75 05                	jne    40ad1 <get_free_process_slot+0x36>
   40acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40acf:	eb 0f                	jmp    40ae0 <get_free_process_slot+0x45>
    for (int i = 1; i < NPROC; i++) {
   40ad1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40ad5:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40ad9:	7e d1                	jle    40aac <get_free_process_slot+0x11>
    }
    return -1;
   40adb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40ae0:	c9                   	leaveq 
   40ae1:	c3                   	retq   

0000000000040ae2 <exception>:

void exception(x86_64_registers* reg) {
   40ae2:	55                   	push   %rbp
   40ae3:	48 89 e5             	mov    %rsp,%rbp
   40ae6:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
   40aed:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40af4:	48 8b 05 05 d5 00 00 	mov    0xd505(%rip),%rax        # 4e000 <current>
   40afb:	48 8b 95 e8 fe ff ff 	mov    -0x118(%rbp),%rdx
   40b02:	48 83 c0 08          	add    $0x8,%rax
   40b06:	48 89 d6             	mov    %rdx,%rsi
   40b09:	ba 18 00 00 00       	mov    $0x18,%edx
   40b0e:	48 89 c7             	mov    %rax,%rdi
   40b11:	48 89 d1             	mov    %rdx,%rcx
   40b14:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40b17:	48 8b 05 e2 04 01 00 	mov    0x104e2(%rip),%rax        # 51000 <kernel_pagetable>
   40b1e:	48 89 c7             	mov    %rax,%rdi
   40b21:	e8 da 1e 00 00       	callq  42a00 <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40b26:	8b 05 d0 84 07 00    	mov    0x784d0(%rip),%eax        # b8ffc <cursorpos>
   40b2c:	89 c7                	mov    %eax,%edi
   40b2e:	e8 01 16 00 00       	callq  42134 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40b33:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40b3a:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b41:	48 83 f8 0e          	cmp    $0xe,%rax
   40b45:	74 14                	je     40b5b <exception+0x79>
   40b47:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40b4e:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b55:	48 83 f8 0d          	cmp    $0xd,%rax
   40b59:	75 16                	jne    40b71 <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40b5b:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40b62:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40b69:	83 e0 04             	and    $0x4,%eax
   40b6c:	48 85 c0             	test   %rax,%rax
   40b6f:	74 1a                	je     40b8b <exception+0xa9>
    {
        check_virtual_memory();
   40b71:	e8 c1 07 00 00       	callq  41337 <check_virtual_memory>
        if(disp_global){
   40b76:	0f b6 05 83 44 00 00 	movzbl 0x4483(%rip),%eax        # 45000 <disp_global>
   40b7d:	84 c0                	test   %al,%al
   40b7f:	74 0a                	je     40b8b <exception+0xa9>
            memshow_physical();
   40b81:	e8 29 09 00 00       	callq  414af <memshow_physical>
            memshow_virtual_animate();
   40b86:	e8 4f 0c 00 00       	callq  417da <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40b8b:	e8 81 1a 00 00       	callq  42611 <check_keyboard>


    // Actually handle the exception.
    switch (reg->reg_intno) {
   40b90:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40b97:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b9e:	48 83 e8 0e          	sub    $0xe,%rax
   40ba2:	48 83 f8 2a          	cmp    $0x2a,%rax
   40ba6:	0f 87 ea 02 00 00    	ja     40e96 <exception+0x3b4>
   40bac:	48 8b 04 c5 58 3d 04 	mov    0x43d58(,%rax,8),%rax
   40bb3:	00 
   40bb4:	ff e0                	jmpq   *%rax
    case INT_SYS_FORK:
        int process_slot = get_free_process_slot();
   40bb6:	b8 00 00 00 00       	mov    $0x0,%eax
   40bbb:	e8 db fe ff ff       	callq  40a9b <get_free_process_slot>
   40bc0:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (process_slot == -1) {
   40bc3:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%rbp)
   40bc7:	0f 85 da 02 00 00    	jne    40ea7 <exception+0x3c5>
            current->p_registers.reg_rax = -1; break;
   40bcd:	48 8b 05 2c d4 00 00 	mov    0xd42c(%rip),%rax        # 4e000 <current>
   40bd4:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40bdb:	ff 
   40bdc:	e9 c7 02 00 00       	jmpq   40ea8 <exception+0x3c6>
        break;
    case INT_SYS_PANIC:
	    // rdi stores pointer for msg string
	    {
		char msg[160];
		uintptr_t addr = current->p_registers.reg_rdi;
   40be1:	48 8b 05 18 d4 00 00 	mov    0xd418(%rip),%rax        # 4e000 <current>
   40be8:	48 8b 40 38          	mov    0x38(%rax),%rax
   40bec:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
		if((void *)addr == NULL)
   40bf0:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   40bf5:	75 0f                	jne    40c06 <exception+0x124>
		    panic(NULL);
   40bf7:	bf 00 00 00 00       	mov    $0x0,%edi
   40bfc:	b8 00 00 00 00       	mov    $0x0,%eax
   40c01:	e8 4c 1b 00 00       	callq  42752 <panic>
		vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40c06:	48 8b 05 f3 d3 00 00 	mov    0xd3f3(%rip),%rax        # 4e000 <current>
   40c0d:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40c14:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   40c18:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   40c1c:	48 89 ce             	mov    %rcx,%rsi
   40c1f:	48 89 c7             	mov    %rax,%rdi
   40c22:	e8 c5 22 00 00       	callq  42eec <virtual_memory_lookup>
		memcpy(msg, (void *)map.pa, 160);
   40c27:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40c2b:	48 89 c1             	mov    %rax,%rcx
   40c2e:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
   40c35:	ba a0 00 00 00       	mov    $0xa0,%edx
   40c3a:	48 89 ce             	mov    %rcx,%rsi
   40c3d:	48 89 c7             	mov    %rax,%rdi
   40c40:	e8 d7 26 00 00       	callq  4331c <memcpy>
		panic(msg);
   40c45:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
   40c4c:	48 89 c7             	mov    %rax,%rdi
   40c4f:	b8 00 00 00 00       	mov    $0x0,%eax
   40c54:	e8 f9 1a 00 00       	callq  42752 <panic>
	    }
	    panic(NULL);
	    break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40c59:	48 8b 05 a0 d3 00 00 	mov    0xd3a0(%rip),%rax        # 4e000 <current>
   40c60:	8b 10                	mov    (%rax),%edx
   40c62:	48 8b 05 97 d3 00 00 	mov    0xd397(%rip),%rax        # 4e000 <current>
   40c69:	48 63 d2             	movslq %edx,%rdx
   40c6c:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40c70:	e9 33 02 00 00       	jmpq   40ea8 <exception+0x3c6>

    case INT_SYS_YIELD:
        schedule();
   40c75:	e8 57 02 00 00       	callq  40ed1 <schedule>
        break;                  /* will not be reached */
   40c7a:	e9 29 02 00 00       	jmpq   40ea8 <exception+0x3c6>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   40c7f:	48 8b 05 7a d3 00 00 	mov    0xd37a(%rip),%rax        # 4e000 <current>
   40c86:	48 8b 40 38          	mov    0x38(%rax),%rax
   40c8a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        int pn = get_free_page_number();
   40c8e:	b8 00 00 00 00       	mov    $0x0,%eax
   40c93:	e8 d3 f6 ff ff       	callq  4036b <get_free_page_number>
   40c98:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn == -1) {
   40c9b:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   40c9f:	75 14                	jne    40cb5 <exception+0x1d3>
            current->p_registers.reg_rax = -1; break;
   40ca1:	48 8b 05 58 d3 00 00 	mov    0xd358(%rip),%rax        # 4e000 <current>
   40ca8:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40caf:	ff 
   40cb0:	e9 f3 01 00 00       	jmpq   40ea8 <exception+0x3c6>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   40cb5:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40cb8:	48 98                	cltq   
   40cba:	48 c1 e0 0c          	shl    $0xc,%rax
   40cbe:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        if (addr < PROC_START_ADDR || addr > MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   40cc2:	48 81 7d f0 ff ff 0f 	cmpq   $0xfffff,-0x10(%rbp)
   40cc9:	00 
   40cca:	76 18                	jbe    40ce4 <exception+0x202>
   40ccc:	48 81 7d f0 00 00 30 	cmpq   $0x300000,-0x10(%rbp)
   40cd3:	00 
   40cd4:	77 0e                	ja     40ce4 <exception+0x202>
   40cd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   40cda:	25 ff 0f 00 00       	and    $0xfff,%eax
   40cdf:	48 85 c0             	test   %rax,%rax
   40ce2:	74 14                	je     40cf8 <exception+0x216>
            current->p_registers.reg_rax = -1; break;
   40ce4:	48 8b 05 15 d3 00 00 	mov    0xd315(%rip),%rax        # 4e000 <current>
   40ceb:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40cf2:	ff 
   40cf3:	e9 b0 01 00 00       	jmpq   40ea8 <exception+0x3c6>
        }
        
        int r = assign_physical_page(pa, current->p_pid);
   40cf8:	48 8b 05 01 d3 00 00 	mov    0xd301(%rip),%rax        # 4e000 <current>
   40cff:	8b 00                	mov    (%rax),%eax
   40d01:	0f be d0             	movsbl %al,%edx
   40d04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40d08:	89 d6                	mov    %edx,%esi
   40d0a:	48 89 c7             	mov    %rax,%rdi
   40d0d:	e8 e3 fb ff ff       	callq  408f5 <assign_physical_page>
   40d12:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (r >= 0) {
   40d15:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   40d19:	78 29                	js     40d44 <exception+0x262>
            virtual_memory_map(current->p_pagetable, addr, pa,
   40d1b:	48 8b 05 de d2 00 00 	mov    0xd2de(%rip),%rax        # 4e000 <current>
   40d22:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40d29:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   40d2d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40d31:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40d37:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40d3c:	48 89 c7             	mov    %rax,%rdi
   40d3f:	e8 ed 1d 00 00       	callq  42b31 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }
        current->p_registers.reg_rax = r;
   40d44:	48 8b 05 b5 d2 00 00 	mov    0xd2b5(%rip),%rax        # 4e000 <current>
   40d4b:	8b 55 dc             	mov    -0x24(%rbp),%edx
   40d4e:	48 63 d2             	movslq %edx,%rdx
   40d51:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40d55:	e9 4e 01 00 00       	jmpq   40ea8 <exception+0x3c6>
    }

    case INT_SYS_MAPPING:
    {
	    syscall_mapping(current);
   40d5a:	48 8b 05 9f d2 00 00 	mov    0xd29f(%rip),%rax        # 4e000 <current>
   40d61:	48 89 c7             	mov    %rax,%rdi
   40d64:	e8 00 fc ff ff       	callq  40969 <syscall_mapping>
            break;
   40d69:	e9 3a 01 00 00       	jmpq   40ea8 <exception+0x3c6>
    }

    case INT_SYS_MEM_TOG:
	{
	    syscall_mem_tog(current);
   40d6e:	48 8b 05 8b d2 00 00 	mov    0xd28b(%rip),%rax        # 4e000 <current>
   40d75:	48 89 c7             	mov    %rax,%rdi
   40d78:	e8 b5 fc ff ff       	callq  40a32 <syscall_mem_tog>
	    break;
   40d7d:	e9 26 01 00 00       	jmpq   40ea8 <exception+0x3c6>
	}

    case INT_TIMER:
        ++ticks;
   40d82:	8b 05 98 e0 00 00    	mov    0xe098(%rip),%eax        # 4ee20 <ticks>
   40d88:	83 c0 01             	add    $0x1,%eax
   40d8b:	89 05 8f e0 00 00    	mov    %eax,0xe08f(%rip)        # 4ee20 <ticks>
        schedule();
   40d91:	e8 3b 01 00 00       	callq  40ed1 <schedule>
        break;                  /* will not be reached */
   40d96:	e9 0d 01 00 00       	jmpq   40ea8 <exception+0x3c6>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40d9b:	0f 20 d0             	mov    %cr2,%rax
   40d9e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    return val;
   40da2:	48 8b 45 b0          	mov    -0x50(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40da6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   40daa:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40db1:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40db8:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   40dbb:	48 85 c0             	test   %rax,%rax
   40dbe:	74 07                	je     40dc7 <exception+0x2e5>
   40dc0:	b8 c9 3c 04 00       	mov    $0x43cc9,%eax
   40dc5:	eb 05                	jmp    40dcc <exception+0x2ea>
   40dc7:	b8 cf 3c 04 00       	mov    $0x43ccf,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   40dcc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   40dd0:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40dd7:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40dde:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   40de1:	48 85 c0             	test   %rax,%rax
   40de4:	74 07                	je     40ded <exception+0x30b>
   40de6:	b8 d4 3c 04 00       	mov    $0x43cd4,%eax
   40deb:	eb 05                	jmp    40df2 <exception+0x310>
   40ded:	b8 e7 3c 04 00       	mov    $0x43ce7,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   40df2:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   40df6:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40dfd:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40e04:	83 e0 04             	and    $0x4,%eax
   40e07:	48 85 c0             	test   %rax,%rax
   40e0a:	75 2f                	jne    40e3b <exception+0x359>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40e0c:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40e13:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40e1a:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40e1e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   40e22:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40e26:	49 89 f0             	mov    %rsi,%r8
   40e29:	48 89 c6             	mov    %rax,%rsi
   40e2c:	bf f8 3c 04 00       	mov    $0x43cf8,%edi
   40e31:	b8 00 00 00 00       	mov    $0x0,%eax
   40e36:	e8 17 19 00 00       	callq  42752 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40e3b:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40e42:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40e49:	48 8b 05 b0 d1 00 00 	mov    0xd1b0(%rip),%rax        # 4e000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40e50:	8b 00                	mov    (%rax),%eax
   40e52:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
   40e56:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   40e5a:	52                   	push   %rdx
   40e5b:	ff 75 b8             	pushq  -0x48(%rbp)
   40e5e:	49 89 f1             	mov    %rsi,%r9
   40e61:	49 89 c8             	mov    %rcx,%r8
   40e64:	89 c1                	mov    %eax,%ecx
   40e66:	ba 28 3d 04 00       	mov    $0x43d28,%edx
   40e6b:	be 00 0c 00 00       	mov    $0xc00,%esi
   40e70:	bf 80 07 00 00       	mov    $0x780,%edi
   40e75:	b8 00 00 00 00       	mov    $0x0,%eax
   40e7a:	e8 3b 2d 00 00       	callq  43bba <console_printf>
   40e7f:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40e83:	48 8b 05 76 d1 00 00 	mov    0xd176(%rip),%rax        # 4e000 <current>
   40e8a:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40e91:	00 00 00 
        break;
   40e94:	eb 12                	jmp    40ea8 <exception+0x3c6>
    }

    default:
        default_exception(current);
   40e96:	48 8b 05 63 d1 00 00 	mov    0xd163(%rip),%rax        # 4e000 <current>
   40e9d:	48 89 c7             	mov    %rax,%rdi
   40ea0:	e8 bd 19 00 00       	callq  42862 <default_exception>
        break;                  /* will not be reached */
   40ea5:	eb 01                	jmp    40ea8 <exception+0x3c6>
        break;
   40ea7:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   40ea8:	48 8b 05 51 d1 00 00 	mov    0xd151(%rip),%rax        # 4e000 <current>
   40eaf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40eb5:	83 f8 01             	cmp    $0x1,%eax
   40eb8:	75 0f                	jne    40ec9 <exception+0x3e7>
        run(current);
   40eba:	48 8b 05 3f d1 00 00 	mov    0xd13f(%rip),%rax        # 4e000 <current>
   40ec1:	48 89 c7             	mov    %rax,%rdi
   40ec4:	e8 7a 00 00 00       	callq  40f43 <run>
    } else {
        schedule();
   40ec9:	e8 03 00 00 00       	callq  40ed1 <schedule>
    }
}
   40ece:	90                   	nop
   40ecf:	c9                   	leaveq 
   40ed0:	c3                   	retq   

0000000000040ed1 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   40ed1:	55                   	push   %rbp
   40ed2:	48 89 e5             	mov    %rsp,%rbp
   40ed5:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40ed9:	48 8b 05 20 d1 00 00 	mov    0xd120(%rip),%rax        # 4e000 <current>
   40ee0:	8b 00                	mov    (%rax),%eax
   40ee2:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   40ee5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40ee8:	83 c0 01             	add    $0x1,%eax
   40eeb:	99                   	cltd   
   40eec:	c1 ea 1c             	shr    $0x1c,%edx
   40eef:	01 d0                	add    %edx,%eax
   40ef1:	83 e0 0f             	and    $0xf,%eax
   40ef4:	29 d0                	sub    %edx,%eax
   40ef6:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   40ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40efc:	48 63 d0             	movslq %eax,%rdx
   40eff:	48 89 d0             	mov    %rdx,%rax
   40f02:	48 c1 e0 03          	shl    $0x3,%rax
   40f06:	48 29 d0             	sub    %rdx,%rax
   40f09:	48 c1 e0 05          	shl    $0x5,%rax
   40f0d:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40f13:	8b 00                	mov    (%rax),%eax
   40f15:	83 f8 01             	cmp    $0x1,%eax
   40f18:	75 22                	jne    40f3c <schedule+0x6b>
            run(&processes[pid]);
   40f1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40f1d:	48 63 d0             	movslq %eax,%rdx
   40f20:	48 89 d0             	mov    %rdx,%rax
   40f23:	48 c1 e0 03          	shl    $0x3,%rax
   40f27:	48 29 d0             	sub    %rdx,%rax
   40f2a:	48 c1 e0 05          	shl    $0x5,%rax
   40f2e:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   40f34:	48 89 c7             	mov    %rax,%rdi
   40f37:	e8 07 00 00 00       	callq  40f43 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40f3c:	e8 d0 16 00 00       	callq  42611 <check_keyboard>
        pid = (pid + 1) % NPROC;
   40f41:	eb a2                	jmp    40ee5 <schedule+0x14>

0000000000040f43 <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   40f43:	55                   	push   %rbp
   40f44:	48 89 e5             	mov    %rsp,%rbp
   40f47:	48 83 ec 10          	sub    $0x10,%rsp
   40f4b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40f4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f53:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40f59:	83 f8 01             	cmp    $0x1,%eax
   40f5c:	74 14                	je     40f72 <run+0x2f>
   40f5e:	ba b0 3e 04 00       	mov    $0x43eb0,%edx
   40f63:	be f0 01 00 00       	mov    $0x1f0,%esi
   40f68:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   40f6d:	e8 c0 18 00 00       	callq  42832 <assert_fail>
    current = p;
   40f72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f76:	48 89 05 83 d0 00 00 	mov    %rax,0xd083(%rip)        # 4e000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40f7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f81:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40f88:	48 89 c7             	mov    %rax,%rdi
   40f8b:	e8 70 1a 00 00       	callq  42a00 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40f90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f94:	48 83 c0 08          	add    $0x8,%rax
   40f98:	48 89 c7             	mov    %rax,%rdi
   40f9b:	e8 23 f1 ff ff       	callq  400c3 <exception_return>

0000000000040fa0 <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   40fa0:	55                   	push   %rbp
   40fa1:	48 89 e5             	mov    %rsp,%rbp
   40fa4:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40fa8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40faf:	00 
   40fb0:	e9 81 00 00 00       	jmpq   41036 <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   40fb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40fb9:	48 89 c7             	mov    %rax,%rdi
   40fbc:	e8 ef 0e 00 00       	callq  41eb0 <physical_memory_isreserved>
   40fc1:	85 c0                	test   %eax,%eax
   40fc3:	74 09                	je     40fce <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   40fc5:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40fcc:	eb 2f                	jmp    40ffd <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   40fce:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40fd5:	00 
   40fd6:	76 0b                	jbe    40fe3 <pageinfo_init+0x43>
   40fd8:	b8 08 70 05 00       	mov    $0x57008,%eax
   40fdd:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40fe1:	72 0a                	jb     40fed <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   40fe3:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40fea:	00 
   40feb:	75 09                	jne    40ff6 <pageinfo_init+0x56>
            owner = PO_KERNEL;
   40fed:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40ff4:	eb 07                	jmp    40ffd <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   40ff6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40ffd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41001:	48 c1 e8 0c          	shr    $0xc,%rax
   41005:	89 c1                	mov    %eax,%ecx
   41007:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4100a:	89 c2                	mov    %eax,%edx
   4100c:	48 63 c1             	movslq %ecx,%rax
   4100f:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   41016:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   4101a:	0f 95 c2             	setne  %dl
   4101d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41021:	48 c1 e8 0c          	shr    $0xc,%rax
   41025:	48 98                	cltq   
   41027:	88 94 00 41 ee 04 00 	mov    %dl,0x4ee41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   4102e:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41035:	00 
   41036:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4103d:	00 
   4103e:	0f 86 71 ff ff ff    	jbe    40fb5 <pageinfo_init+0x15>
    }
}
   41044:	90                   	nop
   41045:	90                   	nop
   41046:	c9                   	leaveq 
   41047:	c3                   	retq   

0000000000041048 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   41048:	55                   	push   %rbp
   41049:	48 89 e5             	mov    %rsp,%rbp
   4104c:	48 83 ec 50          	sub    $0x50,%rsp
   41050:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   41054:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41058:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4105e:	48 89 c2             	mov    %rax,%rdx
   41061:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41065:	48 39 c2             	cmp    %rax,%rdx
   41068:	74 14                	je     4107e <check_page_table_mappings+0x36>
   4106a:	ba d0 3e 04 00       	mov    $0x43ed0,%edx
   4106f:	be 1a 02 00 00       	mov    $0x21a,%esi
   41074:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41079:	e8 b4 17 00 00       	callq  42832 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   4107e:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   41085:	00 
   41086:	e9 9a 00 00 00       	jmpq   41125 <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   4108b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   4108f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41093:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41097:	48 89 ce             	mov    %rcx,%rsi
   4109a:	48 89 c7             	mov    %rax,%rdi
   4109d:	e8 4a 1e 00 00       	callq  42eec <virtual_memory_lookup>
        if (vam.pa != va) {
   410a2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   410a6:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   410aa:	74 27                	je     410d3 <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   410ac:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   410b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   410b4:	49 89 d0             	mov    %rdx,%r8
   410b7:	48 89 c1             	mov    %rax,%rcx
   410ba:	ba ef 3e 04 00       	mov    $0x43eef,%edx
   410bf:	be 00 c0 00 00       	mov    $0xc000,%esi
   410c4:	bf e0 06 00 00       	mov    $0x6e0,%edi
   410c9:	b8 00 00 00 00       	mov    $0x0,%eax
   410ce:	e8 e7 2a 00 00       	callq  43bba <console_printf>
        }
        assert(vam.pa == va);
   410d3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   410d7:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   410db:	74 14                	je     410f1 <check_page_table_mappings+0xa9>
   410dd:	ba f9 3e 04 00       	mov    $0x43ef9,%edx
   410e2:	be 23 02 00 00       	mov    $0x223,%esi
   410e7:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   410ec:	e8 41 17 00 00       	callq  42832 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   410f1:	b8 00 50 04 00       	mov    $0x45000,%eax
   410f6:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   410fa:	72 21                	jb     4111d <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   410fc:	8b 45 d0             	mov    -0x30(%rbp),%eax
   410ff:	48 98                	cltq   
   41101:	83 e0 02             	and    $0x2,%eax
   41104:	48 85 c0             	test   %rax,%rax
   41107:	75 14                	jne    4111d <check_page_table_mappings+0xd5>
   41109:	ba 06 3f 04 00       	mov    $0x43f06,%edx
   4110e:	be 25 02 00 00       	mov    $0x225,%esi
   41113:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41118:	e8 15 17 00 00       	callq  42832 <assert_fail>
         va += PAGESIZE) {
   4111d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41124:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   41125:	b8 08 70 05 00       	mov    $0x57008,%eax
   4112a:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4112e:	0f 82 57 ff ff ff    	jb     4108b <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   41134:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   4113b:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   4113c:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   41140:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   41144:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41148:	48 89 ce             	mov    %rcx,%rsi
   4114b:	48 89 c7             	mov    %rax,%rdi
   4114e:	e8 99 1d 00 00       	callq  42eec <virtual_memory_lookup>
    assert(vam.pa == kstack);
   41153:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41157:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   4115b:	74 14                	je     41171 <check_page_table_mappings+0x129>
   4115d:	ba 17 3f 04 00       	mov    $0x43f17,%edx
   41162:	be 2c 02 00 00       	mov    $0x22c,%esi
   41167:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   4116c:	e8 c1 16 00 00       	callq  42832 <assert_fail>
    assert(vam.perm & PTE_W);
   41171:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41174:	48 98                	cltq   
   41176:	83 e0 02             	and    $0x2,%eax
   41179:	48 85 c0             	test   %rax,%rax
   4117c:	75 14                	jne    41192 <check_page_table_mappings+0x14a>
   4117e:	ba 06 3f 04 00       	mov    $0x43f06,%edx
   41183:	be 2d 02 00 00       	mov    $0x22d,%esi
   41188:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   4118d:	e8 a0 16 00 00       	callq  42832 <assert_fail>
}
   41192:	90                   	nop
   41193:	c9                   	leaveq 
   41194:	c3                   	retq   

0000000000041195 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   41195:	55                   	push   %rbp
   41196:	48 89 e5             	mov    %rsp,%rbp
   41199:	48 83 ec 20          	sub    $0x20,%rsp
   4119d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   411a1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   411a4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   411a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   411aa:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   411b1:	48 8b 05 48 fe 00 00 	mov    0xfe48(%rip),%rax        # 51000 <kernel_pagetable>
   411b8:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   411bc:	75 67                	jne    41225 <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   411be:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   411c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   411cc:	eb 51                	jmp    4121f <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   411ce:	8b 45 f4             	mov    -0xc(%rbp),%eax
   411d1:	48 63 d0             	movslq %eax,%rdx
   411d4:	48 89 d0             	mov    %rdx,%rax
   411d7:	48 c1 e0 03          	shl    $0x3,%rax
   411db:	48 29 d0             	sub    %rdx,%rax
   411de:	48 c1 e0 05          	shl    $0x5,%rax
   411e2:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   411e8:	8b 00                	mov    (%rax),%eax
   411ea:	85 c0                	test   %eax,%eax
   411ec:	74 2d                	je     4121b <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   411ee:	8b 45 f4             	mov    -0xc(%rbp),%eax
   411f1:	48 63 d0             	movslq %eax,%rdx
   411f4:	48 89 d0             	mov    %rdx,%rax
   411f7:	48 c1 e0 03          	shl    $0x3,%rax
   411fb:	48 29 d0             	sub    %rdx,%rax
   411fe:	48 c1 e0 05          	shl    $0x5,%rax
   41202:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41208:	48 8b 10             	mov    (%rax),%rdx
   4120b:	48 8b 05 ee fd 00 00 	mov    0xfdee(%rip),%rax        # 51000 <kernel_pagetable>
   41212:	48 39 c2             	cmp    %rax,%rdx
   41215:	75 04                	jne    4121b <check_page_table_ownership+0x86>
                ++expected_refcount;
   41217:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   4121b:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4121f:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   41223:	7e a9                	jle    411ce <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   41225:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41228:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4122b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4122f:	be 00 00 00 00       	mov    $0x0,%esi
   41234:	48 89 c7             	mov    %rax,%rdi
   41237:	e8 03 00 00 00       	callq  4123f <check_page_table_ownership_level>
}
   4123c:	90                   	nop
   4123d:	c9                   	leaveq 
   4123e:	c3                   	retq   

000000000004123f <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   4123f:	55                   	push   %rbp
   41240:	48 89 e5             	mov    %rsp,%rbp
   41243:	48 83 ec 30          	sub    $0x30,%rsp
   41247:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4124b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   4124e:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41251:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41258:	48 c1 e8 0c          	shr    $0xc,%rax
   4125c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   41261:	7e 14                	jle    41277 <check_page_table_ownership_level+0x38>
   41263:	ba 28 3f 04 00       	mov    $0x43f28,%edx
   41268:	be 4a 02 00 00       	mov    $0x24a,%esi
   4126d:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41272:	e8 bb 15 00 00       	callq  42832 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41277:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4127b:	48 c1 e8 0c          	shr    $0xc,%rax
   4127f:	48 98                	cltq   
   41281:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41288:	00 
   41289:	0f be c0             	movsbl %al,%eax
   4128c:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   4128f:	74 14                	je     412a5 <check_page_table_ownership_level+0x66>
   41291:	ba 40 3f 04 00       	mov    $0x43f40,%edx
   41296:	be 4b 02 00 00       	mov    $0x24b,%esi
   4129b:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   412a0:	e8 8d 15 00 00       	callq  42832 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   412a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   412a9:	48 c1 e8 0c          	shr    $0xc,%rax
   412ad:	48 98                	cltq   
   412af:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   412b6:	00 
   412b7:	0f be c0             	movsbl %al,%eax
   412ba:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   412bd:	74 14                	je     412d3 <check_page_table_ownership_level+0x94>
   412bf:	ba 68 3f 04 00       	mov    $0x43f68,%edx
   412c4:	be 4c 02 00 00       	mov    $0x24c,%esi
   412c9:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   412ce:	e8 5f 15 00 00       	callq  42832 <assert_fail>
    if (level < 3) {
   412d3:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   412d7:	7f 5b                	jg     41334 <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   412d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   412e0:	eb 49                	jmp    4132b <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   412e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   412e6:	8b 55 fc             	mov    -0x4(%rbp),%edx
   412e9:	48 63 d2             	movslq %edx,%rdx
   412ec:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   412f0:	48 85 c0             	test   %rax,%rax
   412f3:	74 32                	je     41327 <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   412f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   412f9:	8b 55 fc             	mov    -0x4(%rbp),%edx
   412fc:	48 63 d2             	movslq %edx,%rdx
   412ff:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41303:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   41309:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   4130d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41310:	8d 70 01             	lea    0x1(%rax),%esi
   41313:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41316:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4131a:	b9 01 00 00 00       	mov    $0x1,%ecx
   4131f:	48 89 c7             	mov    %rax,%rdi
   41322:	e8 18 ff ff ff       	callq  4123f <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41327:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4132b:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41332:	7e ae                	jle    412e2 <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   41334:	90                   	nop
   41335:	c9                   	leaveq 
   41336:	c3                   	retq   

0000000000041337 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41337:	55                   	push   %rbp
   41338:	48 89 e5             	mov    %rsp,%rbp
   4133b:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   4133f:	8b 05 a3 cd 00 00    	mov    0xcda3(%rip),%eax        # 4e0e8 <processes+0xc8>
   41345:	85 c0                	test   %eax,%eax
   41347:	74 14                	je     4135d <check_virtual_memory+0x26>
   41349:	ba 98 3f 04 00       	mov    $0x43f98,%edx
   4134e:	be 5f 02 00 00       	mov    $0x25f,%esi
   41353:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41358:	e8 d5 14 00 00       	callq  42832 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   4135d:	48 8b 05 9c fc 00 00 	mov    0xfc9c(%rip),%rax        # 51000 <kernel_pagetable>
   41364:	48 89 c7             	mov    %rax,%rdi
   41367:	e8 dc fc ff ff       	callq  41048 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   4136c:	48 8b 05 8d fc 00 00 	mov    0xfc8d(%rip),%rax        # 51000 <kernel_pagetable>
   41373:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41378:	48 89 c7             	mov    %rax,%rdi
   4137b:	e8 15 fe ff ff       	callq  41195 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   41380:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41387:	e9 9c 00 00 00       	jmpq   41428 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   4138c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4138f:	48 63 d0             	movslq %eax,%rdx
   41392:	48 89 d0             	mov    %rdx,%rax
   41395:	48 c1 e0 03          	shl    $0x3,%rax
   41399:	48 29 d0             	sub    %rdx,%rax
   4139c:	48 c1 e0 05          	shl    $0x5,%rax
   413a0:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   413a6:	8b 00                	mov    (%rax),%eax
   413a8:	85 c0                	test   %eax,%eax
   413aa:	74 78                	je     41424 <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   413ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413af:	48 63 d0             	movslq %eax,%rdx
   413b2:	48 89 d0             	mov    %rdx,%rax
   413b5:	48 c1 e0 03          	shl    $0x3,%rax
   413b9:	48 29 d0             	sub    %rdx,%rax
   413bc:	48 c1 e0 05          	shl    $0x5,%rax
   413c0:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   413c6:	48 8b 10             	mov    (%rax),%rdx
   413c9:	48 8b 05 30 fc 00 00 	mov    0xfc30(%rip),%rax        # 51000 <kernel_pagetable>
   413d0:	48 39 c2             	cmp    %rax,%rdx
   413d3:	74 4f                	je     41424 <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   413d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413d8:	48 63 d0             	movslq %eax,%rdx
   413db:	48 89 d0             	mov    %rdx,%rax
   413de:	48 c1 e0 03          	shl    $0x3,%rax
   413e2:	48 29 d0             	sub    %rdx,%rax
   413e5:	48 c1 e0 05          	shl    $0x5,%rax
   413e9:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   413ef:	48 8b 00             	mov    (%rax),%rax
   413f2:	48 89 c7             	mov    %rax,%rdi
   413f5:	e8 4e fc ff ff       	callq  41048 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   413fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413fd:	48 63 d0             	movslq %eax,%rdx
   41400:	48 89 d0             	mov    %rdx,%rax
   41403:	48 c1 e0 03          	shl    $0x3,%rax
   41407:	48 29 d0             	sub    %rdx,%rax
   4140a:	48 c1 e0 05          	shl    $0x5,%rax
   4140e:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41414:	48 8b 00             	mov    (%rax),%rax
   41417:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4141a:	89 d6                	mov    %edx,%esi
   4141c:	48 89 c7             	mov    %rax,%rdi
   4141f:	e8 71 fd ff ff       	callq  41195 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41424:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41428:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   4142c:	0f 8e 5a ff ff ff    	jle    4138c <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41432:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41439:	eb 67                	jmp    414a2 <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   4143b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4143e:	48 98                	cltq   
   41440:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41447:	00 
   41448:	84 c0                	test   %al,%al
   4144a:	7e 52                	jle    4149e <check_virtual_memory+0x167>
   4144c:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4144f:	48 98                	cltq   
   41451:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41458:	00 
   41459:	84 c0                	test   %al,%al
   4145b:	78 41                	js     4149e <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   4145d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41460:	48 98                	cltq   
   41462:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41469:	00 
   4146a:	0f be c0             	movsbl %al,%eax
   4146d:	48 63 d0             	movslq %eax,%rdx
   41470:	48 89 d0             	mov    %rdx,%rax
   41473:	48 c1 e0 03          	shl    $0x3,%rax
   41477:	48 29 d0             	sub    %rdx,%rax
   4147a:	48 c1 e0 05          	shl    $0x5,%rax
   4147e:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41484:	8b 00                	mov    (%rax),%eax
   41486:	85 c0                	test   %eax,%eax
   41488:	75 14                	jne    4149e <check_virtual_memory+0x167>
   4148a:	ba b8 3f 04 00       	mov    $0x43fb8,%edx
   4148f:	be 76 02 00 00       	mov    $0x276,%esi
   41494:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41499:	e8 94 13 00 00       	callq  42832 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4149e:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   414a2:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   414a9:	7e 90                	jle    4143b <check_virtual_memory+0x104>
        }
    }
}
   414ab:	90                   	nop
   414ac:	90                   	nop
   414ad:	c9                   	leaveq 
   414ae:	c3                   	retq   

00000000000414af <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   414af:	55                   	push   %rbp
   414b0:	48 89 e5             	mov    %rsp,%rbp
   414b3:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   414b7:	ba 26 40 04 00       	mov    $0x44026,%edx
   414bc:	be 00 0f 00 00       	mov    $0xf00,%esi
   414c1:	bf 20 00 00 00       	mov    $0x20,%edi
   414c6:	b8 00 00 00 00       	mov    $0x0,%eax
   414cb:	e8 ea 26 00 00       	callq  43bba <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   414d0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   414d7:	e9 f4 00 00 00       	jmpq   415d0 <memshow_physical+0x121>
        if (pn % 64 == 0) {
   414dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414df:	83 e0 3f             	and    $0x3f,%eax
   414e2:	85 c0                	test   %eax,%eax
   414e4:	75 3e                	jne    41524 <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   414e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414e9:	c1 e0 0c             	shl    $0xc,%eax
   414ec:	89 c2                	mov    %eax,%edx
   414ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414f1:	8d 48 3f             	lea    0x3f(%rax),%ecx
   414f4:	85 c0                	test   %eax,%eax
   414f6:	0f 48 c1             	cmovs  %ecx,%eax
   414f9:	c1 f8 06             	sar    $0x6,%eax
   414fc:	8d 48 01             	lea    0x1(%rax),%ecx
   414ff:	89 c8                	mov    %ecx,%eax
   41501:	c1 e0 02             	shl    $0x2,%eax
   41504:	01 c8                	add    %ecx,%eax
   41506:	c1 e0 04             	shl    $0x4,%eax
   41509:	83 c0 03             	add    $0x3,%eax
   4150c:	89 d1                	mov    %edx,%ecx
   4150e:	ba 36 40 04 00       	mov    $0x44036,%edx
   41513:	be 00 0f 00 00       	mov    $0xf00,%esi
   41518:	89 c7                	mov    %eax,%edi
   4151a:	b8 00 00 00 00       	mov    $0x0,%eax
   4151f:	e8 96 26 00 00       	callq  43bba <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41524:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41527:	48 98                	cltq   
   41529:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41530:	00 
   41531:	0f be c0             	movsbl %al,%eax
   41534:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   41537:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4153a:	48 98                	cltq   
   4153c:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41543:	00 
   41544:	84 c0                	test   %al,%al
   41546:	75 07                	jne    4154f <memshow_physical+0xa0>
            owner = PO_FREE;
   41548:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   4154f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41552:	83 c0 02             	add    $0x2,%eax
   41555:	48 98                	cltq   
   41557:	0f b7 84 00 00 40 04 	movzwl 0x44000(%rax,%rax,1),%eax
   4155e:	00 
   4155f:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   41563:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41566:	48 98                	cltq   
   41568:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4156f:	00 
   41570:	3c 01                	cmp    $0x1,%al
   41572:	7e 1a                	jle    4158e <memshow_physical+0xdf>
   41574:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41579:	48 c1 e8 0c          	shr    $0xc,%rax
   4157d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   41580:	74 0c                	je     4158e <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   41582:	b8 53 00 00 00       	mov    $0x53,%eax
   41587:	80 cc 0f             	or     $0xf,%ah
   4158a:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
	    color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   4158e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41591:	8d 50 3f             	lea    0x3f(%rax),%edx
   41594:	85 c0                	test   %eax,%eax
   41596:	0f 48 c2             	cmovs  %edx,%eax
   41599:	c1 f8 06             	sar    $0x6,%eax
   4159c:	8d 50 01             	lea    0x1(%rax),%edx
   4159f:	89 d0                	mov    %edx,%eax
   415a1:	c1 e0 02             	shl    $0x2,%eax
   415a4:	01 d0                	add    %edx,%eax
   415a6:	c1 e0 04             	shl    $0x4,%eax
   415a9:	89 c1                	mov    %eax,%ecx
   415ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
   415ae:	99                   	cltd   
   415af:	c1 ea 1a             	shr    $0x1a,%edx
   415b2:	01 d0                	add    %edx,%eax
   415b4:	83 e0 3f             	and    $0x3f,%eax
   415b7:	29 d0                	sub    %edx,%eax
   415b9:	83 c0 0c             	add    $0xc,%eax
   415bc:	01 c8                	add    %ecx,%eax
   415be:	48 98                	cltq   
   415c0:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   415c4:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   415cb:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   415cc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   415d0:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   415d7:	0f 8e ff fe ff ff    	jle    414dc <memshow_physical+0x2d>
    }
}
   415dd:	90                   	nop
   415de:	90                   	nop
   415df:	c9                   	leaveq 
   415e0:	c3                   	retq   

00000000000415e1 <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   415e1:	55                   	push   %rbp
   415e2:	48 89 e5             	mov    %rsp,%rbp
   415e5:	48 83 ec 40          	sub    $0x40,%rsp
   415e9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   415ed:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   415f1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   415f5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   415fb:	48 89 c2             	mov    %rax,%rdx
   415fe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41602:	48 39 c2             	cmp    %rax,%rdx
   41605:	74 14                	je     4161b <memshow_virtual+0x3a>
   41607:	ba 40 40 04 00       	mov    $0x44040,%edx
   4160c:	be a7 02 00 00       	mov    $0x2a7,%esi
   41611:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   41616:	e8 17 12 00 00       	callq  42832 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   4161b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4161f:	48 89 c1             	mov    %rax,%rcx
   41622:	ba 6d 40 04 00       	mov    $0x4406d,%edx
   41627:	be 00 0f 00 00       	mov    $0xf00,%esi
   4162c:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41631:	b8 00 00 00 00       	mov    $0x0,%eax
   41636:	e8 7f 25 00 00       	callq  43bba <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4163b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41642:	00 
   41643:	e9 80 01 00 00       	jmpq   417c8 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41648:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4164c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41650:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41654:	48 89 ce             	mov    %rcx,%rsi
   41657:	48 89 c7             	mov    %rax,%rdi
   4165a:	e8 8d 18 00 00       	callq  42eec <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   4165f:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41662:	85 c0                	test   %eax,%eax
   41664:	79 0b                	jns    41671 <memshow_virtual+0x90>
            color = ' ';
   41666:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   4166c:	e9 d7 00 00 00       	jmpq   41748 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41671:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41675:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4167b:	76 14                	jbe    41691 <memshow_virtual+0xb0>
   4167d:	ba 8a 40 04 00       	mov    $0x4408a,%edx
   41682:	be b0 02 00 00       	mov    $0x2b0,%esi
   41687:	bf c0 3c 04 00       	mov    $0x43cc0,%edi
   4168c:	e8 a1 11 00 00       	callq  42832 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41691:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41694:	48 98                	cltq   
   41696:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4169d:	00 
   4169e:	0f be c0             	movsbl %al,%eax
   416a1:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   416a4:	8b 45 d0             	mov    -0x30(%rbp),%eax
   416a7:	48 98                	cltq   
   416a9:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   416b0:	00 
   416b1:	84 c0                	test   %al,%al
   416b3:	75 07                	jne    416bc <memshow_virtual+0xdb>
                owner = PO_FREE;
   416b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   416bc:	8b 45 f0             	mov    -0x10(%rbp),%eax
   416bf:	83 c0 02             	add    $0x2,%eax
   416c2:	48 98                	cltq   
   416c4:	0f b7 84 00 00 40 04 	movzwl 0x44000(%rax,%rax,1),%eax
   416cb:	00 
   416cc:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   416d0:	8b 45 e0             	mov    -0x20(%rbp),%eax
   416d3:	48 98                	cltq   
   416d5:	83 e0 04             	and    $0x4,%eax
   416d8:	48 85 c0             	test   %rax,%rax
   416db:	74 27                	je     41704 <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   416dd:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   416e1:	c1 e0 04             	shl    $0x4,%eax
   416e4:	66 25 00 f0          	and    $0xf000,%ax
   416e8:	89 c2                	mov    %eax,%edx
   416ea:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   416ee:	c1 f8 04             	sar    $0x4,%eax
   416f1:	66 25 00 0f          	and    $0xf00,%ax
   416f5:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   416f7:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   416fb:	0f b6 c0             	movzbl %al,%eax
   416fe:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41700:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   41704:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41707:	48 98                	cltq   
   41709:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41710:	00 
   41711:	3c 01                	cmp    $0x1,%al
   41713:	7e 33                	jle    41748 <memshow_virtual+0x167>
   41715:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   4171a:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4171e:	74 28                	je     41748 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41720:	b8 53 00 00 00       	mov    $0x53,%eax
   41725:	89 c2                	mov    %eax,%edx
   41727:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4172b:	66 25 00 f0          	and    $0xf000,%ax
   4172f:	09 d0                	or     %edx,%eax
   41731:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41735:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41738:	48 98                	cltq   
   4173a:	83 e0 04             	and    $0x4,%eax
   4173d:	48 85 c0             	test   %rax,%rax
   41740:	75 06                	jne    41748 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41742:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
		color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41748:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4174c:	48 c1 e8 0c          	shr    $0xc,%rax
   41750:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41753:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41756:	83 e0 3f             	and    $0x3f,%eax
   41759:	85 c0                	test   %eax,%eax
   4175b:	75 34                	jne    41791 <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   4175d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41760:	c1 e8 06             	shr    $0x6,%eax
   41763:	89 c2                	mov    %eax,%edx
   41765:	89 d0                	mov    %edx,%eax
   41767:	c1 e0 02             	shl    $0x2,%eax
   4176a:	01 d0                	add    %edx,%eax
   4176c:	c1 e0 04             	shl    $0x4,%eax
   4176f:	05 73 03 00 00       	add    $0x373,%eax
   41774:	89 c7                	mov    %eax,%edi
   41776:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4177a:	48 89 c1             	mov    %rax,%rcx
   4177d:	ba 36 40 04 00       	mov    $0x44036,%edx
   41782:	be 00 0f 00 00       	mov    $0xf00,%esi
   41787:	b8 00 00 00 00       	mov    $0x0,%eax
   4178c:	e8 29 24 00 00       	callq  43bba <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41791:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41794:	c1 e8 06             	shr    $0x6,%eax
   41797:	89 c2                	mov    %eax,%edx
   41799:	89 d0                	mov    %edx,%eax
   4179b:	c1 e0 02             	shl    $0x2,%eax
   4179e:	01 d0                	add    %edx,%eax
   417a0:	c1 e0 04             	shl    $0x4,%eax
   417a3:	89 c2                	mov    %eax,%edx
   417a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
   417a8:	83 e0 3f             	and    $0x3f,%eax
   417ab:	01 d0                	add    %edx,%eax
   417ad:	05 7c 03 00 00       	add    $0x37c,%eax
   417b2:	89 c2                	mov    %eax,%edx
   417b4:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   417b8:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   417bf:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   417c0:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   417c7:	00 
   417c8:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   417cf:	00 
   417d0:	0f 86 72 fe ff ff    	jbe    41648 <memshow_virtual+0x67>
    }
}
   417d6:	90                   	nop
   417d7:	90                   	nop
   417d8:	c9                   	leaveq 
   417d9:	c3                   	retq   

00000000000417da <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   417da:	55                   	push   %rbp
   417db:	48 89 e5             	mov    %rsp,%rbp
   417de:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   417e2:	8b 05 58 da 00 00    	mov    0xda58(%rip),%eax        # 4f240 <last_ticks.1>
   417e8:	85 c0                	test   %eax,%eax
   417ea:	74 13                	je     417ff <memshow_virtual_animate+0x25>
   417ec:	8b 05 2e d6 00 00    	mov    0xd62e(%rip),%eax        # 4ee20 <ticks>
   417f2:	8b 15 48 da 00 00    	mov    0xda48(%rip),%edx        # 4f240 <last_ticks.1>
   417f8:	29 d0                	sub    %edx,%eax
   417fa:	83 f8 31             	cmp    $0x31,%eax
   417fd:	76 2c                	jbe    4182b <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   417ff:	8b 05 1b d6 00 00    	mov    0xd61b(%rip),%eax        # 4ee20 <ticks>
   41805:	89 05 35 da 00 00    	mov    %eax,0xda35(%rip)        # 4f240 <last_ticks.1>
        ++showing;
   4180b:	8b 05 f3 37 00 00    	mov    0x37f3(%rip),%eax        # 45004 <showing.0>
   41811:	83 c0 01             	add    $0x1,%eax
   41814:	89 05 ea 37 00 00    	mov    %eax,0x37ea(%rip)        # 45004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   4181a:	eb 0f                	jmp    4182b <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   4181c:	8b 05 e2 37 00 00    	mov    0x37e2(%rip),%eax        # 45004 <showing.0>
   41822:	83 c0 01             	add    $0x1,%eax
   41825:	89 05 d9 37 00 00    	mov    %eax,0x37d9(%rip)        # 45004 <showing.0>
    while (showing <= 2*NPROC
   4182b:	8b 05 d3 37 00 00    	mov    0x37d3(%rip),%eax        # 45004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   41831:	83 f8 20             	cmp    $0x20,%eax
   41834:	7f 2e                	jg     41864 <memshow_virtual_animate+0x8a>
   41836:	8b 05 c8 37 00 00    	mov    0x37c8(%rip),%eax        # 45004 <showing.0>
   4183c:	99                   	cltd   
   4183d:	c1 ea 1c             	shr    $0x1c,%edx
   41840:	01 d0                	add    %edx,%eax
   41842:	83 e0 0f             	and    $0xf,%eax
   41845:	29 d0                	sub    %edx,%eax
   41847:	48 63 d0             	movslq %eax,%rdx
   4184a:	48 89 d0             	mov    %rdx,%rax
   4184d:	48 c1 e0 03          	shl    $0x3,%rax
   41851:	48 29 d0             	sub    %rdx,%rax
   41854:	48 c1 e0 05          	shl    $0x5,%rax
   41858:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   4185e:	8b 00                	mov    (%rax),%eax
   41860:	85 c0                	test   %eax,%eax
   41862:	74 b8                	je     4181c <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41864:	8b 05 9a 37 00 00    	mov    0x379a(%rip),%eax        # 45004 <showing.0>
   4186a:	99                   	cltd   
   4186b:	c1 ea 1c             	shr    $0x1c,%edx
   4186e:	01 d0                	add    %edx,%eax
   41870:	83 e0 0f             	and    $0xf,%eax
   41873:	29 d0                	sub    %edx,%eax
   41875:	89 05 89 37 00 00    	mov    %eax,0x3789(%rip)        # 45004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   4187b:	8b 05 83 37 00 00    	mov    0x3783(%rip),%eax        # 45004 <showing.0>
   41881:	48 63 d0             	movslq %eax,%rdx
   41884:	48 89 d0             	mov    %rdx,%rax
   41887:	48 c1 e0 03          	shl    $0x3,%rax
   4188b:	48 29 d0             	sub    %rdx,%rax
   4188e:	48 c1 e0 05          	shl    $0x5,%rax
   41892:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41898:	8b 00                	mov    (%rax),%eax
   4189a:	85 c0                	test   %eax,%eax
   4189c:	74 52                	je     418f0 <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   4189e:	8b 15 60 37 00 00    	mov    0x3760(%rip),%edx        # 45004 <showing.0>
   418a4:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   418a8:	89 d1                	mov    %edx,%ecx
   418aa:	ba a4 40 04 00       	mov    $0x440a4,%edx
   418af:	be 04 00 00 00       	mov    $0x4,%esi
   418b4:	48 89 c7             	mov    %rax,%rdi
   418b7:	b8 00 00 00 00       	mov    $0x0,%eax
   418bc:	e8 77 23 00 00       	callq  43c38 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   418c1:	8b 05 3d 37 00 00    	mov    0x373d(%rip),%eax        # 45004 <showing.0>
   418c7:	48 63 d0             	movslq %eax,%rdx
   418ca:	48 89 d0             	mov    %rdx,%rax
   418cd:	48 c1 e0 03          	shl    $0x3,%rax
   418d1:	48 29 d0             	sub    %rdx,%rax
   418d4:	48 c1 e0 05          	shl    $0x5,%rax
   418d8:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   418de:	48 8b 00             	mov    (%rax),%rax
   418e1:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   418e5:	48 89 d6             	mov    %rdx,%rsi
   418e8:	48 89 c7             	mov    %rax,%rdi
   418eb:	e8 f1 fc ff ff       	callq  415e1 <memshow_virtual>
    }
}
   418f0:	90                   	nop
   418f1:	c9                   	leaveq 
   418f2:	c3                   	retq   

00000000000418f3 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   418f3:	55                   	push   %rbp
   418f4:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   418f7:	e8 53 01 00 00       	callq  41a4f <segments_init>
    interrupt_init();
   418fc:	e8 d4 03 00 00       	callq  41cd5 <interrupt_init>
    virtual_memory_init();
   41901:	e8 e7 0f 00 00       	callq  428ed <virtual_memory_init>
}
   41906:	90                   	nop
   41907:	5d                   	pop    %rbp
   41908:	c3                   	retq   

0000000000041909 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   41909:	55                   	push   %rbp
   4190a:	48 89 e5             	mov    %rsp,%rbp
   4190d:	48 83 ec 18          	sub    $0x18,%rsp
   41911:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41915:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41919:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   4191c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4191f:	48 98                	cltq   
   41921:	48 c1 e0 2d          	shl    $0x2d,%rax
   41925:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   41929:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   41930:	90 00 00 
   41933:	48 09 c2             	or     %rax,%rdx
    *segment = type
   41936:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4193a:	48 89 10             	mov    %rdx,(%rax)
}
   4193d:	90                   	nop
   4193e:	c9                   	leaveq 
   4193f:	c3                   	retq   

0000000000041940 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41940:	55                   	push   %rbp
   41941:	48 89 e5             	mov    %rsp,%rbp
   41944:	48 83 ec 28          	sub    $0x28,%rsp
   41948:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4194c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41950:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41953:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41957:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   4195b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4195f:	48 c1 e0 10          	shl    $0x10,%rax
   41963:	48 89 c2             	mov    %rax,%rdx
   41966:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   4196d:	00 00 00 
   41970:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41973:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41977:	48 c1 e0 20          	shl    $0x20,%rax
   4197b:	48 89 c1             	mov    %rax,%rcx
   4197e:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41985:	00 00 ff 
   41988:	48 21 c8             	and    %rcx,%rax
   4198b:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   4198e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41992:	48 83 e8 01          	sub    $0x1,%rax
   41996:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41999:	48 09 d0             	or     %rdx,%rax
        | type
   4199c:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   419a0:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   419a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
   419a6:	48 98                	cltq   
   419a8:	48 c1 e0 2d          	shl    $0x2d,%rax
   419ac:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   419af:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   419b6:	80 00 00 
   419b9:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   419bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   419c0:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   419c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   419c7:	48 83 c0 08          	add    $0x8,%rax
   419cb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   419cf:	48 c1 ea 20          	shr    $0x20,%rdx
   419d3:	48 89 10             	mov    %rdx,(%rax)
}
   419d6:	90                   	nop
   419d7:	c9                   	leaveq 
   419d8:	c3                   	retq   

00000000000419d9 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   419d9:	55                   	push   %rbp
   419da:	48 89 e5             	mov    %rsp,%rbp
   419dd:	48 83 ec 20          	sub    $0x20,%rsp
   419e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   419e5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   419e9:	89 55 ec             	mov    %edx,-0x14(%rbp)
   419ec:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   419f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   419f4:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   419f7:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   419fb:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   419fe:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a01:	48 98                	cltq   
   41a03:	48 c1 e0 2d          	shl    $0x2d,%rax
   41a07:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41a0a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41a0e:	48 c1 e0 20          	shl    $0x20,%rax
   41a12:	48 89 c1             	mov    %rax,%rcx
   41a15:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41a1c:	00 ff ff 
   41a1f:	48 21 c8             	and    %rcx,%rax
   41a22:	48 09 c2             	or     %rax,%rdx
   41a25:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41a2c:	80 00 00 
   41a2f:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41a32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a36:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41a39:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41a3d:	48 c1 e8 20          	shr    $0x20,%rax
   41a41:	48 89 c2             	mov    %rax,%rdx
   41a44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a48:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   41a4c:	90                   	nop
   41a4d:	c9                   	leaveq 
   41a4e:	c3                   	retq   

0000000000041a4f <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   41a4f:	55                   	push   %rbp
   41a50:	48 89 e5             	mov    %rsp,%rbp
   41a53:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41a57:	48 c7 05 fe d7 00 00 	movq   $0x0,0xd7fe(%rip)        # 4f260 <segments>
   41a5e:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41a62:	ba 00 00 00 00       	mov    $0x0,%edx
   41a67:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41a6e:	08 20 00 
   41a71:	48 89 c6             	mov    %rax,%rsi
   41a74:	bf 68 f2 04 00       	mov    $0x4f268,%edi
   41a79:	e8 8b fe ff ff       	callq  41909 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   41a7e:	ba 03 00 00 00       	mov    $0x3,%edx
   41a83:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41a8a:	08 20 00 
   41a8d:	48 89 c6             	mov    %rax,%rsi
   41a90:	bf 70 f2 04 00       	mov    $0x4f270,%edi
   41a95:	e8 6f fe ff ff       	callq  41909 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41a9a:	ba 00 00 00 00       	mov    $0x0,%edx
   41a9f:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41aa6:	02 00 00 
   41aa9:	48 89 c6             	mov    %rax,%rsi
   41aac:	bf 78 f2 04 00       	mov    $0x4f278,%edi
   41ab1:	e8 53 fe ff ff       	callq  41909 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41ab6:	ba 03 00 00 00       	mov    $0x3,%edx
   41abb:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41ac2:	02 00 00 
   41ac5:	48 89 c6             	mov    %rax,%rsi
   41ac8:	bf 80 f2 04 00       	mov    $0x4f280,%edi
   41acd:	e8 37 fe ff ff       	callq  41909 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41ad2:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   41ad7:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41add:	48 89 c1             	mov    %rax,%rcx
   41ae0:	ba 00 00 00 00       	mov    $0x0,%edx
   41ae5:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41aec:	09 00 00 
   41aef:	48 89 c6             	mov    %rax,%rsi
   41af2:	bf 88 f2 04 00       	mov    $0x4f288,%edi
   41af7:	e8 44 fe ff ff       	callq  41940 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41afc:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41b02:	b8 60 f2 04 00       	mov    $0x4f260,%eax
   41b07:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41b0b:	ba 60 00 00 00       	mov    $0x60,%edx
   41b10:	be 00 00 00 00       	mov    $0x0,%esi
   41b15:	bf a0 02 05 00       	mov    $0x502a0,%edi
   41b1a:	e8 66 18 00 00       	callq  43385 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41b1f:	48 c7 05 7a e7 00 00 	movq   $0x80000,0xe77a(%rip)        # 502a4 <kernel_task_descriptor+0x4>
   41b26:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41b2a:	ba 00 10 00 00       	mov    $0x1000,%edx
   41b2f:	be 00 00 00 00       	mov    $0x0,%esi
   41b34:	bf a0 f2 04 00       	mov    $0x4f2a0,%edi
   41b39:	e8 47 18 00 00       	callq  43385 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41b3e:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41b45:	eb 30                	jmp    41b77 <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41b47:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   41b4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41b4f:	48 c1 e0 04          	shl    $0x4,%rax
   41b53:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41b59:	48 89 d1             	mov    %rdx,%rcx
   41b5c:	ba 00 00 00 00       	mov    $0x0,%edx
   41b61:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41b68:	0e 00 00 
   41b6b:	48 89 c7             	mov    %rax,%rdi
   41b6e:	e8 66 fe ff ff       	callq  419d9 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41b73:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41b77:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41b7e:	76 c7                	jbe    41b47 <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41b80:	b8 36 00 04 00       	mov    $0x40036,%eax
   41b85:	48 89 c1             	mov    %rax,%rcx
   41b88:	ba 00 00 00 00       	mov    $0x0,%edx
   41b8d:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41b94:	0e 00 00 
   41b97:	48 89 c6             	mov    %rax,%rsi
   41b9a:	bf a0 f4 04 00       	mov    $0x4f4a0,%edi
   41b9f:	e8 35 fe ff ff       	callq  419d9 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41ba4:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   41ba9:	48 89 c1             	mov    %rax,%rcx
   41bac:	ba 00 00 00 00       	mov    $0x0,%edx
   41bb1:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41bb8:	0e 00 00 
   41bbb:	48 89 c6             	mov    %rax,%rsi
   41bbe:	bf 70 f3 04 00       	mov    $0x4f370,%edi
   41bc3:	e8 11 fe ff ff       	callq  419d9 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41bc8:	b8 32 00 04 00       	mov    $0x40032,%eax
   41bcd:	48 89 c1             	mov    %rax,%rcx
   41bd0:	ba 00 00 00 00       	mov    $0x0,%edx
   41bd5:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41bdc:	0e 00 00 
   41bdf:	48 89 c6             	mov    %rax,%rsi
   41be2:	bf 80 f3 04 00       	mov    $0x4f380,%edi
   41be7:	e8 ed fd ff ff       	callq  419d9 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41bec:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41bf3:	eb 3e                	jmp    41c33 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41bf5:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41bf8:	83 e8 30             	sub    $0x30,%eax
   41bfb:	89 c0                	mov    %eax,%eax
   41bfd:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   41c04:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41c05:	48 89 c2             	mov    %rax,%rdx
   41c08:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41c0b:	48 c1 e0 04          	shl    $0x4,%rax
   41c0f:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41c15:	48 89 d1             	mov    %rdx,%rcx
   41c18:	ba 03 00 00 00       	mov    $0x3,%edx
   41c1d:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41c24:	0e 00 00 
   41c27:	48 89 c7             	mov    %rax,%rdi
   41c2a:	e8 aa fd ff ff       	callq  419d9 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41c2f:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41c33:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41c37:	76 bc                	jbe    41bf5 <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41c39:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41c3f:	b8 a0 f2 04 00       	mov    $0x4f2a0,%eax
   41c44:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41c48:	b8 28 00 00 00       	mov    $0x28,%eax
   41c4d:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41c51:	0f 00 d8             	ltr    %ax
   41c54:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41c58:	0f 20 c0             	mov    %cr0,%rax
   41c5b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41c5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41c63:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41c66:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41c6d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41c70:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41c73:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41c76:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41c7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41c7e:	0f 22 c0             	mov    %rax,%cr0
}
   41c81:	90                   	nop
    lcr0(cr0);
}
   41c82:	90                   	nop
   41c83:	c9                   	leaveq 
   41c84:	c3                   	retq   

0000000000041c85 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41c85:	55                   	push   %rbp
   41c86:	48 89 e5             	mov    %rsp,%rbp
   41c89:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41c8d:	0f b7 05 6c e6 00 00 	movzwl 0xe66c(%rip),%eax        # 50300 <interrupts_enabled>
   41c94:	f7 d0                	not    %eax
   41c96:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41c9a:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41c9e:	0f b6 c0             	movzbl %al,%eax
   41ca1:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41ca8:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cab:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41caf:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41cb2:	ee                   	out    %al,(%dx)
}
   41cb3:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41cb4:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41cb8:	66 c1 e8 08          	shr    $0x8,%ax
   41cbc:	0f b6 c0             	movzbl %al,%eax
   41cbf:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41cc6:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cc9:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41ccd:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41cd0:	ee                   	out    %al,(%dx)
}
   41cd1:	90                   	nop
}
   41cd2:	90                   	nop
   41cd3:	c9                   	leaveq 
   41cd4:	c3                   	retq   

0000000000041cd5 <interrupt_init>:

void interrupt_init(void) {
   41cd5:	55                   	push   %rbp
   41cd6:	48 89 e5             	mov    %rsp,%rbp
   41cd9:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41cdd:	66 c7 05 1a e6 00 00 	movw   $0x0,0xe61a(%rip)        # 50300 <interrupts_enabled>
   41ce4:	00 00 
    interrupt_mask();
   41ce6:	e8 9a ff ff ff       	callq  41c85 <interrupt_mask>
   41ceb:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   41cf2:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cf6:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   41cfa:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   41cfd:	ee                   	out    %al,(%dx)
}
   41cfe:	90                   	nop
   41cff:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   41d06:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d0a:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   41d0e:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41d11:	ee                   	out    %al,(%dx)
}
   41d12:	90                   	nop
   41d13:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   41d1a:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d1e:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   41d22:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   41d25:	ee                   	out    %al,(%dx)
}
   41d26:	90                   	nop
   41d27:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   41d2e:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d32:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   41d36:	8b 55 bc             	mov    -0x44(%rbp),%edx
   41d39:	ee                   	out    %al,(%dx)
}
   41d3a:	90                   	nop
   41d3b:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   41d42:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d46:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   41d4a:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   41d4d:	ee                   	out    %al,(%dx)
}
   41d4e:	90                   	nop
   41d4f:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   41d56:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d5a:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   41d5e:	8b 55 cc             	mov    -0x34(%rbp),%edx
   41d61:	ee                   	out    %al,(%dx)
}
   41d62:	90                   	nop
   41d63:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   41d6a:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d6e:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   41d72:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   41d75:	ee                   	out    %al,(%dx)
}
   41d76:	90                   	nop
   41d77:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   41d7e:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d82:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   41d86:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41d89:	ee                   	out    %al,(%dx)
}
   41d8a:	90                   	nop
   41d8b:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   41d92:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d96:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   41d9a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   41d9d:	ee                   	out    %al,(%dx)
}
   41d9e:	90                   	nop
   41d9f:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   41da6:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41daa:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41dae:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41db1:	ee                   	out    %al,(%dx)
}
   41db2:	90                   	nop
   41db3:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   41dba:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41dbe:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41dc2:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41dc5:	ee                   	out    %al,(%dx)
}
   41dc6:	90                   	nop
   41dc7:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   41dce:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41dd2:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41dd6:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41dd9:	ee                   	out    %al,(%dx)
}
   41dda:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   41ddb:	e8 a5 fe ff ff       	callq  41c85 <interrupt_mask>
}
   41de0:	90                   	nop
   41de1:	c9                   	leaveq 
   41de2:	c3                   	retq   

0000000000041de3 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   41de3:	55                   	push   %rbp
   41de4:	48 89 e5             	mov    %rsp,%rbp
   41de7:	48 83 ec 28          	sub    $0x28,%rsp
   41deb:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   41dee:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41df2:	0f 8e 9f 00 00 00    	jle    41e97 <timer_init+0xb4>
   41df8:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   41dff:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e03:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41e07:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41e0a:	ee                   	out    %al,(%dx)
}
   41e0b:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   41e0c:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41e0f:	89 c2                	mov    %eax,%edx
   41e11:	c1 ea 1f             	shr    $0x1f,%edx
   41e14:	01 d0                	add    %edx,%eax
   41e16:	d1 f8                	sar    %eax
   41e18:	05 de 34 12 00       	add    $0x1234de,%eax
   41e1d:	99                   	cltd   
   41e1e:	f7 7d dc             	idivl  -0x24(%rbp)
   41e21:	89 c2                	mov    %eax,%edx
   41e23:	89 d0                	mov    %edx,%eax
   41e25:	c1 f8 1f             	sar    $0x1f,%eax
   41e28:	c1 e8 18             	shr    $0x18,%eax
   41e2b:	89 c1                	mov    %eax,%ecx
   41e2d:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   41e30:	0f b6 c0             	movzbl %al,%eax
   41e33:	29 c8                	sub    %ecx,%eax
   41e35:	0f b6 c0             	movzbl %al,%eax
   41e38:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   41e3f:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e42:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41e46:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41e49:	ee                   	out    %al,(%dx)
}
   41e4a:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   41e4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41e4e:	89 c2                	mov    %eax,%edx
   41e50:	c1 ea 1f             	shr    $0x1f,%edx
   41e53:	01 d0                	add    %edx,%eax
   41e55:	d1 f8                	sar    %eax
   41e57:	05 de 34 12 00       	add    $0x1234de,%eax
   41e5c:	99                   	cltd   
   41e5d:	f7 7d dc             	idivl  -0x24(%rbp)
   41e60:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   41e66:	85 c0                	test   %eax,%eax
   41e68:	0f 48 c2             	cmovs  %edx,%eax
   41e6b:	c1 f8 08             	sar    $0x8,%eax
   41e6e:	0f b6 c0             	movzbl %al,%eax
   41e71:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   41e78:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e7b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41e7f:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41e82:	ee                   	out    %al,(%dx)
}
   41e83:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   41e84:	0f b7 05 75 e4 00 00 	movzwl 0xe475(%rip),%eax        # 50300 <interrupts_enabled>
   41e8b:	83 c8 01             	or     $0x1,%eax
   41e8e:	66 89 05 6b e4 00 00 	mov    %ax,0xe46b(%rip)        # 50300 <interrupts_enabled>
   41e95:	eb 11                	jmp    41ea8 <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   41e97:	0f b7 05 62 e4 00 00 	movzwl 0xe462(%rip),%eax        # 50300 <interrupts_enabled>
   41e9e:	83 e0 fe             	and    $0xfffffffe,%eax
   41ea1:	66 89 05 58 e4 00 00 	mov    %ax,0xe458(%rip)        # 50300 <interrupts_enabled>
    }
    interrupt_mask();
   41ea8:	e8 d8 fd ff ff       	callq  41c85 <interrupt_mask>
}
   41ead:	90                   	nop
   41eae:	c9                   	leaveq 
   41eaf:	c3                   	retq   

0000000000041eb0 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   41eb0:	55                   	push   %rbp
   41eb1:	48 89 e5             	mov    %rsp,%rbp
   41eb4:	48 83 ec 08          	sub    $0x8,%rsp
   41eb8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41ebc:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   41ec1:	74 14                	je     41ed7 <physical_memory_isreserved+0x27>
   41ec3:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   41eca:	00 
   41ecb:	76 11                	jbe    41ede <physical_memory_isreserved+0x2e>
   41ecd:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   41ed4:	00 
   41ed5:	77 07                	ja     41ede <physical_memory_isreserved+0x2e>
   41ed7:	b8 01 00 00 00       	mov    $0x1,%eax
   41edc:	eb 05                	jmp    41ee3 <physical_memory_isreserved+0x33>
   41ede:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41ee3:	c9                   	leaveq 
   41ee4:	c3                   	retq   

0000000000041ee5 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   41ee5:	55                   	push   %rbp
   41ee6:	48 89 e5             	mov    %rsp,%rbp
   41ee9:	48 83 ec 10          	sub    $0x10,%rsp
   41eed:	89 7d fc             	mov    %edi,-0x4(%rbp)
   41ef0:	89 75 f8             	mov    %esi,-0x8(%rbp)
   41ef3:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   41ef6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ef9:	c1 e0 10             	shl    $0x10,%eax
   41efc:	89 c2                	mov    %eax,%edx
   41efe:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41f01:	c1 e0 0b             	shl    $0xb,%eax
   41f04:	09 c2                	or     %eax,%edx
   41f06:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41f09:	c1 e0 08             	shl    $0x8,%eax
   41f0c:	09 d0                	or     %edx,%eax
}
   41f0e:	c9                   	leaveq 
   41f0f:	c3                   	retq   

0000000000041f10 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   41f10:	55                   	push   %rbp
   41f11:	48 89 e5             	mov    %rsp,%rbp
   41f14:	48 83 ec 18          	sub    $0x18,%rsp
   41f18:	89 7d ec             	mov    %edi,-0x14(%rbp)
   41f1b:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   41f1e:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41f21:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41f24:	09 d0                	or     %edx,%eax
   41f26:	0d 00 00 00 80       	or     $0x80000000,%eax
   41f2b:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   41f32:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   41f35:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41f38:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41f3b:	ef                   	out    %eax,(%dx)
}
   41f3c:	90                   	nop
   41f3d:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   41f44:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41f47:	89 c2                	mov    %eax,%edx
   41f49:	ed                   	in     (%dx),%eax
   41f4a:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   41f4d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   41f50:	c9                   	leaveq 
   41f51:	c3                   	retq   

0000000000041f52 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   41f52:	55                   	push   %rbp
   41f53:	48 89 e5             	mov    %rsp,%rbp
   41f56:	48 83 ec 28          	sub    $0x28,%rsp
   41f5a:	89 7d dc             	mov    %edi,-0x24(%rbp)
   41f5d:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   41f60:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41f67:	eb 73                	jmp    41fdc <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   41f69:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41f70:	eb 60                	jmp    41fd2 <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   41f72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41f79:	eb 4a                	jmp    41fc5 <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   41f7b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41f7e:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41f81:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41f84:	89 ce                	mov    %ecx,%esi
   41f86:	89 c7                	mov    %eax,%edi
   41f88:	e8 58 ff ff ff       	callq  41ee5 <pci_make_configaddr>
   41f8d:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   41f90:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41f93:	be 00 00 00 00       	mov    $0x0,%esi
   41f98:	89 c7                	mov    %eax,%edi
   41f9a:	e8 71 ff ff ff       	callq  41f10 <pci_config_readl>
   41f9f:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   41fa2:	8b 45 d8             	mov    -0x28(%rbp),%eax
   41fa5:	c1 e0 10             	shl    $0x10,%eax
   41fa8:	0b 45 dc             	or     -0x24(%rbp),%eax
   41fab:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   41fae:	75 05                	jne    41fb5 <pci_find_device+0x63>
                    return configaddr;
   41fb0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41fb3:	eb 35                	jmp    41fea <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   41fb5:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   41fb9:	75 06                	jne    41fc1 <pci_find_device+0x6f>
   41fbb:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41fbf:	74 0c                	je     41fcd <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   41fc1:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41fc5:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   41fc9:	75 b0                	jne    41f7b <pci_find_device+0x29>
   41fcb:	eb 01                	jmp    41fce <pci_find_device+0x7c>
                    break;
   41fcd:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   41fce:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41fd2:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   41fd6:	75 9a                	jne    41f72 <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   41fd8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41fdc:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   41fe3:	75 84                	jne    41f69 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   41fe5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41fea:	c9                   	leaveq 
   41feb:	c3                   	retq   

0000000000041fec <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   41fec:	55                   	push   %rbp
   41fed:	48 89 e5             	mov    %rsp,%rbp
   41ff0:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   41ff4:	be 13 71 00 00       	mov    $0x7113,%esi
   41ff9:	bf 86 80 00 00       	mov    $0x8086,%edi
   41ffe:	e8 4f ff ff ff       	callq  41f52 <pci_find_device>
   42003:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42006:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   4200a:	78 30                	js     4203c <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   4200c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4200f:	be 40 00 00 00       	mov    $0x40,%esi
   42014:	89 c7                	mov    %eax,%edi
   42016:	e8 f5 fe ff ff       	callq  41f10 <pci_config_readl>
   4201b:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42020:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42023:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42026:	83 c0 04             	add    $0x4,%eax
   42029:	89 45 f4             	mov    %eax,-0xc(%rbp)
   4202c:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42032:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42036:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42039:	66 ef                	out    %ax,(%dx)
}
   4203b:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4203c:	ba c0 40 04 00       	mov    $0x440c0,%edx
   42041:	be 00 c0 00 00       	mov    $0xc000,%esi
   42046:	bf 80 07 00 00       	mov    $0x780,%edi
   4204b:	b8 00 00 00 00       	mov    $0x0,%eax
   42050:	e8 65 1b 00 00       	callq  43bba <console_printf>
 spinloop: goto spinloop;
   42055:	eb fe                	jmp    42055 <poweroff+0x69>

0000000000042057 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   42057:	55                   	push   %rbp
   42058:	48 89 e5             	mov    %rsp,%rbp
   4205b:	48 83 ec 10          	sub    $0x10,%rsp
   4205f:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   42066:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4206a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4206e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42071:	ee                   	out    %al,(%dx)
}
   42072:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   42073:	eb fe                	jmp    42073 <reboot+0x1c>

0000000000042075 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   42075:	55                   	push   %rbp
   42076:	48 89 e5             	mov    %rsp,%rbp
   42079:	48 83 ec 10          	sub    $0x10,%rsp
   4207d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42081:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   42084:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42088:	48 83 c0 08          	add    $0x8,%rax
   4208c:	ba c0 00 00 00       	mov    $0xc0,%edx
   42091:	be 00 00 00 00       	mov    $0x0,%esi
   42096:	48 89 c7             	mov    %rax,%rdi
   42099:	e8 e7 12 00 00       	callq  43385 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   4209e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420a2:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   420a9:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   420ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420af:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   420b6:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   420ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420be:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   420c5:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   420c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420cd:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   420d4:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   420d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420da:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   420e1:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   420e5:	8b 45 f4             	mov    -0xc(%rbp),%eax
   420e8:	83 e0 01             	and    $0x1,%eax
   420eb:	85 c0                	test   %eax,%eax
   420ed:	74 1c                	je     4210b <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   420ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420f3:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   420fa:	80 cc 30             	or     $0x30,%ah
   420fd:	48 89 c2             	mov    %rax,%rdx
   42100:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42104:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   4210b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4210e:	83 e0 02             	and    $0x2,%eax
   42111:	85 c0                	test   %eax,%eax
   42113:	74 1c                	je     42131 <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42115:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42119:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42120:	80 e4 fd             	and    $0xfd,%ah
   42123:	48 89 c2             	mov    %rax,%rdx
   42126:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4212a:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42131:	90                   	nop
   42132:	c9                   	leaveq 
   42133:	c3                   	retq   

0000000000042134 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   42134:	55                   	push   %rbp
   42135:	48 89 e5             	mov    %rsp,%rbp
   42138:	48 83 ec 28          	sub    $0x28,%rsp
   4213c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4213f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42143:	78 09                	js     4214e <console_show_cursor+0x1a>
   42145:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   4214c:	7e 07                	jle    42155 <console_show_cursor+0x21>
        cpos = 0;
   4214e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42155:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   4215c:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42160:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42164:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42167:	ee                   	out    %al,(%dx)
}
   42168:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42169:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4216c:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42172:	85 c0                	test   %eax,%eax
   42174:	0f 48 c2             	cmovs  %edx,%eax
   42177:	c1 f8 08             	sar    $0x8,%eax
   4217a:	0f b6 c0             	movzbl %al,%eax
   4217d:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   42184:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42187:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4218b:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4218e:	ee                   	out    %al,(%dx)
}
   4218f:	90                   	nop
   42190:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42197:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4219b:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4219f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   421a2:	ee                   	out    %al,(%dx)
}
   421a3:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   421a4:	8b 45 dc             	mov    -0x24(%rbp),%eax
   421a7:	99                   	cltd   
   421a8:	c1 ea 18             	shr    $0x18,%edx
   421ab:	01 d0                	add    %edx,%eax
   421ad:	0f b6 c0             	movzbl %al,%eax
   421b0:	29 d0                	sub    %edx,%eax
   421b2:	0f b6 c0             	movzbl %al,%eax
   421b5:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   421bc:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421bf:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   421c3:	8b 55 fc             	mov    -0x4(%rbp),%edx
   421c6:	ee                   	out    %al,(%dx)
}
   421c7:	90                   	nop
}
   421c8:	90                   	nop
   421c9:	c9                   	leaveq 
   421ca:	c3                   	retq   

00000000000421cb <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   421cb:	55                   	push   %rbp
   421cc:	48 89 e5             	mov    %rsp,%rbp
   421cf:	48 83 ec 20          	sub    $0x20,%rsp
   421d3:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   421da:	8b 45 f0             	mov    -0x10(%rbp),%eax
   421dd:	89 c2                	mov    %eax,%edx
   421df:	ec                   	in     (%dx),%al
   421e0:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   421e3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   421e7:	0f b6 c0             	movzbl %al,%eax
   421ea:	83 e0 01             	and    $0x1,%eax
   421ed:	85 c0                	test   %eax,%eax
   421ef:	75 0a                	jne    421fb <keyboard_readc+0x30>
        return -1;
   421f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   421f6:	e9 e7 01 00 00       	jmpq   423e2 <keyboard_readc+0x217>
   421fb:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42202:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42205:	89 c2                	mov    %eax,%edx
   42207:	ec                   	in     (%dx),%al
   42208:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   4220b:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   4220f:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42212:	0f b6 05 e9 e0 00 00 	movzbl 0xe0e9(%rip),%eax        # 50302 <last_escape.2>
   42219:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   4221c:	c6 05 df e0 00 00 00 	movb   $0x0,0xe0df(%rip)        # 50302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42223:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42227:	75 11                	jne    4223a <keyboard_readc+0x6f>
        last_escape = 0x80;
   42229:	c6 05 d2 e0 00 00 80 	movb   $0x80,0xe0d2(%rip)        # 50302 <last_escape.2>
        return 0;
   42230:	b8 00 00 00 00       	mov    $0x0,%eax
   42235:	e9 a8 01 00 00       	jmpq   423e2 <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   4223a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4223e:	84 c0                	test   %al,%al
   42240:	79 60                	jns    422a2 <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   42242:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42246:	83 e0 7f             	and    $0x7f,%eax
   42249:	89 c2                	mov    %eax,%edx
   4224b:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   4224f:	09 d0                	or     %edx,%eax
   42251:	48 98                	cltq   
   42253:	0f b6 80 e0 40 04 00 	movzbl 0x440e0(%rax),%eax
   4225a:	0f b6 c0             	movzbl %al,%eax
   4225d:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42260:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42267:	7e 2f                	jle    42298 <keyboard_readc+0xcd>
   42269:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   42270:	7f 26                	jg     42298 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42272:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42275:	2d fa 00 00 00       	sub    $0xfa,%eax
   4227a:	ba 01 00 00 00       	mov    $0x1,%edx
   4227f:	89 c1                	mov    %eax,%ecx
   42281:	d3 e2                	shl    %cl,%edx
   42283:	89 d0                	mov    %edx,%eax
   42285:	f7 d0                	not    %eax
   42287:	89 c2                	mov    %eax,%edx
   42289:	0f b6 05 73 e0 00 00 	movzbl 0xe073(%rip),%eax        # 50303 <modifiers.1>
   42290:	21 d0                	and    %edx,%eax
   42292:	88 05 6b e0 00 00    	mov    %al,0xe06b(%rip)        # 50303 <modifiers.1>
        }
        return 0;
   42298:	b8 00 00 00 00       	mov    $0x0,%eax
   4229d:	e9 40 01 00 00       	jmpq   423e2 <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   422a2:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   422a6:	0a 45 fa             	or     -0x6(%rbp),%al
   422a9:	0f b6 c0             	movzbl %al,%eax
   422ac:	48 98                	cltq   
   422ae:	0f b6 80 e0 40 04 00 	movzbl 0x440e0(%rax),%eax
   422b5:	0f b6 c0             	movzbl %al,%eax
   422b8:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   422bb:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   422bf:	7e 57                	jle    42318 <keyboard_readc+0x14d>
   422c1:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   422c5:	7f 51                	jg     42318 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   422c7:	0f b6 05 35 e0 00 00 	movzbl 0xe035(%rip),%eax        # 50303 <modifiers.1>
   422ce:	0f b6 c0             	movzbl %al,%eax
   422d1:	83 e0 02             	and    $0x2,%eax
   422d4:	85 c0                	test   %eax,%eax
   422d6:	74 09                	je     422e1 <keyboard_readc+0x116>
            ch -= 0x60;
   422d8:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   422dc:	e9 fd 00 00 00       	jmpq   423de <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   422e1:	0f b6 05 1b e0 00 00 	movzbl 0xe01b(%rip),%eax        # 50303 <modifiers.1>
   422e8:	0f b6 c0             	movzbl %al,%eax
   422eb:	83 e0 01             	and    $0x1,%eax
   422ee:	85 c0                	test   %eax,%eax
   422f0:	0f 94 c2             	sete   %dl
   422f3:	0f b6 05 09 e0 00 00 	movzbl 0xe009(%rip),%eax        # 50303 <modifiers.1>
   422fa:	0f b6 c0             	movzbl %al,%eax
   422fd:	83 e0 08             	and    $0x8,%eax
   42300:	85 c0                	test   %eax,%eax
   42302:	0f 94 c0             	sete   %al
   42305:	31 d0                	xor    %edx,%eax
   42307:	84 c0                	test   %al,%al
   42309:	0f 84 cf 00 00 00    	je     423de <keyboard_readc+0x213>
            ch -= 0x20;
   4230f:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42313:	e9 c6 00 00 00       	jmpq   423de <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42318:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   4231f:	7e 30                	jle    42351 <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42321:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42324:	2d fa 00 00 00       	sub    $0xfa,%eax
   42329:	ba 01 00 00 00       	mov    $0x1,%edx
   4232e:	89 c1                	mov    %eax,%ecx
   42330:	d3 e2                	shl    %cl,%edx
   42332:	89 d0                	mov    %edx,%eax
   42334:	89 c2                	mov    %eax,%edx
   42336:	0f b6 05 c6 df 00 00 	movzbl 0xdfc6(%rip),%eax        # 50303 <modifiers.1>
   4233d:	31 d0                	xor    %edx,%eax
   4233f:	88 05 be df 00 00    	mov    %al,0xdfbe(%rip)        # 50303 <modifiers.1>
        ch = 0;
   42345:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4234c:	e9 8e 00 00 00       	jmpq   423df <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   42351:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42358:	7e 2d                	jle    42387 <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   4235a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4235d:	2d fa 00 00 00       	sub    $0xfa,%eax
   42362:	ba 01 00 00 00       	mov    $0x1,%edx
   42367:	89 c1                	mov    %eax,%ecx
   42369:	d3 e2                	shl    %cl,%edx
   4236b:	89 d0                	mov    %edx,%eax
   4236d:	89 c2                	mov    %eax,%edx
   4236f:	0f b6 05 8d df 00 00 	movzbl 0xdf8d(%rip),%eax        # 50303 <modifiers.1>
   42376:	09 d0                	or     %edx,%eax
   42378:	88 05 85 df 00 00    	mov    %al,0xdf85(%rip)        # 50303 <modifiers.1>
        ch = 0;
   4237e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42385:	eb 58                	jmp    423df <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42387:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   4238b:	7e 31                	jle    423be <keyboard_readc+0x1f3>
   4238d:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   42394:	7f 28                	jg     423be <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42396:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42399:	8d 50 80             	lea    -0x80(%rax),%edx
   4239c:	0f b6 05 60 df 00 00 	movzbl 0xdf60(%rip),%eax        # 50303 <modifiers.1>
   423a3:	0f b6 c0             	movzbl %al,%eax
   423a6:	83 e0 03             	and    $0x3,%eax
   423a9:	48 98                	cltq   
   423ab:	48 63 d2             	movslq %edx,%rdx
   423ae:	0f b6 84 90 e0 41 04 	movzbl 0x441e0(%rax,%rdx,4),%eax
   423b5:	00 
   423b6:	0f b6 c0             	movzbl %al,%eax
   423b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
   423bc:	eb 21                	jmp    423df <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   423be:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   423c2:	7f 1b                	jg     423df <keyboard_readc+0x214>
   423c4:	0f b6 05 38 df 00 00 	movzbl 0xdf38(%rip),%eax        # 50303 <modifiers.1>
   423cb:	0f b6 c0             	movzbl %al,%eax
   423ce:	83 e0 02             	and    $0x2,%eax
   423d1:	85 c0                	test   %eax,%eax
   423d3:	74 0a                	je     423df <keyboard_readc+0x214>
        ch = 0;
   423d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   423dc:	eb 01                	jmp    423df <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   423de:	90                   	nop
    }

    return ch;
   423df:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   423e2:	c9                   	leaveq 
   423e3:	c3                   	retq   

00000000000423e4 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   423e4:	55                   	push   %rbp
   423e5:	48 89 e5             	mov    %rsp,%rbp
   423e8:	48 83 ec 20          	sub    $0x20,%rsp
   423ec:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   423f3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   423f6:	89 c2                	mov    %eax,%edx
   423f8:	ec                   	in     (%dx),%al
   423f9:	88 45 e3             	mov    %al,-0x1d(%rbp)
   423fc:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42403:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42406:	89 c2                	mov    %eax,%edx
   42408:	ec                   	in     (%dx),%al
   42409:	88 45 eb             	mov    %al,-0x15(%rbp)
   4240c:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42413:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42416:	89 c2                	mov    %eax,%edx
   42418:	ec                   	in     (%dx),%al
   42419:	88 45 f3             	mov    %al,-0xd(%rbp)
   4241c:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42423:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42426:	89 c2                	mov    %eax,%edx
   42428:	ec                   	in     (%dx),%al
   42429:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   4242c:	90                   	nop
   4242d:	c9                   	leaveq 
   4242e:	c3                   	retq   

000000000004242f <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   4242f:	55                   	push   %rbp
   42430:	48 89 e5             	mov    %rsp,%rbp
   42433:	48 83 ec 40          	sub    $0x40,%rsp
   42437:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4243b:	89 f0                	mov    %esi,%eax
   4243d:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42440:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42443:	8b 05 bb de 00 00    	mov    0xdebb(%rip),%eax        # 50304 <initialized.0>
   42449:	85 c0                	test   %eax,%eax
   4244b:	75 1e                	jne    4246b <parallel_port_putc+0x3c>
   4244d:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42454:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42458:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4245c:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4245f:	ee                   	out    %al,(%dx)
}
   42460:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   42461:	c7 05 99 de 00 00 01 	movl   $0x1,0xde99(%rip)        # 50304 <initialized.0>
   42468:	00 00 00 
    }

    for (int i = 0;
   4246b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42472:	eb 09                	jmp    4247d <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42474:	e8 6b ff ff ff       	callq  423e4 <delay>
         ++i) {
   42479:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   4247d:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42484:	7f 18                	jg     4249e <parallel_port_putc+0x6f>
   42486:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4248d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42490:	89 c2                	mov    %eax,%edx
   42492:	ec                   	in     (%dx),%al
   42493:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42496:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   4249a:	84 c0                	test   %al,%al
   4249c:	79 d6                	jns    42474 <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   4249e:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   424a2:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   424a9:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424ac:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   424b0:	8b 55 d8             	mov    -0x28(%rbp),%edx
   424b3:	ee                   	out    %al,(%dx)
}
   424b4:	90                   	nop
   424b5:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   424bc:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424c0:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   424c4:	8b 55 e0             	mov    -0x20(%rbp),%edx
   424c7:	ee                   	out    %al,(%dx)
}
   424c8:	90                   	nop
   424c9:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   424d0:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424d4:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   424d8:	8b 55 e8             	mov    -0x18(%rbp),%edx
   424db:	ee                   	out    %al,(%dx)
}
   424dc:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   424dd:	90                   	nop
   424de:	c9                   	leaveq 
   424df:	c3                   	retq   

00000000000424e0 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   424e0:	55                   	push   %rbp
   424e1:	48 89 e5             	mov    %rsp,%rbp
   424e4:	48 83 ec 20          	sub    $0x20,%rsp
   424e8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   424ec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   424f0:	48 c7 45 f8 2f 24 04 	movq   $0x4242f,-0x8(%rbp)
   424f7:	00 
    printer_vprintf(&p, 0, format, val);
   424f8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   424fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42500:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42504:	be 00 00 00 00       	mov    $0x0,%esi
   42509:	48 89 c7             	mov    %rax,%rdi
   4250c:	e8 85 0f 00 00       	callq  43496 <printer_vprintf>
}
   42511:	90                   	nop
   42512:	c9                   	leaveq 
   42513:	c3                   	retq   

0000000000042514 <log_printf>:

void log_printf(const char* format, ...) {
   42514:	55                   	push   %rbp
   42515:	48 89 e5             	mov    %rsp,%rbp
   42518:	48 83 ec 60          	sub    $0x60,%rsp
   4251c:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42520:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42524:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42528:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4252c:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42530:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42534:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4253b:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4253f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42543:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42547:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   4254b:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   4254f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42553:	48 89 d6             	mov    %rdx,%rsi
   42556:	48 89 c7             	mov    %rax,%rdi
   42559:	e8 82 ff ff ff       	callq  424e0 <log_vprintf>
    va_end(val);
}
   4255e:	90                   	nop
   4255f:	c9                   	leaveq 
   42560:	c3                   	retq   

0000000000042561 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42561:	55                   	push   %rbp
   42562:	48 89 e5             	mov    %rsp,%rbp
   42565:	48 83 ec 40          	sub    $0x40,%rsp
   42569:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4256c:	89 75 d8             	mov    %esi,-0x28(%rbp)
   4256f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   42573:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42577:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   4257b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4257f:	48 8b 0a             	mov    (%rdx),%rcx
   42582:	48 89 08             	mov    %rcx,(%rax)
   42585:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42589:	48 89 48 08          	mov    %rcx,0x8(%rax)
   4258d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   42591:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42595:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42599:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4259d:	48 89 d6             	mov    %rdx,%rsi
   425a0:	48 89 c7             	mov    %rax,%rdi
   425a3:	e8 38 ff ff ff       	callq  424e0 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   425a8:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   425ac:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   425b0:	8b 75 d8             	mov    -0x28(%rbp),%esi
   425b3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   425b6:	89 c7                	mov    %eax,%edi
   425b8:	e8 b8 15 00 00       	callq  43b75 <console_vprintf>
}
   425bd:	c9                   	leaveq 
   425be:	c3                   	retq   

00000000000425bf <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   425bf:	55                   	push   %rbp
   425c0:	48 89 e5             	mov    %rsp,%rbp
   425c3:	48 83 ec 60          	sub    $0x60,%rsp
   425c7:	89 7d ac             	mov    %edi,-0x54(%rbp)
   425ca:	89 75 a8             	mov    %esi,-0x58(%rbp)
   425cd:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   425d1:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   425d5:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   425d9:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   425dd:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   425e4:	48 8d 45 10          	lea    0x10(%rbp),%rax
   425e8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   425ec:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   425f0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   425f4:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   425f8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   425fc:	8b 75 a8             	mov    -0x58(%rbp),%esi
   425ff:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42602:	89 c7                	mov    %eax,%edi
   42604:	e8 58 ff ff ff       	callq  42561 <error_vprintf>
   42609:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   4260c:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   4260f:	c9                   	leaveq 
   42610:	c3                   	retq   

0000000000042611 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42611:	55                   	push   %rbp
   42612:	48 89 e5             	mov    %rsp,%rbp
   42615:	53                   	push   %rbx
   42616:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   4261a:	e8 ac fb ff ff       	callq  421cb <keyboard_readc>
   4261f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42622:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42626:	74 1c                	je     42644 <check_keyboard+0x33>
   42628:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   4262c:	74 16                	je     42644 <check_keyboard+0x33>
   4262e:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42632:	74 10                	je     42644 <check_keyboard+0x33>
   42634:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42638:	74 0a                	je     42644 <check_keyboard+0x33>
   4263a:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4263e:	0f 85 e9 00 00 00    	jne    4272d <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42644:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   4264b:	00 
        memset(pt, 0, PAGESIZE * 3);
   4264c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42650:	ba 00 30 00 00       	mov    $0x3000,%edx
   42655:	be 00 00 00 00       	mov    $0x0,%esi
   4265a:	48 89 c7             	mov    %rax,%rdi
   4265d:	e8 23 0d 00 00       	callq  43385 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42662:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42666:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   4266d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42671:	48 05 00 10 00 00    	add    $0x1000,%rax
   42677:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   4267e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42682:	48 05 00 20 00 00    	add    $0x2000,%rax
   42688:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   4268f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42693:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42697:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4269b:	0f 22 d8             	mov    %rax,%cr3
}
   4269e:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   4269f:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   426a6:	48 c7 45 e8 38 42 04 	movq   $0x44238,-0x18(%rbp)
   426ad:	00 
        if (c == 'a') {
   426ae:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   426b2:	75 0a                	jne    426be <check_keyboard+0xad>
            argument = "allocator";
   426b4:	48 c7 45 e8 3d 42 04 	movq   $0x4423d,-0x18(%rbp)
   426bb:	00 
   426bc:	eb 2e                	jmp    426ec <check_keyboard+0xdb>
        } else if (c == 'e') {
   426be:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   426c2:	75 0a                	jne    426ce <check_keyboard+0xbd>
            argument = "forkexit";
   426c4:	48 c7 45 e8 47 42 04 	movq   $0x44247,-0x18(%rbp)
   426cb:	00 
   426cc:	eb 1e                	jmp    426ec <check_keyboard+0xdb>
        }
        else if (c == 't'){
   426ce:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   426d2:	75 0a                	jne    426de <check_keyboard+0xcd>
            argument = "test";
   426d4:	48 c7 45 e8 50 42 04 	movq   $0x44250,-0x18(%rbp)
   426db:	00 
   426dc:	eb 0e                	jmp    426ec <check_keyboard+0xdb>
        }
        else if(c == '2'){
   426de:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   426e2:	75 08                	jne    426ec <check_keyboard+0xdb>
            argument = "test2";
   426e4:	48 c7 45 e8 55 42 04 	movq   $0x44255,-0x18(%rbp)
   426eb:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   426ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   426f0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   426f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   426f9:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   426fd:	76 14                	jbe    42713 <check_keyboard+0x102>
   426ff:	ba 5b 42 04 00       	mov    $0x4425b,%edx
   42704:	be 5c 02 00 00       	mov    $0x25c,%esi
   42709:	bf 77 42 04 00       	mov    $0x44277,%edi
   4270e:	e8 1f 01 00 00       	callq  42832 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42713:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42717:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   4271a:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   4271e:	48 89 c3             	mov    %rax,%rbx
   42721:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42726:	e9 d5 d8 ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   4272b:	eb 11                	jmp    4273e <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   4272d:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   42731:	74 06                	je     42739 <check_keyboard+0x128>
   42733:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42737:	75 05                	jne    4273e <check_keyboard+0x12d>
        poweroff();
   42739:	e8 ae f8 ff ff       	callq  41fec <poweroff>
    }
    return c;
   4273e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   42741:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42745:	c9                   	leaveq 
   42746:	c3                   	retq   

0000000000042747 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42747:	55                   	push   %rbp
   42748:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   4274b:	e8 c1 fe ff ff       	callq  42611 <check_keyboard>
   42750:	eb f9                	jmp    4274b <fail+0x4>

0000000000042752 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42752:	55                   	push   %rbp
   42753:	48 89 e5             	mov    %rsp,%rbp
   42756:	48 83 ec 60          	sub    $0x60,%rsp
   4275a:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   4275e:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42762:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42766:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4276a:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4276e:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42772:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42779:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4277d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42781:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42785:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42789:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   4278e:	0f 84 80 00 00 00    	je     42814 <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42794:	ba 84 42 04 00       	mov    $0x44284,%edx
   42799:	be 00 c0 00 00       	mov    $0xc000,%esi
   4279e:	bf 30 07 00 00       	mov    $0x730,%edi
   427a3:	b8 00 00 00 00       	mov    $0x0,%eax
   427a8:	e8 12 fe ff ff       	callq  425bf <error_printf>
   427ad:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   427b0:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   427b4:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   427b8:	8b 45 cc             	mov    -0x34(%rbp),%eax
   427bb:	be 00 c0 00 00       	mov    $0xc000,%esi
   427c0:	89 c7                	mov    %eax,%edi
   427c2:	e8 9a fd ff ff       	callq  42561 <error_vprintf>
   427c7:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   427ca:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   427cd:	48 63 c1             	movslq %ecx,%rax
   427d0:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   427d7:	48 c1 e8 20          	shr    $0x20,%rax
   427db:	c1 f8 05             	sar    $0x5,%eax
   427de:	89 ce                	mov    %ecx,%esi
   427e0:	c1 fe 1f             	sar    $0x1f,%esi
   427e3:	29 f0                	sub    %esi,%eax
   427e5:	89 c2                	mov    %eax,%edx
   427e7:	89 d0                	mov    %edx,%eax
   427e9:	c1 e0 02             	shl    $0x2,%eax
   427ec:	01 d0                	add    %edx,%eax
   427ee:	c1 e0 04             	shl    $0x4,%eax
   427f1:	29 c1                	sub    %eax,%ecx
   427f3:	89 ca                	mov    %ecx,%edx
   427f5:	85 d2                	test   %edx,%edx
   427f7:	74 34                	je     4282d <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   427f9:	8b 45 cc             	mov    -0x34(%rbp),%eax
   427fc:	ba 8c 42 04 00       	mov    $0x4428c,%edx
   42801:	be 00 c0 00 00       	mov    $0xc000,%esi
   42806:	89 c7                	mov    %eax,%edi
   42808:	b8 00 00 00 00       	mov    $0x0,%eax
   4280d:	e8 ad fd ff ff       	callq  425bf <error_printf>
   42812:	eb 19                	jmp    4282d <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42814:	ba 8e 42 04 00       	mov    $0x4428e,%edx
   42819:	be 00 c0 00 00       	mov    $0xc000,%esi
   4281e:	bf 30 07 00 00       	mov    $0x730,%edi
   42823:	b8 00 00 00 00       	mov    $0x0,%eax
   42828:	e8 92 fd ff ff       	callq  425bf <error_printf>
    }

    va_end(val);
    fail();
   4282d:	e8 15 ff ff ff       	callq  42747 <fail>

0000000000042832 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42832:	55                   	push   %rbp
   42833:	48 89 e5             	mov    %rsp,%rbp
   42836:	48 83 ec 20          	sub    $0x20,%rsp
   4283a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4283e:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42841:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42845:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42849:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4284c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42850:	48 89 c6             	mov    %rax,%rsi
   42853:	bf 94 42 04 00       	mov    $0x44294,%edi
   42858:	b8 00 00 00 00       	mov    $0x0,%eax
   4285d:	e8 f0 fe ff ff       	callq  42752 <panic>

0000000000042862 <default_exception>:
}

void default_exception(proc* p){
   42862:	55                   	push   %rbp
   42863:	48 89 e5             	mov    %rsp,%rbp
   42866:	48 83 ec 20          	sub    $0x20,%rsp
   4286a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   4286e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42872:	48 83 c0 08          	add    $0x8,%rax
   42876:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   4287a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4287e:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42885:	48 89 c6             	mov    %rax,%rsi
   42888:	bf b2 42 04 00       	mov    $0x442b2,%edi
   4288d:	b8 00 00 00 00       	mov    $0x0,%eax
   42892:	e8 bb fe ff ff       	callq  42752 <panic>

0000000000042897 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42897:	55                   	push   %rbp
   42898:	48 89 e5             	mov    %rsp,%rbp
   4289b:	48 83 ec 10          	sub    $0x10,%rsp
   4289f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   428a3:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   428a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   428aa:	78 06                	js     428b2 <pageindex+0x1b>
   428ac:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   428b0:	7e 14                	jle    428c6 <pageindex+0x2f>
   428b2:	ba d0 42 04 00       	mov    $0x442d0,%edx
   428b7:	be 1e 00 00 00       	mov    $0x1e,%esi
   428bc:	bf e9 42 04 00       	mov    $0x442e9,%edi
   428c1:	e8 6c ff ff ff       	callq  42832 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   428c6:	b8 03 00 00 00       	mov    $0x3,%eax
   428cb:	2b 45 f4             	sub    -0xc(%rbp),%eax
   428ce:	89 c2                	mov    %eax,%edx
   428d0:	89 d0                	mov    %edx,%eax
   428d2:	c1 e0 03             	shl    $0x3,%eax
   428d5:	01 d0                	add    %edx,%eax
   428d7:	83 c0 0c             	add    $0xc,%eax
   428da:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   428de:	89 c1                	mov    %eax,%ecx
   428e0:	48 d3 ea             	shr    %cl,%rdx
   428e3:	48 89 d0             	mov    %rdx,%rax
   428e6:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   428eb:	c9                   	leaveq 
   428ec:	c3                   	retq   

00000000000428ed <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   428ed:	55                   	push   %rbp
   428ee:	48 89 e5             	mov    %rsp,%rbp
   428f1:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   428f5:	48 c7 05 00 e7 00 00 	movq   $0x52000,0xe700(%rip)        # 51000 <kernel_pagetable>
   428fc:	00 20 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   42900:	ba 00 50 00 00       	mov    $0x5000,%edx
   42905:	be 00 00 00 00       	mov    $0x0,%esi
   4290a:	bf 00 20 05 00       	mov    $0x52000,%edi
   4290f:	e8 71 0a 00 00       	callq  43385 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   42914:	b8 00 30 05 00       	mov    $0x53000,%eax
   42919:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   4291d:	48 89 05 dc f6 00 00 	mov    %rax,0xf6dc(%rip)        # 52000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   42924:	b8 00 40 05 00       	mov    $0x54000,%eax
   42929:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   4292d:	48 89 05 cc 06 01 00 	mov    %rax,0x106cc(%rip)        # 53000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42934:	b8 00 50 05 00       	mov    $0x55000,%eax
   42939:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   4293d:	48 89 05 bc 16 01 00 	mov    %rax,0x116bc(%rip)        # 54000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42944:	b8 00 60 05 00       	mov    $0x56000,%eax
   42949:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   4294d:	48 89 05 b4 16 01 00 	mov    %rax,0x116b4(%rip)        # 54008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   42954:	48 8b 05 a5 e6 00 00 	mov    0xe6a5(%rip),%rax        # 51000 <kernel_pagetable>
   4295b:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   42961:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42966:	ba 00 00 00 00       	mov    $0x0,%edx
   4296b:	be 00 00 00 00       	mov    $0x0,%esi
   42970:	48 89 c7             	mov    %rax,%rdi
   42973:	e8 b9 01 00 00       	callq  42b31 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42978:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4297f:	00 
   42980:	eb 62                	jmp    429e4 <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   42982:	48 8b 0d 77 e6 00 00 	mov    0xe677(%rip),%rcx        # 51000 <kernel_pagetable>
   42989:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   4298d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42991:	48 89 ce             	mov    %rcx,%rsi
   42994:	48 89 c7             	mov    %rax,%rdi
   42997:	e8 50 05 00 00       	callq  42eec <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   4299c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   429a0:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   429a4:	74 14                	je     429ba <virtual_memory_init+0xcd>
   429a6:	ba f2 42 04 00       	mov    $0x442f2,%edx
   429ab:	be 2d 00 00 00       	mov    $0x2d,%esi
   429b0:	bf 02 43 04 00       	mov    $0x44302,%edi
   429b5:	e8 78 fe ff ff       	callq  42832 <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   429ba:	8b 45 f0             	mov    -0x10(%rbp),%eax
   429bd:	48 98                	cltq   
   429bf:	83 e0 03             	and    $0x3,%eax
   429c2:	48 83 f8 03          	cmp    $0x3,%rax
   429c6:	74 14                	je     429dc <virtual_memory_init+0xef>
   429c8:	ba 08 43 04 00       	mov    $0x44308,%edx
   429cd:	be 2e 00 00 00       	mov    $0x2e,%esi
   429d2:	bf 02 43 04 00       	mov    $0x44302,%edi
   429d7:	e8 56 fe ff ff       	callq  42832 <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   429dc:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   429e3:	00 
   429e4:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   429eb:	00 
   429ec:	76 94                	jbe    42982 <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   429ee:	48 8b 05 0b e6 00 00 	mov    0xe60b(%rip),%rax        # 51000 <kernel_pagetable>
   429f5:	48 89 c7             	mov    %rax,%rdi
   429f8:	e8 03 00 00 00       	callq  42a00 <set_pagetable>
}
   429fd:	90                   	nop
   429fe:	c9                   	leaveq 
   429ff:	c3                   	retq   

0000000000042a00 <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   42a00:	55                   	push   %rbp
   42a01:	48 89 e5             	mov    %rsp,%rbp
   42a04:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42a08:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42a0c:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42a10:	25 ff 0f 00 00       	and    $0xfff,%eax
   42a15:	48 85 c0             	test   %rax,%rax
   42a18:	74 14                	je     42a2e <set_pagetable+0x2e>
   42a1a:	ba 35 43 04 00       	mov    $0x44335,%edx
   42a1f:	be 3d 00 00 00       	mov    $0x3d,%esi
   42a24:	bf 02 43 04 00       	mov    $0x44302,%edi
   42a29:	e8 04 fe ff ff       	callq  42832 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   42a2e:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42a33:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   42a37:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a3b:	48 89 ce             	mov    %rcx,%rsi
   42a3e:	48 89 c7             	mov    %rax,%rdi
   42a41:	e8 a6 04 00 00       	callq  42eec <virtual_memory_lookup>
   42a46:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42a4a:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42a4f:	48 39 d0             	cmp    %rdx,%rax
   42a52:	74 14                	je     42a68 <set_pagetable+0x68>
   42a54:	ba 50 43 04 00       	mov    $0x44350,%edx
   42a59:	be 3f 00 00 00       	mov    $0x3f,%esi
   42a5e:	bf 02 43 04 00       	mov    $0x44302,%edi
   42a63:	e8 ca fd ff ff       	callq  42832 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   42a68:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   42a6c:	48 8b 0d 8d e5 00 00 	mov    0xe58d(%rip),%rcx        # 51000 <kernel_pagetable>
   42a73:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42a77:	48 89 ce             	mov    %rcx,%rsi
   42a7a:	48 89 c7             	mov    %rax,%rdi
   42a7d:	e8 6a 04 00 00       	callq  42eec <virtual_memory_lookup>
   42a82:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42a86:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42a8a:	48 39 c2             	cmp    %rax,%rdx
   42a8d:	74 14                	je     42aa3 <set_pagetable+0xa3>
   42a8f:	ba b8 43 04 00       	mov    $0x443b8,%edx
   42a94:	be 41 00 00 00       	mov    $0x41,%esi
   42a99:	bf 02 43 04 00       	mov    $0x44302,%edi
   42a9e:	e8 8f fd ff ff       	callq  42832 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42aa3:	48 8b 05 56 e5 00 00 	mov    0xe556(%rip),%rax        # 51000 <kernel_pagetable>
   42aaa:	48 89 c2             	mov    %rax,%rdx
   42aad:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42ab1:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42ab5:	48 89 ce             	mov    %rcx,%rsi
   42ab8:	48 89 c7             	mov    %rax,%rdi
   42abb:	e8 2c 04 00 00       	callq  42eec <virtual_memory_lookup>
   42ac0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42ac4:	48 8b 15 35 e5 00 00 	mov    0xe535(%rip),%rdx        # 51000 <kernel_pagetable>
   42acb:	48 39 d0             	cmp    %rdx,%rax
   42ace:	74 14                	je     42ae4 <set_pagetable+0xe4>
   42ad0:	ba 18 44 04 00       	mov    $0x44418,%edx
   42ad5:	be 43 00 00 00       	mov    $0x43,%esi
   42ada:	bf 02 43 04 00       	mov    $0x44302,%edi
   42adf:	e8 4e fd ff ff       	callq  42832 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   42ae4:	ba 31 2b 04 00       	mov    $0x42b31,%edx
   42ae9:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42aed:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42af1:	48 89 ce             	mov    %rcx,%rsi
   42af4:	48 89 c7             	mov    %rax,%rdi
   42af7:	e8 f0 03 00 00       	callq  42eec <virtual_memory_lookup>
   42afc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42b00:	ba 31 2b 04 00       	mov    $0x42b31,%edx
   42b05:	48 39 d0             	cmp    %rdx,%rax
   42b08:	74 14                	je     42b1e <set_pagetable+0x11e>
   42b0a:	ba 80 44 04 00       	mov    $0x44480,%edx
   42b0f:	be 45 00 00 00       	mov    $0x45,%esi
   42b14:	bf 02 43 04 00       	mov    $0x44302,%edi
   42b19:	e8 14 fd ff ff       	callq  42832 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   42b1e:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42b22:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42b26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b2a:	0f 22 d8             	mov    %rax,%cr3
}
   42b2d:	90                   	nop
}
   42b2e:	90                   	nop
   42b2f:	c9                   	leaveq 
   42b30:	c3                   	retq   

0000000000042b31 <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   42b31:	55                   	push   %rbp
   42b32:	48 89 e5             	mov    %rsp,%rbp
   42b35:	53                   	push   %rbx
   42b36:	48 83 ec 58          	sub    $0x58,%rsp
   42b3a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42b3e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42b42:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42b46:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42b4a:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42b4e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42b52:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b57:	48 85 c0             	test   %rax,%rax
   42b5a:	74 14                	je     42b70 <virtual_memory_map+0x3f>
   42b5c:	ba e6 44 04 00       	mov    $0x444e6,%edx
   42b61:	be 63 00 00 00       	mov    $0x63,%esi
   42b66:	bf 02 43 04 00       	mov    $0x44302,%edi
   42b6b:	e8 c2 fc ff ff       	callq  42832 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   42b70:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b74:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b79:	48 85 c0             	test   %rax,%rax
   42b7c:	74 14                	je     42b92 <virtual_memory_map+0x61>
   42b7e:	ba f9 44 04 00       	mov    $0x444f9,%edx
   42b83:	be 64 00 00 00       	mov    $0x64,%esi
   42b88:	bf 02 43 04 00       	mov    $0x44302,%edi
   42b8d:	e8 a0 fc ff ff       	callq  42832 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42b92:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42b96:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b9a:	48 01 d0             	add    %rdx,%rax
   42b9d:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42ba1:	76 24                	jbe    42bc7 <virtual_memory_map+0x96>
   42ba3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42ba7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42bab:	48 01 d0             	add    %rdx,%rax
   42bae:	48 85 c0             	test   %rax,%rax
   42bb1:	74 14                	je     42bc7 <virtual_memory_map+0x96>
   42bb3:	ba 0c 45 04 00       	mov    $0x4450c,%edx
   42bb8:	be 65 00 00 00       	mov    $0x65,%esi
   42bbd:	bf 02 43 04 00       	mov    $0x44302,%edi
   42bc2:	e8 6b fc ff ff       	callq  42832 <assert_fail>
    if (perm & PTE_P) {
   42bc7:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42bca:	48 98                	cltq   
   42bcc:	83 e0 01             	and    $0x1,%eax
   42bcf:	48 85 c0             	test   %rax,%rax
   42bd2:	74 6e                	je     42c42 <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   42bd4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42bd8:	25 ff 0f 00 00       	and    $0xfff,%eax
   42bdd:	48 85 c0             	test   %rax,%rax
   42be0:	74 14                	je     42bf6 <virtual_memory_map+0xc5>
   42be2:	ba 2a 45 04 00       	mov    $0x4452a,%edx
   42be7:	be 67 00 00 00       	mov    $0x67,%esi
   42bec:	bf 02 43 04 00       	mov    $0x44302,%edi
   42bf1:	e8 3c fc ff ff       	callq  42832 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   42bf6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42bfa:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42bfe:	48 01 d0             	add    %rdx,%rax
   42c01:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42c05:	76 14                	jbe    42c1b <virtual_memory_map+0xea>
   42c07:	ba 3d 45 04 00       	mov    $0x4453d,%edx
   42c0c:	be 68 00 00 00       	mov    $0x68,%esi
   42c11:	bf 02 43 04 00       	mov    $0x44302,%edi
   42c16:	e8 17 fc ff ff       	callq  42832 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42c1b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42c1f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42c23:	48 01 d0             	add    %rdx,%rax
   42c26:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42c2c:	76 14                	jbe    42c42 <virtual_memory_map+0x111>
   42c2e:	ba 4b 45 04 00       	mov    $0x4454b,%edx
   42c33:	be 69 00 00 00       	mov    $0x69,%esi
   42c38:	bf 02 43 04 00       	mov    $0x44302,%edi
   42c3d:	e8 f0 fb ff ff       	callq  42832 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   42c42:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42c46:	78 09                	js     42c51 <virtual_memory_map+0x120>
   42c48:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42c4f:	7e 14                	jle    42c65 <virtual_memory_map+0x134>
   42c51:	ba 67 45 04 00       	mov    $0x44567,%edx
   42c56:	be 6b 00 00 00       	mov    $0x6b,%esi
   42c5b:	bf 02 43 04 00       	mov    $0x44302,%edi
   42c60:	e8 cd fb ff ff       	callq  42832 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42c65:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42c69:	25 ff 0f 00 00       	and    $0xfff,%eax
   42c6e:	48 85 c0             	test   %rax,%rax
   42c71:	74 14                	je     42c87 <virtual_memory_map+0x156>
   42c73:	ba 88 45 04 00       	mov    $0x44588,%edx
   42c78:	be 6c 00 00 00       	mov    $0x6c,%esi
   42c7d:	bf 02 43 04 00       	mov    $0x44302,%edi
   42c82:	e8 ab fb ff ff       	callq  42832 <assert_fail>

    int last_index123 = -1;
   42c87:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   42c8e:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42c95:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42c96:	e9 e1 00 00 00       	jmpq   42d7c <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42c9b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42c9f:	48 c1 e8 15          	shr    $0x15,%rax
   42ca3:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   42ca6:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42ca9:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42cac:	74 20                	je     42cce <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   42cae:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42cb1:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42cb5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42cb9:	48 89 ce             	mov    %rcx,%rsi
   42cbc:	48 89 c7             	mov    %rax,%rdi
   42cbf:	e8 ce 00 00 00       	callq  42d92 <lookup_l4pagetable>
   42cc4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42cc8:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42ccb:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   42cce:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42cd1:	48 98                	cltq   
   42cd3:	83 e0 01             	and    $0x1,%eax
   42cd6:	48 85 c0             	test   %rax,%rax
   42cd9:	74 34                	je     42d0f <virtual_memory_map+0x1de>
   42cdb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42ce0:	74 2d                	je     42d0f <virtual_memory_map+0x1de>
            // TODO
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   42ce2:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42ce5:	48 63 d8             	movslq %eax,%rbx
   42ce8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42cec:	be 03 00 00 00       	mov    $0x3,%esi
   42cf1:	48 89 c7             	mov    %rax,%rdi
   42cf4:	e8 9e fb ff ff       	callq  42897 <pageindex>
   42cf9:	89 c2                	mov    %eax,%edx
   42cfb:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42cff:	48 89 d9             	mov    %rbx,%rcx
   42d02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42d06:	48 63 d2             	movslq %edx,%rdx
   42d09:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42d0d:	eb 55                	jmp    42d64 <virtual_memory_map+0x233>
            // map `pa` at appropriate entry with permissions `perm`
        } else if (l4pagetable) { // if page is NOT marked present
   42d0f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42d14:	74 26                	je     42d3c <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   42d16:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42d1a:	be 03 00 00 00       	mov    $0x3,%esi
   42d1f:	48 89 c7             	mov    %rax,%rdi
   42d22:	e8 70 fb ff ff       	callq  42897 <pageindex>
   42d27:	89 c2                	mov    %eax,%edx
   42d29:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d2c:	48 63 c8             	movslq %eax,%rcx
   42d2f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42d33:	48 63 d2             	movslq %edx,%rdx
   42d36:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42d3a:	eb 28                	jmp    42d64 <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   42d3c:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d3f:	48 98                	cltq   
   42d41:	83 e0 01             	and    $0x1,%eax
   42d44:	48 85 c0             	test   %rax,%rax
   42d47:	74 1b                	je     42d64 <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   42d49:	be 84 00 00 00       	mov    $0x84,%esi
   42d4e:	bf b0 45 04 00       	mov    $0x445b0,%edi
   42d53:	b8 00 00 00 00       	mov    $0x0,%eax
   42d58:	e8 b7 f7 ff ff       	callq  42514 <log_printf>
            return -1;
   42d5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42d62:	eb 28                	jmp    42d8c <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42d64:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   42d6b:	00 
   42d6c:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   42d73:	00 
   42d74:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   42d7b:	00 
   42d7c:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   42d81:	0f 85 14 ff ff ff    	jne    42c9b <virtual_memory_map+0x16a>
        }
    }
    return 0;
   42d87:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42d8c:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42d90:	c9                   	leaveq 
   42d91:	c3                   	retq   

0000000000042d92 <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   42d92:	55                   	push   %rbp
   42d93:	48 89 e5             	mov    %rsp,%rbp
   42d96:	48 83 ec 40          	sub    $0x40,%rsp
   42d9a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42d9e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   42da2:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   42da5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42da9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   42dad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42db4:	e9 23 01 00 00       	jmpq   42edc <lookup_l4pagetable+0x14a>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   42db9:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42dbc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42dc0:	89 d6                	mov    %edx,%esi
   42dc2:	48 89 c7             	mov    %rax,%rdi
   42dc5:	e8 cd fa ff ff       	callq  42897 <pageindex>
   42dca:	89 c2                	mov    %eax,%edx
   42dcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42dd0:	48 63 d2             	movslq %edx,%rdx
   42dd3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42dd7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   42ddb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ddf:	83 e0 01             	and    $0x1,%eax
   42de2:	48 85 c0             	test   %rax,%rax
   42de5:	75 63                	jne    42e4a <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   42de7:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42dea:	8d 48 02             	lea    0x2(%rax),%ecx
   42ded:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42df1:	25 ff 0f 00 00       	and    $0xfff,%eax
   42df6:	48 89 c2             	mov    %rax,%rdx
   42df9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42dfd:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e03:	48 89 c6             	mov    %rax,%rsi
   42e06:	bf f0 45 04 00       	mov    $0x445f0,%edi
   42e0b:	b8 00 00 00 00       	mov    $0x0,%eax
   42e10:	e8 ff f6 ff ff       	callq  42514 <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   42e15:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42e18:	48 98                	cltq   
   42e1a:	83 e0 01             	and    $0x1,%eax
   42e1d:	48 85 c0             	test   %rax,%rax
   42e20:	75 0a                	jne    42e2c <lookup_l4pagetable+0x9a>
                return NULL;
   42e22:	b8 00 00 00 00       	mov    $0x0,%eax
   42e27:	e9 be 00 00 00       	jmpq   42eea <lookup_l4pagetable+0x158>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   42e2c:	be a7 00 00 00       	mov    $0xa7,%esi
   42e31:	bf 58 46 04 00       	mov    $0x44658,%edi
   42e36:	b8 00 00 00 00       	mov    $0x0,%eax
   42e3b:	e8 d4 f6 ff ff       	callq  42514 <log_printf>
            return NULL;
   42e40:	b8 00 00 00 00       	mov    $0x0,%eax
   42e45:	e9 a0 00 00 00       	jmpq   42eea <lookup_l4pagetable+0x158>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   42e4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e4e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e54:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42e5a:	76 14                	jbe    42e70 <lookup_l4pagetable+0xde>
   42e5c:	ba 98 46 04 00       	mov    $0x44698,%edx
   42e61:	be ac 00 00 00       	mov    $0xac,%esi
   42e66:	bf 02 43 04 00       	mov    $0x44302,%edi
   42e6b:	e8 c2 f9 ff ff       	callq  42832 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   42e70:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42e73:	48 98                	cltq   
   42e75:	83 e0 02             	and    $0x2,%eax
   42e78:	48 85 c0             	test   %rax,%rax
   42e7b:	74 20                	je     42e9d <lookup_l4pagetable+0x10b>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   42e7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e81:	83 e0 02             	and    $0x2,%eax
   42e84:	48 85 c0             	test   %rax,%rax
   42e87:	75 14                	jne    42e9d <lookup_l4pagetable+0x10b>
   42e89:	ba b8 46 04 00       	mov    $0x446b8,%edx
   42e8e:	be ae 00 00 00       	mov    $0xae,%esi
   42e93:	bf 02 43 04 00       	mov    $0x44302,%edi
   42e98:	e8 95 f9 ff ff       	callq  42832 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   42e9d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42ea0:	48 98                	cltq   
   42ea2:	83 e0 04             	and    $0x4,%eax
   42ea5:	48 85 c0             	test   %rax,%rax
   42ea8:	74 20                	je     42eca <lookup_l4pagetable+0x138>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   42eaa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42eae:	83 e0 04             	and    $0x4,%eax
   42eb1:	48 85 c0             	test   %rax,%rax
   42eb4:	75 14                	jne    42eca <lookup_l4pagetable+0x138>
   42eb6:	ba c3 46 04 00       	mov    $0x446c3,%edx
   42ebb:	be b1 00 00 00       	mov    $0xb1,%esi
   42ec0:	bf 02 43 04 00       	mov    $0x44302,%edi
   42ec5:	e8 68 f9 ff ff       	callq  42832 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   42eca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ece:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42ed4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   42ed8:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42edc:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   42ee0:	0f 8e d3 fe ff ff    	jle    42db9 <lookup_l4pagetable+0x27>
    }
    return pt;
   42ee6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   42eea:	c9                   	leaveq 
   42eeb:	c3                   	retq   

0000000000042eec <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   42eec:	55                   	push   %rbp
   42eed:	48 89 e5             	mov    %rsp,%rbp
   42ef0:	48 83 ec 50          	sub    $0x50,%rsp
   42ef4:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42ef8:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42efc:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   42f00:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42f04:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   42f08:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   42f0f:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42f10:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   42f17:	eb 41                	jmp    42f5a <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   42f19:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42f1c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42f20:	89 d6                	mov    %edx,%esi
   42f22:	48 89 c7             	mov    %rax,%rdi
   42f25:	e8 6d f9 ff ff       	callq  42897 <pageindex>
   42f2a:	89 c2                	mov    %eax,%edx
   42f2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42f30:	48 63 d2             	movslq %edx,%rdx
   42f33:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   42f37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f3b:	83 e0 06             	and    $0x6,%eax
   42f3e:	48 f7 d0             	not    %rax
   42f41:	48 21 d0             	and    %rdx,%rax
   42f44:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   42f48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f4c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42f52:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42f56:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   42f5a:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   42f5e:	7f 0c                	jg     42f6c <virtual_memory_lookup+0x80>
   42f60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f64:	83 e0 01             	and    $0x1,%eax
   42f67:	48 85 c0             	test   %rax,%rax
   42f6a:	75 ad                	jne    42f19 <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   42f6c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   42f73:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   42f7a:	ff 
   42f7b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   42f82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f86:	83 e0 01             	and    $0x1,%eax
   42f89:	48 85 c0             	test   %rax,%rax
   42f8c:	74 34                	je     42fc2 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   42f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f92:	48 c1 e8 0c          	shr    $0xc,%rax
   42f96:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   42f99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f9d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42fa3:	48 89 c2             	mov    %rax,%rdx
   42fa6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42faa:	25 ff 0f 00 00       	and    $0xfff,%eax
   42faf:	48 09 d0             	or     %rdx,%rax
   42fb2:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   42fb6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fba:	25 ff 0f 00 00       	and    $0xfff,%eax
   42fbf:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   42fc2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42fc6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42fca:	48 89 10             	mov    %rdx,(%rax)
   42fcd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   42fd1:	48 89 50 08          	mov    %rdx,0x8(%rax)
   42fd5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42fd9:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   42fdd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42fe1:	c9                   	leaveq 
   42fe2:	c3                   	retq   

0000000000042fe3 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   42fe3:	55                   	push   %rbp
   42fe4:	48 89 e5             	mov    %rsp,%rbp
   42fe7:	48 83 ec 40          	sub    $0x40,%rsp
   42feb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42fef:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   42ff2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   42ff6:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   42ffd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43001:	78 08                	js     4300b <program_load+0x28>
   43003:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43006:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   43009:	7c 14                	jl     4301f <program_load+0x3c>
   4300b:	ba d0 46 04 00       	mov    $0x446d0,%edx
   43010:	be 37 00 00 00       	mov    $0x37,%esi
   43015:	bf 00 47 04 00       	mov    $0x44700,%edi
   4301a:	e8 13 f8 ff ff       	callq  42832 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   4301f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43022:	48 98                	cltq   
   43024:	48 c1 e0 04          	shl    $0x4,%rax
   43028:	48 05 20 50 04 00    	add    $0x45020,%rax
   4302e:	48 8b 00             	mov    (%rax),%rax
   43031:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   43035:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43039:	8b 00                	mov    (%rax),%eax
   4303b:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43040:	74 14                	je     43056 <program_load+0x73>
   43042:	ba 0b 47 04 00       	mov    $0x4470b,%edx
   43047:	be 39 00 00 00       	mov    $0x39,%esi
   4304c:	bf 00 47 04 00       	mov    $0x44700,%edi
   43051:	e8 dc f7 ff ff       	callq  42832 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   43056:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4305a:	48 8b 50 20          	mov    0x20(%rax),%rdx
   4305e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43062:	48 01 d0             	add    %rdx,%rax
   43065:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   43069:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43070:	e9 94 00 00 00       	jmpq   43109 <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   43075:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43078:	48 63 d0             	movslq %eax,%rdx
   4307b:	48 89 d0             	mov    %rdx,%rax
   4307e:	48 c1 e0 03          	shl    $0x3,%rax
   43082:	48 29 d0             	sub    %rdx,%rax
   43085:	48 c1 e0 03          	shl    $0x3,%rax
   43089:	48 89 c2             	mov    %rax,%rdx
   4308c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43090:	48 01 d0             	add    %rdx,%rax
   43093:	8b 00                	mov    (%rax),%eax
   43095:	83 f8 01             	cmp    $0x1,%eax
   43098:	75 6b                	jne    43105 <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   4309a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4309d:	48 63 d0             	movslq %eax,%rdx
   430a0:	48 89 d0             	mov    %rdx,%rax
   430a3:	48 c1 e0 03          	shl    $0x3,%rax
   430a7:	48 29 d0             	sub    %rdx,%rax
   430aa:	48 c1 e0 03          	shl    $0x3,%rax
   430ae:	48 89 c2             	mov    %rax,%rdx
   430b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430b5:	48 01 d0             	add    %rdx,%rax
   430b8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   430bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430c0:	48 01 d0             	add    %rdx,%rax
   430c3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   430c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   430ca:	48 63 d0             	movslq %eax,%rdx
   430cd:	48 89 d0             	mov    %rdx,%rax
   430d0:	48 c1 e0 03          	shl    $0x3,%rax
   430d4:	48 29 d0             	sub    %rdx,%rax
   430d7:	48 c1 e0 03          	shl    $0x3,%rax
   430db:	48 89 c2             	mov    %rax,%rdx
   430de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430e2:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   430e6:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   430ea:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   430ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   430f2:	48 89 c7             	mov    %rax,%rdi
   430f5:	e8 3d 00 00 00       	callq  43137 <program_load_segment>
   430fa:	85 c0                	test   %eax,%eax
   430fc:	79 07                	jns    43105 <program_load+0x122>
                return -1;
   430fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43103:	eb 30                	jmp    43135 <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43105:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43109:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4310d:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43111:	0f b7 c0             	movzwl %ax,%eax
   43114:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43117:	0f 8c 58 ff ff ff    	jl     43075 <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4311d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43121:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43125:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43129:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43130:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43135:	c9                   	leaveq 
   43136:	c3                   	retq   

0000000000043137 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43137:	55                   	push   %rbp
   43138:	48 89 e5             	mov    %rsp,%rbp
   4313b:	48 83 ec 40          	sub    $0x40,%rsp
   4313f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43143:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   43147:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   4314b:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   4314f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43153:	48 8b 40 10          	mov    0x10(%rax),%rax
   43157:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   4315b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4315f:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43163:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43167:	48 01 d0             	add    %rdx,%rax
   4316a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   4316e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43172:	48 8b 50 28          	mov    0x28(%rax),%rdx
   43176:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4317a:	48 01 d0             	add    %rdx,%rax
   4317d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   43181:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   43188:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43189:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4318d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43191:	eb 7c                	jmp    4320f <program_load_segment+0xd8>
        if (assign_physical_page(addr, p->p_pid) < 0
   43193:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43197:	8b 00                	mov    (%rax),%eax
   43199:	0f be d0             	movsbl %al,%edx
   4319c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431a0:	89 d6                	mov    %edx,%esi
   431a2:	48 89 c7             	mov    %rax,%rdi
   431a5:	e8 4b d7 ff ff       	callq  408f5 <assign_physical_page>
   431aa:	85 c0                	test   %eax,%eax
   431ac:	78 2a                	js     431d8 <program_load_segment+0xa1>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   431ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   431b2:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   431b9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   431bd:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   431c1:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   431c7:	b9 00 10 00 00       	mov    $0x1000,%ecx
   431cc:	48 89 c7             	mov    %rax,%rdi
   431cf:	e8 5d f9 ff ff       	callq  42b31 <virtual_memory_map>
   431d4:	85 c0                	test   %eax,%eax
   431d6:	79 2f                	jns    43207 <program_load_segment+0xd0>
                                  PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   431d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   431dc:	8b 00                	mov    (%rax),%eax
   431de:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   431e2:	49 89 d0             	mov    %rdx,%r8
   431e5:	89 c1                	mov    %eax,%ecx
   431e7:	ba 28 47 04 00       	mov    $0x44728,%edx
   431ec:	be 00 c0 00 00       	mov    $0xc000,%esi
   431f1:	bf e0 06 00 00       	mov    $0x6e0,%edi
   431f6:	b8 00 00 00 00       	mov    $0x0,%eax
   431fb:	e8 ba 09 00 00       	callq  43bba <console_printf>
            return -1;
   43200:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43205:	eb 77                	jmp    4327e <program_load_segment+0x147>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43207:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4320e:	00 
   4320f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43213:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43217:	0f 82 76 ff ff ff    	jb     43193 <program_load_segment+0x5c>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   4321d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43221:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43228:	48 89 c7             	mov    %rax,%rdi
   4322b:	e8 d0 f7 ff ff       	callq  42a00 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   43230:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43234:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   43238:	48 89 c2             	mov    %rax,%rdx
   4323b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4323f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43243:	48 89 ce             	mov    %rcx,%rsi
   43246:	48 89 c7             	mov    %rax,%rdi
   43249:	e8 ce 00 00 00       	callq  4331c <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   4324e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43252:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43256:	48 89 c2             	mov    %rax,%rdx
   43259:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4325d:	be 00 00 00 00       	mov    $0x0,%esi
   43262:	48 89 c7             	mov    %rax,%rdi
   43265:	e8 1b 01 00 00       	callq  43385 <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   4326a:	48 8b 05 8f dd 00 00 	mov    0xdd8f(%rip),%rax        # 51000 <kernel_pagetable>
   43271:	48 89 c7             	mov    %rax,%rdi
   43274:	e8 87 f7 ff ff       	callq  42a00 <set_pagetable>
    return 0;
   43279:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4327e:	c9                   	leaveq 
   4327f:	c3                   	retq   

0000000000043280 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   43280:	48 89 f9             	mov    %rdi,%rcx
   43283:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43285:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   4328c:	00 
   4328d:	72 08                	jb     43297 <console_putc+0x17>
        cp->cursor = console;
   4328f:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   43296:	00 
    }
    if (c == '\n') {
   43297:	40 80 fe 0a          	cmp    $0xa,%sil
   4329b:	74 16                	je     432b3 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   4329d:	48 8b 41 08          	mov    0x8(%rcx),%rax
   432a1:	48 8d 50 02          	lea    0x2(%rax),%rdx
   432a5:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   432a9:	40 0f b6 f6          	movzbl %sil,%esi
   432ad:	09 fe                	or     %edi,%esi
   432af:	66 89 30             	mov    %si,(%rax)
    }
}
   432b2:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   432b3:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   432b7:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   432be:	4c 89 c6             	mov    %r8,%rsi
   432c1:	48 d1 fe             	sar    %rsi
   432c4:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   432cb:	66 66 66 
   432ce:	48 89 f0             	mov    %rsi,%rax
   432d1:	48 f7 ea             	imul   %rdx
   432d4:	48 c1 fa 05          	sar    $0x5,%rdx
   432d8:	49 c1 f8 3f          	sar    $0x3f,%r8
   432dc:	4c 29 c2             	sub    %r8,%rdx
   432df:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   432e3:	48 c1 e2 04          	shl    $0x4,%rdx
   432e7:	89 f0                	mov    %esi,%eax
   432e9:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   432eb:	83 cf 20             	or     $0x20,%edi
   432ee:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   432f2:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   432f6:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   432fa:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   432fd:	83 c0 01             	add    $0x1,%eax
   43300:	83 f8 50             	cmp    $0x50,%eax
   43303:	75 e9                	jne    432ee <console_putc+0x6e>
   43305:	c3                   	retq   

0000000000043306 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43306:	48 8b 47 08          	mov    0x8(%rdi),%rax
   4330a:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   4330e:	73 0b                	jae    4331b <string_putc+0x15>
        *sp->s++ = c;
   43310:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43314:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   43318:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   4331b:	c3                   	retq   

000000000004331c <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   4331c:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   4331f:	48 85 d2             	test   %rdx,%rdx
   43322:	74 17                	je     4333b <memcpy+0x1f>
   43324:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   43329:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   4332e:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43332:	48 83 c1 01          	add    $0x1,%rcx
   43336:	48 39 d1             	cmp    %rdx,%rcx
   43339:	75 ee                	jne    43329 <memcpy+0xd>
}
   4333b:	c3                   	retq   

000000000004333c <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   4333c:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   4333f:	48 39 fe             	cmp    %rdi,%rsi
   43342:	72 1d                	jb     43361 <memmove+0x25>
        while (n-- > 0) {
   43344:	b9 00 00 00 00       	mov    $0x0,%ecx
   43349:	48 85 d2             	test   %rdx,%rdx
   4334c:	74 12                	je     43360 <memmove+0x24>
            *d++ = *s++;
   4334e:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   43352:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43356:	48 83 c1 01          	add    $0x1,%rcx
   4335a:	48 39 ca             	cmp    %rcx,%rdx
   4335d:	75 ef                	jne    4334e <memmove+0x12>
}
   4335f:	c3                   	retq   
   43360:	c3                   	retq   
    if (s < d && s + n > d) {
   43361:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   43365:	48 39 cf             	cmp    %rcx,%rdi
   43368:	73 da                	jae    43344 <memmove+0x8>
        while (n-- > 0) {
   4336a:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   4336e:	48 85 d2             	test   %rdx,%rdx
   43371:	74 ec                	je     4335f <memmove+0x23>
            *--d = *--s;
   43373:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   43377:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   4337a:	48 83 e9 01          	sub    $0x1,%rcx
   4337e:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43382:	75 ef                	jne    43373 <memmove+0x37>
   43384:	c3                   	retq   

0000000000043385 <memset>:
void* memset(void* v, int c, size_t n) {
   43385:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43388:	48 85 d2             	test   %rdx,%rdx
   4338b:	74 12                	je     4339f <memset+0x1a>
   4338d:	48 01 fa             	add    %rdi,%rdx
   43390:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   43393:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43396:	48 83 c1 01          	add    $0x1,%rcx
   4339a:	48 39 ca             	cmp    %rcx,%rdx
   4339d:	75 f4                	jne    43393 <memset+0xe>
}
   4339f:	c3                   	retq   

00000000000433a0 <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   433a0:	80 3f 00             	cmpb   $0x0,(%rdi)
   433a3:	74 10                	je     433b5 <strlen+0x15>
   433a5:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   433aa:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   433ae:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   433b2:	75 f6                	jne    433aa <strlen+0xa>
   433b4:	c3                   	retq   
   433b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
   433ba:	c3                   	retq   

00000000000433bb <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   433bb:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   433be:	ba 00 00 00 00       	mov    $0x0,%edx
   433c3:	48 85 f6             	test   %rsi,%rsi
   433c6:	74 11                	je     433d9 <strnlen+0x1e>
   433c8:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   433cc:	74 0c                	je     433da <strnlen+0x1f>
        ++n;
   433ce:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   433d2:	48 39 d0             	cmp    %rdx,%rax
   433d5:	75 f1                	jne    433c8 <strnlen+0xd>
   433d7:	eb 04                	jmp    433dd <strnlen+0x22>
   433d9:	c3                   	retq   
   433da:	48 89 d0             	mov    %rdx,%rax
}
   433dd:	c3                   	retq   

00000000000433de <strcpy>:
char* strcpy(char* dst, const char* src) {
   433de:	48 89 f8             	mov    %rdi,%rax
   433e1:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   433e6:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   433ea:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   433ed:	48 83 c2 01          	add    $0x1,%rdx
   433f1:	84 c9                	test   %cl,%cl
   433f3:	75 f1                	jne    433e6 <strcpy+0x8>
}
   433f5:	c3                   	retq   

00000000000433f6 <strcmp>:
    while (*a && *b && *a == *b) {
   433f6:	0f b6 07             	movzbl (%rdi),%eax
   433f9:	84 c0                	test   %al,%al
   433fb:	74 1a                	je     43417 <strcmp+0x21>
   433fd:	0f b6 16             	movzbl (%rsi),%edx
   43400:	38 c2                	cmp    %al,%dl
   43402:	75 13                	jne    43417 <strcmp+0x21>
   43404:	84 d2                	test   %dl,%dl
   43406:	74 0f                	je     43417 <strcmp+0x21>
        ++a, ++b;
   43408:	48 83 c7 01          	add    $0x1,%rdi
   4340c:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   43410:	0f b6 07             	movzbl (%rdi),%eax
   43413:	84 c0                	test   %al,%al
   43415:	75 e6                	jne    433fd <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   43417:	3a 06                	cmp    (%rsi),%al
   43419:	0f 97 c0             	seta   %al
   4341c:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   4341f:	83 d8 00             	sbb    $0x0,%eax
}
   43422:	c3                   	retq   

0000000000043423 <strchr>:
    while (*s && *s != (char) c) {
   43423:	0f b6 07             	movzbl (%rdi),%eax
   43426:	84 c0                	test   %al,%al
   43428:	74 10                	je     4343a <strchr+0x17>
   4342a:	40 38 f0             	cmp    %sil,%al
   4342d:	74 18                	je     43447 <strchr+0x24>
        ++s;
   4342f:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   43433:	0f b6 07             	movzbl (%rdi),%eax
   43436:	84 c0                	test   %al,%al
   43438:	75 f0                	jne    4342a <strchr+0x7>
        return NULL;
   4343a:	40 84 f6             	test   %sil,%sil
   4343d:	b8 00 00 00 00       	mov    $0x0,%eax
   43442:	48 0f 44 c7          	cmove  %rdi,%rax
}
   43446:	c3                   	retq   
   43447:	48 89 f8             	mov    %rdi,%rax
   4344a:	c3                   	retq   

000000000004344b <rand>:
    if (!rand_seed_set) {
   4344b:	83 3d b2 3b 01 00 00 	cmpl   $0x0,0x13bb2(%rip)        # 57004 <rand_seed_set>
   43452:	74 1b                	je     4346f <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43454:	69 05 a2 3b 01 00 0d 	imul   $0x19660d,0x13ba2(%rip),%eax        # 57000 <rand_seed>
   4345b:	66 19 00 
   4345e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43463:	89 05 97 3b 01 00    	mov    %eax,0x13b97(%rip)        # 57000 <rand_seed>
    return rand_seed & RAND_MAX;
   43469:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   4346e:	c3                   	retq   
    rand_seed = seed;
   4346f:	c7 05 87 3b 01 00 9e 	movl   $0x30d4879e,0x13b87(%rip)        # 57000 <rand_seed>
   43476:	87 d4 30 
    rand_seed_set = 1;
   43479:	c7 05 81 3b 01 00 01 	movl   $0x1,0x13b81(%rip)        # 57004 <rand_seed_set>
   43480:	00 00 00 
}
   43483:	eb cf                	jmp    43454 <rand+0x9>

0000000000043485 <srand>:
    rand_seed = seed;
   43485:	89 3d 75 3b 01 00    	mov    %edi,0x13b75(%rip)        # 57000 <rand_seed>
    rand_seed_set = 1;
   4348b:	c7 05 6f 3b 01 00 01 	movl   $0x1,0x13b6f(%rip)        # 57004 <rand_seed_set>
   43492:	00 00 00 
}
   43495:	c3                   	retq   

0000000000043496 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43496:	55                   	push   %rbp
   43497:	48 89 e5             	mov    %rsp,%rbp
   4349a:	41 57                	push   %r15
   4349c:	41 56                	push   %r14
   4349e:	41 55                	push   %r13
   434a0:	41 54                	push   %r12
   434a2:	53                   	push   %rbx
   434a3:	48 83 ec 58          	sub    $0x58,%rsp
   434a7:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   434ab:	0f b6 02             	movzbl (%rdx),%eax
   434ae:	84 c0                	test   %al,%al
   434b0:	0f 84 b0 06 00 00    	je     43b66 <printer_vprintf+0x6d0>
   434b6:	49 89 fe             	mov    %rdi,%r14
   434b9:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   434bc:	41 89 f7             	mov    %esi,%r15d
   434bf:	e9 a4 04 00 00       	jmpq   43968 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   434c4:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   434c9:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   434cf:	45 84 e4             	test   %r12b,%r12b
   434d2:	0f 84 82 06 00 00    	je     43b5a <printer_vprintf+0x6c4>
        int flags = 0;
   434d8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   434de:	41 0f be f4          	movsbl %r12b,%esi
   434e2:	bf 61 49 04 00       	mov    $0x44961,%edi
   434e7:	e8 37 ff ff ff       	callq  43423 <strchr>
   434ec:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   434ef:	48 85 c0             	test   %rax,%rax
   434f2:	74 55                	je     43549 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   434f4:	48 81 e9 61 49 04 00 	sub    $0x44961,%rcx
   434fb:	b8 01 00 00 00       	mov    $0x1,%eax
   43500:	d3 e0                	shl    %cl,%eax
   43502:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43505:	48 83 c3 01          	add    $0x1,%rbx
   43509:	44 0f b6 23          	movzbl (%rbx),%r12d
   4350d:	45 84 e4             	test   %r12b,%r12b
   43510:	75 cc                	jne    434de <printer_vprintf+0x48>
   43512:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   43516:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   4351c:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   43523:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   43526:	0f 84 a9 00 00 00    	je     435d5 <printer_vprintf+0x13f>
        int length = 0;
   4352c:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   43531:	0f b6 13             	movzbl (%rbx),%edx
   43534:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43537:	3c 37                	cmp    $0x37,%al
   43539:	0f 87 c4 04 00 00    	ja     43a03 <printer_vprintf+0x56d>
   4353f:	0f b6 c0             	movzbl %al,%eax
   43542:	ff 24 c5 70 47 04 00 	jmpq   *0x44770(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   43549:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   4354d:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   43552:	3c 08                	cmp    $0x8,%al
   43554:	77 2f                	ja     43585 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43556:	0f b6 03             	movzbl (%rbx),%eax
   43559:	8d 50 d0             	lea    -0x30(%rax),%edx
   4355c:	80 fa 09             	cmp    $0x9,%dl
   4355f:	77 5e                	ja     435bf <printer_vprintf+0x129>
   43561:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43567:	48 83 c3 01          	add    $0x1,%rbx
   4356b:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   43570:	0f be c0             	movsbl %al,%eax
   43573:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43578:	0f b6 03             	movzbl (%rbx),%eax
   4357b:	8d 50 d0             	lea    -0x30(%rax),%edx
   4357e:	80 fa 09             	cmp    $0x9,%dl
   43581:	76 e4                	jbe    43567 <printer_vprintf+0xd1>
   43583:	eb 97                	jmp    4351c <printer_vprintf+0x86>
        } else if (*format == '*') {
   43585:	41 80 fc 2a          	cmp    $0x2a,%r12b
   43589:	75 3f                	jne    435ca <printer_vprintf+0x134>
            width = va_arg(val, int);
   4358b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4358f:	8b 07                	mov    (%rdi),%eax
   43591:	83 f8 2f             	cmp    $0x2f,%eax
   43594:	77 17                	ja     435ad <printer_vprintf+0x117>
   43596:	89 c2                	mov    %eax,%edx
   43598:	48 03 57 10          	add    0x10(%rdi),%rdx
   4359c:	83 c0 08             	add    $0x8,%eax
   4359f:	89 07                	mov    %eax,(%rdi)
   435a1:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   435a4:	48 83 c3 01          	add    $0x1,%rbx
   435a8:	e9 6f ff ff ff       	jmpq   4351c <printer_vprintf+0x86>
            width = va_arg(val, int);
   435ad:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   435b1:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   435b5:	48 8d 42 08          	lea    0x8(%rdx),%rax
   435b9:	48 89 41 08          	mov    %rax,0x8(%rcx)
   435bd:	eb e2                	jmp    435a1 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   435bf:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   435c5:	e9 52 ff ff ff       	jmpq   4351c <printer_vprintf+0x86>
        int width = -1;
   435ca:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   435d0:	e9 47 ff ff ff       	jmpq   4351c <printer_vprintf+0x86>
            ++format;
   435d5:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   435d9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   435dd:	8d 48 d0             	lea    -0x30(%rax),%ecx
   435e0:	80 f9 09             	cmp    $0x9,%cl
   435e3:	76 13                	jbe    435f8 <printer_vprintf+0x162>
            } else if (*format == '*') {
   435e5:	3c 2a                	cmp    $0x2a,%al
   435e7:	74 33                	je     4361c <printer_vprintf+0x186>
            ++format;
   435e9:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   435ec:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   435f3:	e9 34 ff ff ff       	jmpq   4352c <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   435f8:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   435fd:	48 83 c2 01          	add    $0x1,%rdx
   43601:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43604:	0f be c0             	movsbl %al,%eax
   43607:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   4360b:	0f b6 02             	movzbl (%rdx),%eax
   4360e:	8d 70 d0             	lea    -0x30(%rax),%esi
   43611:	40 80 fe 09          	cmp    $0x9,%sil
   43615:	76 e6                	jbe    435fd <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   43617:	48 89 d3             	mov    %rdx,%rbx
   4361a:	eb 1c                	jmp    43638 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   4361c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43620:	8b 07                	mov    (%rdi),%eax
   43622:	83 f8 2f             	cmp    $0x2f,%eax
   43625:	77 23                	ja     4364a <printer_vprintf+0x1b4>
   43627:	89 c2                	mov    %eax,%edx
   43629:	48 03 57 10          	add    0x10(%rdi),%rdx
   4362d:	83 c0 08             	add    $0x8,%eax
   43630:	89 07                	mov    %eax,(%rdi)
   43632:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43634:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   43638:	85 c9                	test   %ecx,%ecx
   4363a:	b8 00 00 00 00       	mov    $0x0,%eax
   4363f:	0f 49 c1             	cmovns %ecx,%eax
   43642:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43645:	e9 e2 fe ff ff       	jmpq   4352c <printer_vprintf+0x96>
                precision = va_arg(val, int);
   4364a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4364e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43652:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43656:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4365a:	eb d6                	jmp    43632 <printer_vprintf+0x19c>
        switch (*format) {
   4365c:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43661:	e9 f3 00 00 00       	jmpq   43759 <printer_vprintf+0x2c3>
            ++format;
   43666:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   4366a:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   4366f:	e9 bd fe ff ff       	jmpq   43531 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43674:	85 c9                	test   %ecx,%ecx
   43676:	74 55                	je     436cd <printer_vprintf+0x237>
   43678:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4367c:	8b 07                	mov    (%rdi),%eax
   4367e:	83 f8 2f             	cmp    $0x2f,%eax
   43681:	77 38                	ja     436bb <printer_vprintf+0x225>
   43683:	89 c2                	mov    %eax,%edx
   43685:	48 03 57 10          	add    0x10(%rdi),%rdx
   43689:	83 c0 08             	add    $0x8,%eax
   4368c:	89 07                	mov    %eax,(%rdi)
   4368e:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43691:	48 89 d0             	mov    %rdx,%rax
   43694:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43698:	49 89 d0             	mov    %rdx,%r8
   4369b:	49 f7 d8             	neg    %r8
   4369e:	25 80 00 00 00       	and    $0x80,%eax
   436a3:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   436a7:	0b 45 a8             	or     -0x58(%rbp),%eax
   436aa:	83 c8 60             	or     $0x60,%eax
   436ad:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   436b0:	41 bc 67 47 04 00    	mov    $0x44767,%r12d
            break;
   436b6:	e9 35 01 00 00       	jmpq   437f0 <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   436bb:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   436bf:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   436c3:	48 8d 42 08          	lea    0x8(%rdx),%rax
   436c7:	48 89 41 08          	mov    %rax,0x8(%rcx)
   436cb:	eb c1                	jmp    4368e <printer_vprintf+0x1f8>
   436cd:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   436d1:	8b 07                	mov    (%rdi),%eax
   436d3:	83 f8 2f             	cmp    $0x2f,%eax
   436d6:	77 10                	ja     436e8 <printer_vprintf+0x252>
   436d8:	89 c2                	mov    %eax,%edx
   436da:	48 03 57 10          	add    0x10(%rdi),%rdx
   436de:	83 c0 08             	add    $0x8,%eax
   436e1:	89 07                	mov    %eax,(%rdi)
   436e3:	48 63 12             	movslq (%rdx),%rdx
   436e6:	eb a9                	jmp    43691 <printer_vprintf+0x1fb>
   436e8:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   436ec:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   436f0:	48 8d 42 08          	lea    0x8(%rdx),%rax
   436f4:	48 89 47 08          	mov    %rax,0x8(%rdi)
   436f8:	eb e9                	jmp    436e3 <printer_vprintf+0x24d>
        int base = 10;
   436fa:	be 0a 00 00 00       	mov    $0xa,%esi
   436ff:	eb 58                	jmp    43759 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43701:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43705:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43709:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4370d:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43711:	eb 60                	jmp    43773 <printer_vprintf+0x2dd>
   43713:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43717:	8b 07                	mov    (%rdi),%eax
   43719:	83 f8 2f             	cmp    $0x2f,%eax
   4371c:	77 10                	ja     4372e <printer_vprintf+0x298>
   4371e:	89 c2                	mov    %eax,%edx
   43720:	48 03 57 10          	add    0x10(%rdi),%rdx
   43724:	83 c0 08             	add    $0x8,%eax
   43727:	89 07                	mov    %eax,(%rdi)
   43729:	44 8b 02             	mov    (%rdx),%r8d
   4372c:	eb 48                	jmp    43776 <printer_vprintf+0x2e0>
   4372e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43732:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43736:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4373a:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4373e:	eb e9                	jmp    43729 <printer_vprintf+0x293>
   43740:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43743:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   4374a:	bf 50 49 04 00       	mov    $0x44950,%edi
   4374f:	e9 e2 02 00 00       	jmpq   43a36 <printer_vprintf+0x5a0>
            base = 16;
   43754:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43759:	85 c9                	test   %ecx,%ecx
   4375b:	74 b6                	je     43713 <printer_vprintf+0x27d>
   4375d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43761:	8b 01                	mov    (%rcx),%eax
   43763:	83 f8 2f             	cmp    $0x2f,%eax
   43766:	77 99                	ja     43701 <printer_vprintf+0x26b>
   43768:	89 c2                	mov    %eax,%edx
   4376a:	48 03 51 10          	add    0x10(%rcx),%rdx
   4376e:	83 c0 08             	add    $0x8,%eax
   43771:	89 01                	mov    %eax,(%rcx)
   43773:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43776:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   4377a:	85 f6                	test   %esi,%esi
   4377c:	79 c2                	jns    43740 <printer_vprintf+0x2aa>
        base = -base;
   4377e:	41 89 f1             	mov    %esi,%r9d
   43781:	f7 de                	neg    %esi
   43783:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   4378a:	bf 30 49 04 00       	mov    $0x44930,%edi
   4378f:	e9 a2 02 00 00       	jmpq   43a36 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   43794:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43798:	8b 07                	mov    (%rdi),%eax
   4379a:	83 f8 2f             	cmp    $0x2f,%eax
   4379d:	77 1c                	ja     437bb <printer_vprintf+0x325>
   4379f:	89 c2                	mov    %eax,%edx
   437a1:	48 03 57 10          	add    0x10(%rdi),%rdx
   437a5:	83 c0 08             	add    $0x8,%eax
   437a8:	89 07                	mov    %eax,(%rdi)
   437aa:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   437ad:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   437b4:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   437b9:	eb c3                	jmp    4377e <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   437bb:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   437bf:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   437c3:	48 8d 42 08          	lea    0x8(%rdx),%rax
   437c7:	48 89 41 08          	mov    %rax,0x8(%rcx)
   437cb:	eb dd                	jmp    437aa <printer_vprintf+0x314>
            data = va_arg(val, char*);
   437cd:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   437d1:	8b 01                	mov    (%rcx),%eax
   437d3:	83 f8 2f             	cmp    $0x2f,%eax
   437d6:	0f 87 a5 01 00 00    	ja     43981 <printer_vprintf+0x4eb>
   437dc:	89 c2                	mov    %eax,%edx
   437de:	48 03 51 10          	add    0x10(%rcx),%rdx
   437e2:	83 c0 08             	add    $0x8,%eax
   437e5:	89 01                	mov    %eax,(%rcx)
   437e7:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   437ea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   437f0:	8b 45 a8             	mov    -0x58(%rbp),%eax
   437f3:	83 e0 20             	and    $0x20,%eax
   437f6:	89 45 8c             	mov    %eax,-0x74(%rbp)
   437f9:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   437ff:	0f 85 21 02 00 00    	jne    43a26 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43805:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43808:	89 45 88             	mov    %eax,-0x78(%rbp)
   4380b:	83 e0 60             	and    $0x60,%eax
   4380e:	83 f8 60             	cmp    $0x60,%eax
   43811:	0f 84 54 02 00 00    	je     43a6b <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43817:	8b 45 a8             	mov    -0x58(%rbp),%eax
   4381a:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   4381d:	48 c7 45 a0 67 47 04 	movq   $0x44767,-0x60(%rbp)
   43824:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43825:	83 f8 21             	cmp    $0x21,%eax
   43828:	0f 84 79 02 00 00    	je     43aa7 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   4382e:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   43831:	89 f8                	mov    %edi,%eax
   43833:	f7 d0                	not    %eax
   43835:	c1 e8 1f             	shr    $0x1f,%eax
   43838:	89 45 84             	mov    %eax,-0x7c(%rbp)
   4383b:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   4383f:	0f 85 9e 02 00 00    	jne    43ae3 <printer_vprintf+0x64d>
   43845:	84 c0                	test   %al,%al
   43847:	0f 84 96 02 00 00    	je     43ae3 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   4384d:	48 63 f7             	movslq %edi,%rsi
   43850:	4c 89 e7             	mov    %r12,%rdi
   43853:	e8 63 fb ff ff       	callq  433bb <strnlen>
   43858:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   4385b:	8b 45 88             	mov    -0x78(%rbp),%eax
   4385e:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   43861:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   43868:	83 f8 22             	cmp    $0x22,%eax
   4386b:	0f 84 aa 02 00 00    	je     43b1b <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   43871:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43875:	e8 26 fb ff ff       	callq  433a0 <strlen>
   4387a:	8b 55 9c             	mov    -0x64(%rbp),%edx
   4387d:	03 55 98             	add    -0x68(%rbp),%edx
   43880:	44 89 e9             	mov    %r13d,%ecx
   43883:	29 d1                	sub    %edx,%ecx
   43885:	29 c1                	sub    %eax,%ecx
   43887:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   4388a:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   4388d:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   43891:	75 2d                	jne    438c0 <printer_vprintf+0x42a>
   43893:	85 c9                	test   %ecx,%ecx
   43895:	7e 29                	jle    438c0 <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   43897:	44 89 fa             	mov    %r15d,%edx
   4389a:	be 20 00 00 00       	mov    $0x20,%esi
   4389f:	4c 89 f7             	mov    %r14,%rdi
   438a2:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   438a5:	41 83 ed 01          	sub    $0x1,%r13d
   438a9:	45 85 ed             	test   %r13d,%r13d
   438ac:	7f e9                	jg     43897 <printer_vprintf+0x401>
   438ae:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   438b1:	85 ff                	test   %edi,%edi
   438b3:	b8 01 00 00 00       	mov    $0x1,%eax
   438b8:	0f 4f c7             	cmovg  %edi,%eax
   438bb:	29 c7                	sub    %eax,%edi
   438bd:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   438c0:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   438c4:	0f b6 07             	movzbl (%rdi),%eax
   438c7:	84 c0                	test   %al,%al
   438c9:	74 22                	je     438ed <printer_vprintf+0x457>
   438cb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   438cf:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   438d2:	0f b6 f0             	movzbl %al,%esi
   438d5:	44 89 fa             	mov    %r15d,%edx
   438d8:	4c 89 f7             	mov    %r14,%rdi
   438db:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   438de:	48 83 c3 01          	add    $0x1,%rbx
   438e2:	0f b6 03             	movzbl (%rbx),%eax
   438e5:	84 c0                	test   %al,%al
   438e7:	75 e9                	jne    438d2 <printer_vprintf+0x43c>
   438e9:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   438ed:	8b 45 9c             	mov    -0x64(%rbp),%eax
   438f0:	85 c0                	test   %eax,%eax
   438f2:	7e 1d                	jle    43911 <printer_vprintf+0x47b>
   438f4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   438f8:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   438fa:	44 89 fa             	mov    %r15d,%edx
   438fd:	be 30 00 00 00       	mov    $0x30,%esi
   43902:	4c 89 f7             	mov    %r14,%rdi
   43905:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   43908:	83 eb 01             	sub    $0x1,%ebx
   4390b:	75 ed                	jne    438fa <printer_vprintf+0x464>
   4390d:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   43911:	8b 45 98             	mov    -0x68(%rbp),%eax
   43914:	85 c0                	test   %eax,%eax
   43916:	7e 27                	jle    4393f <printer_vprintf+0x4a9>
   43918:	89 c0                	mov    %eax,%eax
   4391a:	4c 01 e0             	add    %r12,%rax
   4391d:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   43921:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   43924:	41 0f b6 34 24       	movzbl (%r12),%esi
   43929:	44 89 fa             	mov    %r15d,%edx
   4392c:	4c 89 f7             	mov    %r14,%rdi
   4392f:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   43932:	49 83 c4 01          	add    $0x1,%r12
   43936:	49 39 dc             	cmp    %rbx,%r12
   43939:	75 e9                	jne    43924 <printer_vprintf+0x48e>
   4393b:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   4393f:	45 85 ed             	test   %r13d,%r13d
   43942:	7e 14                	jle    43958 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   43944:	44 89 fa             	mov    %r15d,%edx
   43947:	be 20 00 00 00       	mov    $0x20,%esi
   4394c:	4c 89 f7             	mov    %r14,%rdi
   4394f:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   43952:	41 83 ed 01          	sub    $0x1,%r13d
   43956:	75 ec                	jne    43944 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   43958:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   4395c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   43960:	84 c0                	test   %al,%al
   43962:	0f 84 fe 01 00 00    	je     43b66 <printer_vprintf+0x6d0>
        if (*format != '%') {
   43968:	3c 25                	cmp    $0x25,%al
   4396a:	0f 84 54 fb ff ff    	je     434c4 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   43970:	0f b6 f0             	movzbl %al,%esi
   43973:	44 89 fa             	mov    %r15d,%edx
   43976:	4c 89 f7             	mov    %r14,%rdi
   43979:	41 ff 16             	callq  *(%r14)
            continue;
   4397c:	4c 89 e3             	mov    %r12,%rbx
   4397f:	eb d7                	jmp    43958 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   43981:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43985:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43989:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4398d:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43991:	e9 51 fe ff ff       	jmpq   437e7 <printer_vprintf+0x351>
            color = va_arg(val, int);
   43996:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4399a:	8b 07                	mov    (%rdi),%eax
   4399c:	83 f8 2f             	cmp    $0x2f,%eax
   4399f:	77 10                	ja     439b1 <printer_vprintf+0x51b>
   439a1:	89 c2                	mov    %eax,%edx
   439a3:	48 03 57 10          	add    0x10(%rdi),%rdx
   439a7:	83 c0 08             	add    $0x8,%eax
   439aa:	89 07                	mov    %eax,(%rdi)
   439ac:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   439af:	eb a7                	jmp    43958 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   439b1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   439b5:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   439b9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   439bd:	48 89 41 08          	mov    %rax,0x8(%rcx)
   439c1:	eb e9                	jmp    439ac <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   439c3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   439c7:	8b 01                	mov    (%rcx),%eax
   439c9:	83 f8 2f             	cmp    $0x2f,%eax
   439cc:	77 23                	ja     439f1 <printer_vprintf+0x55b>
   439ce:	89 c2                	mov    %eax,%edx
   439d0:	48 03 51 10          	add    0x10(%rcx),%rdx
   439d4:	83 c0 08             	add    $0x8,%eax
   439d7:	89 01                	mov    %eax,(%rcx)
   439d9:	8b 02                	mov    (%rdx),%eax
   439db:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   439de:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   439e2:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   439e6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   439ec:	e9 ff fd ff ff       	jmpq   437f0 <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   439f1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   439f5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   439f9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   439fd:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43a01:	eb d6                	jmp    439d9 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   43a03:	84 d2                	test   %dl,%dl
   43a05:	0f 85 39 01 00 00    	jne    43b44 <printer_vprintf+0x6ae>
   43a0b:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   43a0f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   43a13:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   43a17:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43a1b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43a21:	e9 ca fd ff ff       	jmpq   437f0 <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   43a26:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   43a2c:	bf 50 49 04 00       	mov    $0x44950,%edi
        if (flags & FLAG_NUMERIC) {
   43a31:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   43a36:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   43a3a:	4c 89 c1             	mov    %r8,%rcx
   43a3d:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   43a41:	48 63 f6             	movslq %esi,%rsi
   43a44:	49 83 ec 01          	sub    $0x1,%r12
   43a48:	48 89 c8             	mov    %rcx,%rax
   43a4b:	ba 00 00 00 00       	mov    $0x0,%edx
   43a50:	48 f7 f6             	div    %rsi
   43a53:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   43a57:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   43a5b:	48 89 ca             	mov    %rcx,%rdx
   43a5e:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   43a61:	48 39 d6             	cmp    %rdx,%rsi
   43a64:	76 de                	jbe    43a44 <printer_vprintf+0x5ae>
   43a66:	e9 9a fd ff ff       	jmpq   43805 <printer_vprintf+0x36f>
                prefix = "-";
   43a6b:	48 c7 45 a0 64 47 04 	movq   $0x44764,-0x60(%rbp)
   43a72:	00 
            if (flags & FLAG_NEGATIVE) {
   43a73:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43a76:	a8 80                	test   $0x80,%al
   43a78:	0f 85 b0 fd ff ff    	jne    4382e <printer_vprintf+0x398>
                prefix = "+";
   43a7e:	48 c7 45 a0 5f 47 04 	movq   $0x4475f,-0x60(%rbp)
   43a85:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   43a86:	a8 10                	test   $0x10,%al
   43a88:	0f 85 a0 fd ff ff    	jne    4382e <printer_vprintf+0x398>
                prefix = " ";
   43a8e:	a8 08                	test   $0x8,%al
   43a90:	ba 67 47 04 00       	mov    $0x44767,%edx
   43a95:	b8 66 47 04 00       	mov    $0x44766,%eax
   43a9a:	48 0f 44 c2          	cmove  %rdx,%rax
   43a9e:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   43aa2:	e9 87 fd ff ff       	jmpq   4382e <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   43aa7:	41 8d 41 10          	lea    0x10(%r9),%eax
   43aab:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   43ab0:	0f 85 78 fd ff ff    	jne    4382e <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   43ab6:	4d 85 c0             	test   %r8,%r8
   43ab9:	75 0d                	jne    43ac8 <printer_vprintf+0x632>
   43abb:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   43ac2:	0f 84 66 fd ff ff    	je     4382e <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   43ac8:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   43acc:	ba 68 47 04 00       	mov    $0x44768,%edx
   43ad1:	b8 61 47 04 00       	mov    $0x44761,%eax
   43ad6:	48 0f 44 c2          	cmove  %rdx,%rax
   43ada:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   43ade:	e9 4b fd ff ff       	jmpq   4382e <printer_vprintf+0x398>
            len = strlen(data);
   43ae3:	4c 89 e7             	mov    %r12,%rdi
   43ae6:	e8 b5 f8 ff ff       	callq  433a0 <strlen>
   43aeb:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   43aee:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   43af2:	0f 84 63 fd ff ff    	je     4385b <printer_vprintf+0x3c5>
   43af8:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   43afc:	0f 84 59 fd ff ff    	je     4385b <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   43b02:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   43b05:	89 ca                	mov    %ecx,%edx
   43b07:	29 c2                	sub    %eax,%edx
   43b09:	39 c1                	cmp    %eax,%ecx
   43b0b:	b8 00 00 00 00       	mov    $0x0,%eax
   43b10:	0f 4e d0             	cmovle %eax,%edx
   43b13:	89 55 9c             	mov    %edx,-0x64(%rbp)
   43b16:	e9 56 fd ff ff       	jmpq   43871 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   43b1b:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43b1f:	e8 7c f8 ff ff       	callq  433a0 <strlen>
   43b24:	8b 7d 98             	mov    -0x68(%rbp),%edi
   43b27:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   43b2a:	44 89 e9             	mov    %r13d,%ecx
   43b2d:	29 f9                	sub    %edi,%ecx
   43b2f:	29 c1                	sub    %eax,%ecx
   43b31:	44 39 ea             	cmp    %r13d,%edx
   43b34:	b8 00 00 00 00       	mov    $0x0,%eax
   43b39:	0f 4d c8             	cmovge %eax,%ecx
   43b3c:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   43b3f:	e9 2d fd ff ff       	jmpq   43871 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   43b44:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   43b47:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43b4b:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43b4f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43b55:	e9 96 fc ff ff       	jmpq   437f0 <printer_vprintf+0x35a>
        int flags = 0;
   43b5a:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   43b61:	e9 b0 f9 ff ff       	jmpq   43516 <printer_vprintf+0x80>
}
   43b66:	48 83 c4 58          	add    $0x58,%rsp
   43b6a:	5b                   	pop    %rbx
   43b6b:	41 5c                	pop    %r12
   43b6d:	41 5d                	pop    %r13
   43b6f:	41 5e                	pop    %r14
   43b71:	41 5f                	pop    %r15
   43b73:	5d                   	pop    %rbp
   43b74:	c3                   	retq   

0000000000043b75 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   43b75:	55                   	push   %rbp
   43b76:	48 89 e5             	mov    %rsp,%rbp
   43b79:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   43b7d:	48 c7 45 f0 80 32 04 	movq   $0x43280,-0x10(%rbp)
   43b84:	00 
        cpos = 0;
   43b85:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   43b8b:	b8 00 00 00 00       	mov    $0x0,%eax
   43b90:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   43b93:	48 63 ff             	movslq %edi,%rdi
   43b96:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   43b9d:	00 
   43b9e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   43ba2:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43ba6:	e8 eb f8 ff ff       	callq  43496 <printer_vprintf>
    return cp.cursor - console;
   43bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43baf:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   43bb5:	48 d1 f8             	sar    %rax
}
   43bb8:	c9                   	leaveq 
   43bb9:	c3                   	retq   

0000000000043bba <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   43bba:	55                   	push   %rbp
   43bbb:	48 89 e5             	mov    %rsp,%rbp
   43bbe:	48 83 ec 50          	sub    $0x50,%rsp
   43bc2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43bc6:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43bca:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   43bce:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43bd5:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43bd9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43bdd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43be1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   43be5:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43be9:	e8 87 ff ff ff       	callq  43b75 <console_vprintf>
}
   43bee:	c9                   	leaveq 
   43bef:	c3                   	retq   

0000000000043bf0 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   43bf0:	55                   	push   %rbp
   43bf1:	48 89 e5             	mov    %rsp,%rbp
   43bf4:	53                   	push   %rbx
   43bf5:	48 83 ec 28          	sub    $0x28,%rsp
   43bf9:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   43bfc:	48 c7 45 d8 06 33 04 	movq   $0x43306,-0x28(%rbp)
   43c03:	00 
    sp.s = s;
   43c04:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   43c08:	48 85 f6             	test   %rsi,%rsi
   43c0b:	75 0b                	jne    43c18 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   43c0d:	8b 45 e0             	mov    -0x20(%rbp),%eax
   43c10:	29 d8                	sub    %ebx,%eax
}
   43c12:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43c16:	c9                   	leaveq 
   43c17:	c3                   	retq   
        sp.end = s + size - 1;
   43c18:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   43c1d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   43c21:	be 00 00 00 00       	mov    $0x0,%esi
   43c26:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   43c2a:	e8 67 f8 ff ff       	callq  43496 <printer_vprintf>
        *sp.s = 0;
   43c2f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43c33:	c6 00 00             	movb   $0x0,(%rax)
   43c36:	eb d5                	jmp    43c0d <vsnprintf+0x1d>

0000000000043c38 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   43c38:	55                   	push   %rbp
   43c39:	48 89 e5             	mov    %rsp,%rbp
   43c3c:	48 83 ec 50          	sub    $0x50,%rsp
   43c40:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43c44:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43c48:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43c4c:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43c53:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43c57:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43c5b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43c5f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   43c63:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43c67:	e8 84 ff ff ff       	callq  43bf0 <vsnprintf>
    va_end(val);
    return n;
}
   43c6c:	c9                   	leaveq 
   43c6d:	c3                   	retq   

0000000000043c6e <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43c6e:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   43c73:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   43c78:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43c7d:	48 83 c0 02          	add    $0x2,%rax
   43c81:	48 39 d0             	cmp    %rdx,%rax
   43c84:	75 f2                	jne    43c78 <console_clear+0xa>
    }
    cursorpos = 0;
   43c86:	c7 05 6c 53 07 00 00 	movl   $0x0,0x7536c(%rip)        # b8ffc <cursorpos>
   43c8d:	00 00 00 
}
   43c90:	c3                   	retq   
