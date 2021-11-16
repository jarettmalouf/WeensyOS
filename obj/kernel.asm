
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
   400be:	e8 dd 09 00 00       	callq  40aa0 <exception>

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
   401a7:	e8 a4 16 00 00       	callq  41850 <hardware_init>
    pageinfo_init();
   401ac:	e8 4c 0d 00 00       	callq  40efd <pageinfo_init>
    console_clear();
   401b1:	e8 15 3a 00 00       	callq  43bcb <console_clear>
    timer_init(HZ);
   401b6:	bf 64 00 00 00       	mov    $0x64,%edi
   401bb:	e8 80 1b 00 00       	callq  41d40 <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   401c0:	48 8b 05 39 0e 01 00 	mov    0x10e39(%rip),%rax        # 51000 <kernel_pagetable>
   401c7:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   401cd:	b9 00 00 10 00       	mov    $0x100000,%ecx
   401d2:	ba 00 00 00 00       	mov    $0x0,%edx
   401d7:	be 00 00 00 00       	mov    $0x0,%esi
   401dc:	48 89 c7             	mov    %rax,%rdi
   401df:	e8 aa 28 00 00       	callq  42a8e <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   401e4:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   401e9:	be 00 80 0b 00       	mov    $0xb8000,%esi
   401ee:	48 8b 05 0b 0e 01 00 	mov    0x10e0b(%rip),%rax        # 51000 <kernel_pagetable>
   401f5:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   401fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40200:	48 89 c7             	mov    %rax,%rdi
   40203:	e8 86 28 00 00       	callq  42a8e <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40208:	ba 00 0e 00 00       	mov    $0xe00,%edx
   4020d:	be 00 00 00 00       	mov    $0x0,%esi
   40212:	bf 20 e0 04 00       	mov    $0x4e020,%edi
   40217:	e8 c6 30 00 00       	callq  432e2 <memset>
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
   4027a:	be 00 3c 04 00       	mov    $0x43c00,%esi
   4027f:	48 89 c7             	mov    %rax,%rdi
   40282:	e8 cc 30 00 00       	callq  43353 <strcmp>
   40287:	85 c0                	test   %eax,%eax
   40289:	75 14                	jne    4029f <kernel+0x104>
        process_setup(1, 4);
   4028b:	be 04 00 00 00       	mov    $0x4,%esi
   40290:	bf 01 00 00 00       	mov    $0x1,%edi
   40295:	e8 99 04 00 00       	callq  40733 <process_setup>
   4029a:	e9 c2 00 00 00       	jmpq   40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   4029f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402a4:	74 29                	je     402cf <kernel+0x134>
   402a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402aa:	be 05 3c 04 00       	mov    $0x43c05,%esi
   402af:	48 89 c7             	mov    %rax,%rdi
   402b2:	e8 9c 30 00 00       	callq  43353 <strcmp>
   402b7:	85 c0                	test   %eax,%eax
   402b9:	75 14                	jne    402cf <kernel+0x134>
        process_setup(1, 5);
   402bb:	be 05 00 00 00       	mov    $0x5,%esi
   402c0:	bf 01 00 00 00       	mov    $0x1,%edi
   402c5:	e8 69 04 00 00       	callq  40733 <process_setup>
   402ca:	e9 92 00 00 00       	jmpq   40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   402cf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402d4:	74 26                	je     402fc <kernel+0x161>
   402d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402da:	be 0e 3c 04 00       	mov    $0x43c0e,%esi
   402df:	48 89 c7             	mov    %rax,%rdi
   402e2:	e8 6c 30 00 00       	callq  43353 <strcmp>
   402e7:	85 c0                	test   %eax,%eax
   402e9:	75 11                	jne    402fc <kernel+0x161>
        process_setup(1, 6);
   402eb:	be 06 00 00 00       	mov    $0x6,%esi
   402f0:	bf 01 00 00 00       	mov    $0x1,%edi
   402f5:	e8 39 04 00 00       	callq  40733 <process_setup>
   402fa:	eb 65                	jmp    40361 <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   402fc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40301:	74 39                	je     4033c <kernel+0x1a1>
   40303:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40307:	be 13 3c 04 00       	mov    $0x43c13,%esi
   4030c:	48 89 c7             	mov    %rax,%rdi
   4030f:	e8 3f 30 00 00       	callq  43353 <strcmp>
   40314:	85 c0                	test   %eax,%eax
   40316:	75 24                	jne    4033c <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   40318:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   4031f:	eb 13                	jmp    40334 <kernel+0x199>
            process_setup(i, 6);
   40321:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40324:	be 06 00 00 00       	mov    $0x6,%esi
   40329:	89 c7                	mov    %eax,%edi
   4032b:	e8 03 04 00 00       	callq  40733 <process_setup>
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
   40352:	e8 dc 03 00 00       	callq  40733 <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   40357:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4035b:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   4035f:	7e e4                	jle    40345 <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   40361:	bf 00 e1 04 00       	mov    $0x4e100,%edi
   40366:	e8 35 0b 00 00       	callq  40ea0 <run>

000000000004036b <get_free_page_number>:
}

int get_free_page_number() {
   4036b:	55                   	push   %rbp
   4036c:	48 89 e5             	mov    %rsp,%rbp
   4036f:	48 83 ec 10          	sub    $0x10,%rsp
    int total_pages = PAGENUMBER(MEMSIZE_PHYSICAL);
   40373:	c7 45 f8 00 02 00 00 	movl   $0x200,-0x8(%rbp)
    for (int i = 0; i < total_pages; i++) {
   4037a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40381:	eb 1a                	jmp    4039d <get_free_page_number+0x32>
        if (pageinfo[i].owner == PO_FREE) return i;
   40383:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40386:	48 98                	cltq   
   40388:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4038f:	00 
   40390:	84 c0                	test   %al,%al
   40392:	75 05                	jne    40399 <get_free_page_number+0x2e>
   40394:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40397:	eb 11                	jmp    403aa <get_free_page_number+0x3f>
    for (int i = 0; i < total_pages; i++) {
   40399:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4039d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403a0:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   403a3:	7c de                	jl     40383 <get_free_page_number+0x18>
    }
    return -1;
   403a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   403aa:	c9                   	leaveq 
   403ab:	c3                   	retq   

00000000000403ac <alloc_pt>:

x86_64_pagetable *alloc_pt(pid_t pid) {
   403ac:	55                   	push   %rbp
   403ad:	48 89 e5             	mov    %rsp,%rbp
   403b0:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
   403b7:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
    size_t sz_pt = sizeof(struct x86_64_pagetable);
   403bd:	48 c7 45 f0 00 10 00 	movq   $0x1000,-0x10(%rbp)
   403c4:	00 
    int i = 5;
   403c5:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)

// L1
    int page_number = get_free_page_number();
   403cc:	b8 00 00 00 00       	mov    $0x0,%eax
   403d1:	e8 95 ff ff ff       	callq  4036b <get_free_page_number>
   403d6:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) return NULL;
   403d9:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   403dd:	75 0a                	jne    403e9 <alloc_pt+0x3d>
   403df:	b8 00 00 00 00       	mov    $0x0,%eax
   403e4:	e9 48 03 00 00       	jmpq   40731 <alloc_pt+0x385>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   403e9:	8b 45 e8             	mov    -0x18(%rbp),%eax
   403ec:	48 98                	cltq   
   403ee:	48 c1 e0 0c          	shl    $0xc,%rax
   403f2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   403f6:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   403fc:	0f be d0             	movsbl %al,%edx
   403ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40403:	89 d6                	mov    %edx,%esi
   40405:	48 89 c7             	mov    %rax,%rdi
   40408:	e8 ed 04 00 00       	callq  408fa <assign_physical_page>
   4040d:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   40410:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40414:	75 0a                	jne    40420 <alloc_pt+0x74>
   40416:	b8 00 00 00 00       	mov    $0x0,%eax
   4041b:	e9 11 03 00 00       	jmpq   40731 <alloc_pt+0x385>

    memset((void *) l1_addr, 0, sz_pt);
   40420:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40424:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40428:	be 00 00 00 00       	mov    $0x0,%esi
   4042d:	48 89 c7             	mov    %rax,%rdi
   40430:	e8 ad 2e 00 00       	callq  432e2 <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   40435:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40439:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    
// L2
    page_number = get_free_page_number();
   4043d:	b8 00 00 00 00       	mov    $0x0,%eax
   40442:	e8 24 ff ff ff       	callq  4036b <get_free_page_number>
   40447:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   4044a:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   4044e:	75 16                	jne    40466 <alloc_pt+0xba>
        free_pt(l1);
   40450:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40454:	48 89 c7             	mov    %rax,%rdi
   40457:	e8 0b fd ff ff       	callq  40167 <free_pt>
        return NULL;
   4045c:	b8 00 00 00 00       	mov    $0x0,%eax
   40461:	e9 cb 02 00 00       	jmpq   40731 <alloc_pt+0x385>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   40466:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40469:	48 98                	cltq   
   4046b:	48 c1 e0 0c          	shl    $0xc,%rax
   4046f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

    page_result = assign_physical_page(l2_addr, pid);
   40473:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40479:	0f be d0             	movsbl %al,%edx
   4047c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40480:	89 d6                	mov    %edx,%esi
   40482:	48 89 c7             	mov    %rax,%rdi
   40485:	e8 70 04 00 00       	callq  408fa <assign_physical_page>
   4048a:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   4048d:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40491:	75 0a                	jne    4049d <alloc_pt+0xf1>
   40493:	b8 00 00 00 00       	mov    $0x0,%eax
   40498:	e9 94 02 00 00       	jmpq   40731 <alloc_pt+0x385>

    memset((void *) l2_addr, 0, sz_pt);
   4049d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   404a1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   404a5:	be 00 00 00 00       	mov    $0x0,%esi
   404aa:	48 89 c7             	mov    %rax,%rdi
   404ad:	e8 30 2e 00 00       	callq  432e2 <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   404b2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   404b6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

// L3
    page_number = get_free_page_number();
   404ba:	b8 00 00 00 00       	mov    $0x0,%eax
   404bf:	e8 a7 fe ff ff       	callq  4036b <get_free_page_number>
   404c4:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   404c7:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   404cb:	75 22                	jne    404ef <alloc_pt+0x143>
        free_pt(l1); free_pt(l2);
   404cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   404d1:	48 89 c7             	mov    %rax,%rdi
   404d4:	e8 8e fc ff ff       	callq  40167 <free_pt>
   404d9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   404dd:	48 89 c7             	mov    %rax,%rdi
   404e0:	e8 82 fc ff ff       	callq  40167 <free_pt>
        return NULL;
   404e5:	b8 00 00 00 00       	mov    $0x0,%eax
   404ea:	e9 42 02 00 00       	jmpq   40731 <alloc_pt+0x385>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   404ef:	8b 45 e8             	mov    -0x18(%rbp),%eax
   404f2:	48 98                	cltq   
   404f4:	48 c1 e0 0c          	shl    $0xc,%rax
   404f8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

    page_result = assign_physical_page(l3_addr, pid);
   404fc:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40502:	0f be d0             	movsbl %al,%edx
   40505:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40509:	89 d6                	mov    %edx,%esi
   4050b:	48 89 c7             	mov    %rax,%rdi
   4050e:	e8 e7 03 00 00       	callq  408fa <assign_physical_page>
   40513:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   40516:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   4051a:	75 0a                	jne    40526 <alloc_pt+0x17a>
   4051c:	b8 00 00 00 00       	mov    $0x0,%eax
   40521:	e9 0b 02 00 00       	jmpq   40731 <alloc_pt+0x385>

    memset((void *) l3_addr, 0, sz_pt);
   40526:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4052a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4052e:	be 00 00 00 00       	mov    $0x0,%esi
   40533:	48 89 c7             	mov    %rax,%rdi
   40536:	e8 a7 2d 00 00       	callq  432e2 <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   4053b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4053f:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

// L4i
    page_number = get_free_page_number();
   40543:	b8 00 00 00 00       	mov    $0x0,%eax
   40548:	e8 1e fe ff ff       	callq  4036b <get_free_page_number>
   4054d:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   40550:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   40554:	75 2e                	jne    40584 <alloc_pt+0x1d8>
        free_pt(l1); free_pt(l2); free_pt(l3);
   40556:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4055a:	48 89 c7             	mov    %rax,%rdi
   4055d:	e8 05 fc ff ff       	callq  40167 <free_pt>
   40562:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40566:	48 89 c7             	mov    %rax,%rdi
   40569:	e8 f9 fb ff ff       	callq  40167 <free_pt>
   4056e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40572:	48 89 c7             	mov    %rax,%rdi
   40575:	e8 ed fb ff ff       	callq  40167 <free_pt>
        return NULL;
   4057a:	b8 00 00 00 00       	mov    $0x0,%eax
   4057f:	e9 ad 01 00 00       	jmpq   40731 <alloc_pt+0x385>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   40584:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40587:	48 98                	cltq   
   40589:	48 c1 e0 0c          	shl    $0xc,%rax
   4058d:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

    page_result = assign_physical_page(l4i_addr, pid);
   40591:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40597:	0f be d0             	movsbl %al,%edx
   4059a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4059e:	89 d6                	mov    %edx,%esi
   405a0:	48 89 c7             	mov    %rax,%rdi
   405a3:	e8 52 03 00 00       	callq  408fa <assign_physical_page>
   405a8:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   405ab:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   405af:	75 0a                	jne    405bb <alloc_pt+0x20f>
   405b1:	b8 00 00 00 00       	mov    $0x0,%eax
   405b6:	e9 76 01 00 00       	jmpq   40731 <alloc_pt+0x385>

    memset((void *) l4i_addr, 0, sz_pt);
   405bb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   405bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   405c3:	be 00 00 00 00       	mov    $0x0,%esi
   405c8:	48 89 c7             	mov    %rax,%rdi
   405cb:	e8 12 2d 00 00       	callq  432e2 <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   405d0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   405d4:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

// L4j
    page_number = get_free_page_number();
   405d8:	b8 00 00 00 00       	mov    $0x0,%eax
   405dd:	e8 89 fd ff ff       	callq  4036b <get_free_page_number>
   405e2:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   405e5:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   405e9:	75 3a                	jne    40625 <alloc_pt+0x279>
        free_pt(l1); free_pt(l2); free_pt(l3); free_pt(l4i);
   405eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405ef:	48 89 c7             	mov    %rax,%rdi
   405f2:	e8 70 fb ff ff       	callq  40167 <free_pt>
   405f7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   405fb:	48 89 c7             	mov    %rax,%rdi
   405fe:	e8 64 fb ff ff       	callq  40167 <free_pt>
   40603:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40607:	48 89 c7             	mov    %rax,%rdi
   4060a:	e8 58 fb ff ff       	callq  40167 <free_pt>
   4060f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40613:	48 89 c7             	mov    %rax,%rdi
   40616:	e8 4c fb ff ff       	callq  40167 <free_pt>
        return NULL;
   4061b:	b8 00 00 00 00       	mov    $0x0,%eax
   40620:	e9 0c 01 00 00       	jmpq   40731 <alloc_pt+0x385>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   40625:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40628:	48 98                	cltq   
   4062a:	48 c1 e0 0c          	shl    $0xc,%rax
   4062e:	48 89 45 98          	mov    %rax,-0x68(%rbp)

    page_result = assign_physical_page(l4j_addr, pid);
   40632:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40638:	0f be d0             	movsbl %al,%edx
   4063b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4063f:	89 d6                	mov    %edx,%esi
   40641:	48 89 c7             	mov    %rax,%rdi
   40644:	e8 b1 02 00 00       	callq  408fa <assign_physical_page>
   40649:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   4064c:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40650:	75 0a                	jne    4065c <alloc_pt+0x2b0>
   40652:	b8 00 00 00 00       	mov    $0x0,%eax
   40657:	e9 d5 00 00 00       	jmpq   40731 <alloc_pt+0x385>

    memset((void *) l4j_addr, 0, sz_pt);
   4065c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40660:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40664:	be 00 00 00 00       	mov    $0x0,%esi
   40669:	48 89 c7             	mov    %rax,%rdi
   4066c:	e8 71 2c 00 00       	callq  432e2 <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   40671:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40675:	48 89 45 90          	mov    %rax,-0x70(%rbp)

    // Linking

    int user_perms = PTE_U | PTE_P | PTE_W;
   40679:	c7 45 8c 07 00 00 00 	movl   $0x7,-0x74(%rbp)

    l1->entry[0] = (x86_64_pageentry_t) l2 | user_perms;
   40680:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40683:	48 63 d0             	movslq %eax,%rdx
   40686:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4068a:	48 09 c2             	or     %rax,%rdx
   4068d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40691:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = (x86_64_pageentry_t) l3 | user_perms;
   40694:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40697:	48 63 d0             	movslq %eax,%rdx
   4069a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4069e:	48 09 c2             	or     %rax,%rdx
   406a1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   406a5:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = (x86_64_pageentry_t) l4i | user_perms;
   406a8:	8b 45 8c             	mov    -0x74(%rbp),%eax
   406ab:	48 63 d0             	movslq %eax,%rdx
   406ae:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   406b2:	48 09 c2             	or     %rax,%rdx
   406b5:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406b9:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = (x86_64_pageentry_t) l4j | user_perms;
   406bc:	8b 45 8c             	mov    -0x74(%rbp),%eax
   406bf:	48 63 d0             	movslq %eax,%rdx
   406c2:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   406c6:	48 09 c2             	or     %rax,%rdx
   406c9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406cd:	48 89 50 08          	mov    %rdx,0x8(%rax)

    // Kernel copy over

    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   406d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   406d8:	eb 4a                	jmp    40724 <alloc_pt+0x378>
        vamapping map = virtual_memory_lookup(kernel_pagetable, va);
   406da:	8b 45 fc             	mov    -0x4(%rbp),%eax
   406dd:	48 63 d0             	movslq %eax,%rdx
   406e0:	48 8b 0d 19 09 01 00 	mov    0x10919(%rip),%rcx        # 51000 <kernel_pagetable>
   406e7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
   406ee:	48 89 ce             	mov    %rcx,%rsi
   406f1:	48 89 c7             	mov    %rax,%rdi
   406f4:	e8 50 27 00 00       	callq  42e49 <virtual_memory_lookup>
        virtual_memory_map(l1, va, map.pa, PAGESIZE, map.perm);
   406f9:	8b 4d 80             	mov    -0x80(%rbp),%ecx
   406fc:	48 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%rdx
   40703:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40706:	48 63 f0             	movslq %eax,%rsi
   40709:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4070d:	41 89 c8             	mov    %ecx,%r8d
   40710:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40715:	48 89 c7             	mov    %rax,%rdi
   40718:	e8 71 23 00 00       	callq  42a8e <virtual_memory_map>
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   4071d:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
   40724:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%rbp)
   4072b:	7e ad                	jle    406da <alloc_pt+0x32e>
    }

    return l1;
   4072d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
}
   40731:	c9                   	leaveq 
   40732:	c3                   	retq   

0000000000040733 <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   40733:	55                   	push   %rbp
   40734:	48 89 e5             	mov    %rsp,%rbp
   40737:	48 83 ec 40          	sub    $0x40,%rsp
   4073b:	89 7d cc             	mov    %edi,-0x34(%rbp)
   4073e:	89 75 c8             	mov    %esi,-0x38(%rbp)
    process_init(&processes[pid], 0);
   40741:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40744:	48 63 d0             	movslq %eax,%rdx
   40747:	48 89 d0             	mov    %rdx,%rax
   4074a:	48 c1 e0 03          	shl    $0x3,%rax
   4074e:	48 29 d0             	sub    %rdx,%rax
   40751:	48 c1 e0 05          	shl    $0x5,%rax
   40755:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   4075b:	be 00 00 00 00       	mov    $0x0,%esi
   40760:	48 89 c7             	mov    %rax,%rdi
   40763:	e8 6a 18 00 00       	callq  41fd2 <process_init>

    x86_64_pagetable *pt = alloc_pt(pid);
   40768:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4076b:	89 c7                	mov    %eax,%edi
   4076d:	e8 3a fc ff ff       	callq  403ac <alloc_pt>
   40772:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   40776:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   4077b:	0f 84 76 01 00 00    	je     408f7 <process_setup+0x1c4>

    processes[pid].p_pagetable = pt;
   40781:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40784:	48 63 d0             	movslq %eax,%rdx
   40787:	48 89 d0             	mov    %rdx,%rax
   4078a:	48 c1 e0 03          	shl    $0x3,%rax
   4078e:	48 29 d0             	sub    %rdx,%rax
   40791:	48 c1 e0 05          	shl    $0x5,%rax
   40795:	48 8d 90 f0 e0 04 00 	lea    0x4e0f0(%rax),%rdx
   4079c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   407a0:	48 89 02             	mov    %rax,(%rdx)
    int r = program_load(&processes[pid], program_number, NULL);
   407a3:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407a6:	48 63 d0             	movslq %eax,%rdx
   407a9:	48 89 d0             	mov    %rdx,%rax
   407ac:	48 c1 e0 03          	shl    $0x3,%rax
   407b0:	48 29 d0             	sub    %rdx,%rax
   407b3:	48 c1 e0 05          	shl    $0x5,%rax
   407b7:	48 8d 88 20 e0 04 00 	lea    0x4e020(%rax),%rcx
   407be:	8b 45 c8             	mov    -0x38(%rbp),%eax
   407c1:	ba 00 00 00 00       	mov    $0x0,%edx
   407c6:	89 c6                	mov    %eax,%esi
   407c8:	48 89 cf             	mov    %rcx,%rdi
   407cb:	e8 70 27 00 00       	callq  42f40 <program_load>
   407d0:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   407d3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   407d7:	79 14                	jns    407ed <process_setup+0xba>
   407d9:	ba 19 3c 04 00       	mov    $0x43c19,%edx
   407de:	be f9 00 00 00       	mov    $0xf9,%esi
   407e3:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   407e8:	e8 a2 1f 00 00       	callq  4278f <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   407ed:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407f0:	48 63 d0             	movslq %eax,%rdx
   407f3:	48 89 d0             	mov    %rdx,%rax
   407f6:	48 c1 e0 03          	shl    $0x3,%rax
   407fa:	48 29 d0             	sub    %rdx,%rax
   407fd:	48 c1 e0 05          	shl    $0x5,%rax
   40801:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   40807:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   4080e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40811:	48 63 d0             	movslq %eax,%rdx
   40814:	48 89 d0             	mov    %rdx,%rax
   40817:	48 c1 e0 03          	shl    $0x3,%rax
   4081b:	48 29 d0             	sub    %rdx,%rax
   4081e:	48 c1 e0 05          	shl    $0x5,%rax
   40822:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   40828:	48 8b 00             	mov    (%rax),%rax
   4082b:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   40831:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int stack_page_number = get_free_page_number();
   40835:	b8 00 00 00 00       	mov    $0x0,%eax
   4083a:	e8 2c fb ff ff       	callq  4036b <get_free_page_number>
   4083f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (stack_page_number == -1) {
   40842:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40846:	75 11                	jne    40859 <process_setup+0x126>
        free_pt(pt);
   40848:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4084c:	48 89 c7             	mov    %rax,%rdi
   4084f:	e8 13 f9 ff ff       	callq  40167 <free_pt>
        return;
   40854:	e9 9f 00 00 00       	jmpq   408f8 <process_setup+0x1c5>
    }
    uintptr_t stack_addr = PAGEADDRESS(stack_page_number);
   40859:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4085c:	48 98                	cltq   
   4085e:	48 c1 e0 0c          	shl    $0xc,%rax
   40862:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int assign_status = assign_physical_page(stack_addr, pid);
   40866:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40869:	0f be d0             	movsbl %al,%edx
   4086c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40870:	89 d6                	mov    %edx,%esi
   40872:	48 89 c7             	mov    %rax,%rdi
   40875:	e8 80 00 00 00       	callq  408fa <assign_physical_page>
   4087a:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (assign_status == -1) {
   4087d:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   40881:	75 1a                	jne    4089d <process_setup+0x16a>
        free_pt(pt); free_pt((x86_64_pagetable *) stack_addr);
   40883:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40887:	48 89 c7             	mov    %rax,%rdi
   4088a:	e8 d8 f8 ff ff       	callq  40167 <free_pt>
   4088f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40893:	48 89 c7             	mov    %rax,%rdi
   40896:	e8 cc f8 ff ff       	callq  40167 <free_pt>
        return;
   4089b:	eb 5b                	jmp    408f8 <process_setup+0x1c5>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_addr,
   4089d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408a0:	48 63 d0             	movslq %eax,%rdx
   408a3:	48 89 d0             	mov    %rdx,%rax
   408a6:	48 c1 e0 03          	shl    $0x3,%rax
   408aa:	48 29 d0             	sub    %rdx,%rax
   408ad:	48 c1 e0 05          	shl    $0x5,%rax
   408b1:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   408b7:	48 8b 00             	mov    (%rax),%rax
   408ba:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   408be:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   408c2:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   408c8:	b9 00 10 00 00       	mov    $0x1000,%ecx
   408cd:	48 89 c7             	mov    %rax,%rdi
   408d0:	e8 b9 21 00 00       	callq  42a8e <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   408d5:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408d8:	48 63 d0             	movslq %eax,%rdx
   408db:	48 89 d0             	mov    %rdx,%rax
   408de:	48 c1 e0 03          	shl    $0x3,%rax
   408e2:	48 29 d0             	sub    %rdx,%rax
   408e5:	48 c1 e0 05          	shl    $0x5,%rax
   408e9:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   408ef:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   408f5:	eb 01                	jmp    408f8 <process_setup+0x1c5>
    if (pt == NULL) return;
   408f7:	90                   	nop
}
   408f8:	c9                   	leaveq 
   408f9:	c3                   	retq   

00000000000408fa <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   408fa:	55                   	push   %rbp
   408fb:	48 89 e5             	mov    %rsp,%rbp
   408fe:	48 83 ec 10          	sub    $0x10,%rsp
   40902:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40906:	89 f0                	mov    %esi,%eax
   40908:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   4090b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4090f:	25 ff 0f 00 00       	and    $0xfff,%eax
   40914:	48 85 c0             	test   %rax,%rax
   40917:	75 20                	jne    40939 <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   40919:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40920:	00 
   40921:	77 16                	ja     40939 <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   40923:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40927:	48 c1 e8 0c          	shr    $0xc,%rax
   4092b:	48 98                	cltq   
   4092d:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   40934:	00 
   40935:	84 c0                	test   %al,%al
   40937:	74 07                	je     40940 <assign_physical_page+0x46>
        return -1;
   40939:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4093e:	eb 2c                	jmp    4096c <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   40940:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40944:	48 c1 e8 0c          	shr    $0xc,%rax
   40948:	48 98                	cltq   
   4094a:	c6 84 00 41 ee 04 00 	movb   $0x1,0x4ee41(%rax,%rax,1)
   40951:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40952:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40956:	48 c1 e8 0c          	shr    $0xc,%rax
   4095a:	48 98                	cltq   
   4095c:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   40960:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        return 0;
   40967:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   4096c:	c9                   	leaveq 
   4096d:	c3                   	retq   

000000000004096e <syscall_mapping>:

void syscall_mapping(proc* p){
   4096e:	55                   	push   %rbp
   4096f:	48 89 e5             	mov    %rsp,%rbp
   40972:	48 83 ec 70          	sub    $0x70,%rsp
   40976:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   4097a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4097e:	48 8b 40 38          	mov    0x38(%rax),%rax
   40982:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40986:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4098a:	48 8b 40 30          	mov    0x30(%rax),%rax
   4098e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40992:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40996:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   4099d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   409a1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   409a5:	48 89 ce             	mov    %rcx,%rsi
   409a8:	48 89 c7             	mov    %rax,%rdi
   409ab:	e8 99 24 00 00       	callq  42e49 <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   409b0:	8b 45 e0             	mov    -0x20(%rbp),%eax
   409b3:	48 98                	cltq   
   409b5:	83 e0 06             	and    $0x6,%eax
   409b8:	48 83 f8 06          	cmp    $0x6,%rax
   409bc:	75 73                	jne    40a31 <syscall_mapping+0xc3>
	return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   409be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409c2:	48 83 c0 17          	add    $0x17,%rax
   409c6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   409ca:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   409ce:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   409d5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   409d9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   409dd:	48 89 ce             	mov    %rcx,%rsi
   409e0:	48 89 c7             	mov    %rax,%rdi
   409e3:	e8 61 24 00 00       	callq  42e49 <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   409e8:	8b 45 c8             	mov    -0x38(%rbp),%eax
   409eb:	48 98                	cltq   
   409ed:	83 e0 03             	and    $0x3,%eax
   409f0:	48 83 f8 03          	cmp    $0x3,%rax
   409f4:	75 3e                	jne    40a34 <syscall_mapping+0xc6>
	return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   409f6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   409fa:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a01:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40a09:	48 89 ce             	mov    %rcx,%rsi
   40a0c:	48 89 c7             	mov    %rax,%rdi
   40a0f:	e8 35 24 00 00       	callq  42e49 <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40a14:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40a18:	48 89 c1             	mov    %rax,%rcx
   40a1b:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a1f:	ba 18 00 00 00       	mov    $0x18,%edx
   40a24:	48 89 c6             	mov    %rax,%rsi
   40a27:	48 89 cf             	mov    %rcx,%rdi
   40a2a:	e8 4a 28 00 00       	callq  43279 <memcpy>
   40a2f:	eb 04                	jmp    40a35 <syscall_mapping+0xc7>
	return;
   40a31:	90                   	nop
   40a32:	eb 01                	jmp    40a35 <syscall_mapping+0xc7>
	return;
   40a34:	90                   	nop
}
   40a35:	c9                   	leaveq 
   40a36:	c3                   	retq   

0000000000040a37 <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40a37:	55                   	push   %rbp
   40a38:	48 89 e5             	mov    %rsp,%rbp
   40a3b:	48 83 ec 18          	sub    $0x18,%rsp
   40a3f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40a43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a47:	48 8b 40 38          	mov    0x38(%rax),%rax
   40a4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40a4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40a52:	75 14                	jne    40a68 <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40a54:	0f b6 05 a5 45 00 00 	movzbl 0x45a5(%rip),%eax        # 45000 <disp_global>
   40a5b:	84 c0                	test   %al,%al
   40a5d:	0f 94 c0             	sete   %al
   40a60:	88 05 9a 45 00 00    	mov    %al,0x459a(%rip)        # 45000 <disp_global>
   40a66:	eb 36                	jmp    40a9e <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   40a68:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40a6c:	78 2f                	js     40a9d <syscall_mem_tog+0x66>
   40a6e:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40a72:	7f 29                	jg     40a9d <syscall_mem_tog+0x66>
   40a74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a78:	8b 00                	mov    (%rax),%eax
   40a7a:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40a7d:	75 1e                	jne    40a9d <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40a7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a83:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40a8a:	84 c0                	test   %al,%al
   40a8c:	0f 94 c0             	sete   %al
   40a8f:	89 c2                	mov    %eax,%edx
   40a91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40a95:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40a9b:	eb 01                	jmp    40a9e <syscall_mem_tog+0x67>
            return;
   40a9d:	90                   	nop
    }
}
   40a9e:	c9                   	leaveq 
   40a9f:	c3                   	retq   

0000000000040aa0 <exception>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers* reg) {
   40aa0:	55                   	push   %rbp
   40aa1:	48 89 e5             	mov    %rsp,%rbp
   40aa4:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
   40aab:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40ab2:	48 8b 05 47 d5 00 00 	mov    0xd547(%rip),%rax        # 4e000 <current>
   40ab9:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   40ac0:	48 83 c0 08          	add    $0x8,%rax
   40ac4:	48 89 d6             	mov    %rdx,%rsi
   40ac7:	ba 18 00 00 00       	mov    $0x18,%edx
   40acc:	48 89 c7             	mov    %rax,%rdi
   40acf:	48 89 d1             	mov    %rdx,%rcx
   40ad2:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40ad5:	48 8b 05 24 05 01 00 	mov    0x10524(%rip),%rax        # 51000 <kernel_pagetable>
   40adc:	48 89 c7             	mov    %rax,%rdi
   40adf:	e8 79 1e 00 00       	callq  4295d <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40ae4:	8b 05 12 85 07 00    	mov    0x78512(%rip),%eax        # b8ffc <cursorpos>
   40aea:	89 c7                	mov    %eax,%edi
   40aec:	e8 a0 15 00 00       	callq  42091 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40af1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40af8:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40aff:	48 83 f8 0e          	cmp    $0xe,%rax
   40b03:	74 14                	je     40b19 <exception+0x79>
   40b05:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40b0c:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b13:	48 83 f8 0d          	cmp    $0xd,%rax
   40b17:	75 16                	jne    40b2f <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40b19:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40b20:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40b27:	83 e0 04             	and    $0x4,%eax
   40b2a:	48 85 c0             	test   %rax,%rax
   40b2d:	74 1a                	je     40b49 <exception+0xa9>
    {
        check_virtual_memory();
   40b2f:	e8 60 07 00 00       	callq  41294 <check_virtual_memory>
        if(disp_global){
   40b34:	0f b6 05 c5 44 00 00 	movzbl 0x44c5(%rip),%eax        # 45000 <disp_global>
   40b3b:	84 c0                	test   %al,%al
   40b3d:	74 0a                	je     40b49 <exception+0xa9>
            memshow_physical();
   40b3f:	e8 c8 08 00 00       	callq  4140c <memshow_physical>
            memshow_virtual_animate();
   40b44:	e8 ee 0b 00 00       	callq  41737 <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40b49:	e8 20 1a 00 00       	callq  4256e <check_keyboard>


    // Actually handle the exception.
    switch (reg->reg_intno) {
   40b4e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40b55:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40b5c:	48 83 e8 0e          	sub    $0xe,%rax
   40b60:	48 83 f8 2a          	cmp    $0x2a,%rax
   40b64:	0f 87 8b 02 00 00    	ja     40df5 <exception+0x355>
   40b6a:	48 8b 04 c5 b8 3c 04 	mov    0x43cb8(,%rax,8),%rax
   40b71:	00 
   40b72:	ff e0                	jmpq   *%rax

    case INT_SYS_PANIC:
	    // rdi stores pointer for msg string
	    {
		char msg[160];
		uintptr_t addr = current->p_registers.reg_rdi;
   40b74:	48 8b 05 85 d4 00 00 	mov    0xd485(%rip),%rax        # 4e000 <current>
   40b7b:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b7f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
		if((void *)addr == NULL)
   40b83:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40b88:	75 0f                	jne    40b99 <exception+0xf9>
		    panic(NULL);
   40b8a:	bf 00 00 00 00       	mov    $0x0,%edi
   40b8f:	b8 00 00 00 00       	mov    $0x0,%eax
   40b94:	e8 16 1b 00 00       	callq  426af <panic>
		vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40b99:	48 8b 05 60 d4 00 00 	mov    0xd460(%rip),%rax        # 4e000 <current>
   40ba0:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40ba7:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   40bab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40baf:	48 89 ce             	mov    %rcx,%rsi
   40bb2:	48 89 c7             	mov    %rax,%rdi
   40bb5:	e8 8f 22 00 00       	callq  42e49 <virtual_memory_lookup>
		memcpy(msg, (void *)map.pa, 160);
   40bba:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40bbe:	48 89 c1             	mov    %rax,%rcx
   40bc1:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
   40bc8:	ba a0 00 00 00       	mov    $0xa0,%edx
   40bcd:	48 89 ce             	mov    %rcx,%rsi
   40bd0:	48 89 c7             	mov    %rax,%rdi
   40bd3:	e8 a1 26 00 00       	callq  43279 <memcpy>
		panic(msg);
   40bd8:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
   40bdf:	48 89 c7             	mov    %rax,%rdi
   40be2:	b8 00 00 00 00       	mov    $0x0,%eax
   40be7:	e8 c3 1a 00 00       	callq  426af <panic>
	    }
	    panic(NULL);
	    break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40bec:	48 8b 05 0d d4 00 00 	mov    0xd40d(%rip),%rax        # 4e000 <current>
   40bf3:	8b 10                	mov    (%rax),%edx
   40bf5:	48 8b 05 04 d4 00 00 	mov    0xd404(%rip),%rax        # 4e000 <current>
   40bfc:	48 63 d2             	movslq %edx,%rdx
   40bff:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40c03:	e9 fd 01 00 00       	jmpq   40e05 <exception+0x365>

    case INT_SYS_YIELD:
        schedule();
   40c08:	e8 21 02 00 00       	callq  40e2e <schedule>
        break;                  /* will not be reached */
   40c0d:	e9 f3 01 00 00       	jmpq   40e05 <exception+0x365>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   40c12:	48 8b 05 e7 d3 00 00 	mov    0xd3e7(%rip),%rax        # 4e000 <current>
   40c19:	48 8b 40 38          	mov    0x38(%rax),%rax
   40c1d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        if (addr < PROC_START_ADDR || addr > MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   40c21:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   40c28:	00 
   40c29:	76 18                	jbe    40c43 <exception+0x1a3>
   40c2b:	48 81 7d f8 00 00 30 	cmpq   $0x300000,-0x8(%rbp)
   40c32:	00 
   40c33:	77 0e                	ja     40c43 <exception+0x1a3>
   40c35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c39:	25 ff 0f 00 00       	and    $0xfff,%eax
   40c3e:	48 85 c0             	test   %rax,%rax
   40c41:	74 14                	je     40c57 <exception+0x1b7>
            current->p_registers.reg_rax = -1; break;
   40c43:	48 8b 05 b6 d3 00 00 	mov    0xd3b6(%rip),%rax        # 4e000 <current>
   40c4a:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40c51:	ff 
   40c52:	e9 ae 01 00 00       	jmpq   40e05 <exception+0x365>
        }
        int r = assign_physical_page(addr, current->p_pid);
   40c57:	48 8b 05 a2 d3 00 00 	mov    0xd3a2(%rip),%rax        # 4e000 <current>
   40c5e:	8b 00                	mov    (%rax),%eax
   40c60:	0f be d0             	movsbl %al,%edx
   40c63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c67:	89 d6                	mov    %edx,%esi
   40c69:	48 89 c7             	mov    %rax,%rdi
   40c6c:	e8 89 fc ff ff       	callq  408fa <assign_physical_page>
   40c71:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (r >= 0) {
   40c74:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40c78:	78 29                	js     40ca3 <exception+0x203>
            virtual_memory_map(current->p_pagetable, addr, addr,
   40c7a:	48 8b 05 7f d3 00 00 	mov    0xd37f(%rip),%rax        # 4e000 <current>
   40c81:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40c88:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40c8c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40c90:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40c96:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40c9b:	48 89 c7             	mov    %rax,%rdi
   40c9e:	e8 eb 1d 00 00       	callq  42a8e <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }
        current->p_registers.reg_rax = r;
   40ca3:	48 8b 05 56 d3 00 00 	mov    0xd356(%rip),%rax        # 4e000 <current>
   40caa:	8b 55 f4             	mov    -0xc(%rbp),%edx
   40cad:	48 63 d2             	movslq %edx,%rdx
   40cb0:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40cb4:	e9 4c 01 00 00       	jmpq   40e05 <exception+0x365>
    }

    case INT_SYS_MAPPING:
    {
	    syscall_mapping(current);
   40cb9:	48 8b 05 40 d3 00 00 	mov    0xd340(%rip),%rax        # 4e000 <current>
   40cc0:	48 89 c7             	mov    %rax,%rdi
   40cc3:	e8 a6 fc ff ff       	callq  4096e <syscall_mapping>
            break;
   40cc8:	e9 38 01 00 00       	jmpq   40e05 <exception+0x365>
    }

    case INT_SYS_MEM_TOG:
	{
	    syscall_mem_tog(current);
   40ccd:	48 8b 05 2c d3 00 00 	mov    0xd32c(%rip),%rax        # 4e000 <current>
   40cd4:	48 89 c7             	mov    %rax,%rdi
   40cd7:	e8 5b fd ff ff       	callq  40a37 <syscall_mem_tog>
	    break;
   40cdc:	e9 24 01 00 00       	jmpq   40e05 <exception+0x365>
	}

    case INT_TIMER:
        ++ticks;
   40ce1:	8b 05 39 e1 00 00    	mov    0xe139(%rip),%eax        # 4ee20 <ticks>
   40ce7:	83 c0 01             	add    $0x1,%eax
   40cea:	89 05 30 e1 00 00    	mov    %eax,0xe130(%rip)        # 4ee20 <ticks>
        schedule();
   40cf0:	e8 39 01 00 00       	callq  40e2e <schedule>
        break;                  /* will not be reached */
   40cf5:	e9 0b 01 00 00       	jmpq   40e05 <exception+0x365>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40cfa:	0f 20 d0             	mov    %cr2,%rax
   40cfd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    return val;
   40d01:	48 8b 45 c8          	mov    -0x38(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40d05:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   40d09:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40d10:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d17:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   40d1a:	48 85 c0             	test   %rax,%rax
   40d1d:	74 07                	je     40d26 <exception+0x286>
   40d1f:	b8 29 3c 04 00       	mov    $0x43c29,%eax
   40d24:	eb 05                	jmp    40d2b <exception+0x28b>
   40d26:	b8 2f 3c 04 00       	mov    $0x43c2f,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   40d2b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   40d2f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40d36:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d3d:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   40d40:	48 85 c0             	test   %rax,%rax
   40d43:	74 07                	je     40d4c <exception+0x2ac>
   40d45:	b8 34 3c 04 00       	mov    $0x43c34,%eax
   40d4a:	eb 05                	jmp    40d51 <exception+0x2b1>
   40d4c:	b8 47 3c 04 00       	mov    $0x43c47,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   40d51:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   40d55:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40d5c:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d63:	83 e0 04             	and    $0x4,%eax
   40d66:	48 85 c0             	test   %rax,%rax
   40d69:	75 2f                	jne    40d9a <exception+0x2fa>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40d6b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40d72:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40d79:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
   40d7d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40d81:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40d85:	49 89 f0             	mov    %rsi,%r8
   40d88:	48 89 c6             	mov    %rax,%rsi
   40d8b:	bf 58 3c 04 00       	mov    $0x43c58,%edi
   40d90:	b8 00 00 00 00       	mov    $0x0,%eax
   40d95:	e8 15 19 00 00       	callq  426af <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40d9a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40da1:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40da8:	48 8b 05 51 d2 00 00 	mov    0xd251(%rip),%rax        # 4e000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40daf:	8b 00                	mov    (%rax),%eax
   40db1:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   40db5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   40db9:	52                   	push   %rdx
   40dba:	ff 75 d0             	pushq  -0x30(%rbp)
   40dbd:	49 89 f1             	mov    %rsi,%r9
   40dc0:	49 89 c8             	mov    %rcx,%r8
   40dc3:	89 c1                	mov    %eax,%ecx
   40dc5:	ba 88 3c 04 00       	mov    $0x43c88,%edx
   40dca:	be 00 0c 00 00       	mov    $0xc00,%esi
   40dcf:	bf 80 07 00 00       	mov    $0x780,%edi
   40dd4:	b8 00 00 00 00       	mov    $0x0,%eax
   40dd9:	e8 39 2d 00 00       	callq  43b17 <console_printf>
   40dde:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40de2:	48 8b 05 17 d2 00 00 	mov    0xd217(%rip),%rax        # 4e000 <current>
   40de9:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40df0:	00 00 00 
        break;
   40df3:	eb 10                	jmp    40e05 <exception+0x365>
    }

    default:
        default_exception(current);
   40df5:	48 8b 05 04 d2 00 00 	mov    0xd204(%rip),%rax        # 4e000 <current>
   40dfc:	48 89 c7             	mov    %rax,%rdi
   40dff:	e8 bb 19 00 00       	callq  427bf <default_exception>
        break;                  /* will not be reached */
   40e04:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   40e05:	48 8b 05 f4 d1 00 00 	mov    0xd1f4(%rip),%rax        # 4e000 <current>
   40e0c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40e12:	83 f8 01             	cmp    $0x1,%eax
   40e15:	75 0f                	jne    40e26 <exception+0x386>
        run(current);
   40e17:	48 8b 05 e2 d1 00 00 	mov    0xd1e2(%rip),%rax        # 4e000 <current>
   40e1e:	48 89 c7             	mov    %rax,%rdi
   40e21:	e8 7a 00 00 00       	callq  40ea0 <run>
    } else {
        schedule();
   40e26:	e8 03 00 00 00       	callq  40e2e <schedule>
    }
}
   40e2b:	90                   	nop
   40e2c:	c9                   	leaveq 
   40e2d:	c3                   	retq   

0000000000040e2e <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   40e2e:	55                   	push   %rbp
   40e2f:	48 89 e5             	mov    %rsp,%rbp
   40e32:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40e36:	48 8b 05 c3 d1 00 00 	mov    0xd1c3(%rip),%rax        # 4e000 <current>
   40e3d:	8b 00                	mov    (%rax),%eax
   40e3f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   40e42:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40e45:	83 c0 01             	add    $0x1,%eax
   40e48:	99                   	cltd   
   40e49:	c1 ea 1c             	shr    $0x1c,%edx
   40e4c:	01 d0                	add    %edx,%eax
   40e4e:	83 e0 0f             	and    $0xf,%eax
   40e51:	29 d0                	sub    %edx,%eax
   40e53:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   40e56:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40e59:	48 63 d0             	movslq %eax,%rdx
   40e5c:	48 89 d0             	mov    %rdx,%rax
   40e5f:	48 c1 e0 03          	shl    $0x3,%rax
   40e63:	48 29 d0             	sub    %rdx,%rax
   40e66:	48 c1 e0 05          	shl    $0x5,%rax
   40e6a:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40e70:	8b 00                	mov    (%rax),%eax
   40e72:	83 f8 01             	cmp    $0x1,%eax
   40e75:	75 22                	jne    40e99 <schedule+0x6b>
            run(&processes[pid]);
   40e77:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40e7a:	48 63 d0             	movslq %eax,%rdx
   40e7d:	48 89 d0             	mov    %rdx,%rax
   40e80:	48 c1 e0 03          	shl    $0x3,%rax
   40e84:	48 29 d0             	sub    %rdx,%rax
   40e87:	48 c1 e0 05          	shl    $0x5,%rax
   40e8b:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   40e91:	48 89 c7             	mov    %rax,%rdi
   40e94:	e8 07 00 00 00       	callq  40ea0 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40e99:	e8 d0 16 00 00       	callq  4256e <check_keyboard>
        pid = (pid + 1) % NPROC;
   40e9e:	eb a2                	jmp    40e42 <schedule+0x14>

0000000000040ea0 <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   40ea0:	55                   	push   %rbp
   40ea1:	48 89 e5             	mov    %rsp,%rbp
   40ea4:	48 83 ec 10          	sub    $0x10,%rsp
   40ea8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40eac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40eb0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40eb6:	83 f8 01             	cmp    $0x1,%eax
   40eb9:	74 14                	je     40ecf <run+0x2f>
   40ebb:	ba 10 3e 04 00       	mov    $0x43e10,%edx
   40ec0:	be dc 01 00 00       	mov    $0x1dc,%esi
   40ec5:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   40eca:	e8 c0 18 00 00       	callq  4278f <assert_fail>
    current = p;
   40ecf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ed3:	48 89 05 26 d1 00 00 	mov    %rax,0xd126(%rip)        # 4e000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40eda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ede:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40ee5:	48 89 c7             	mov    %rax,%rdi
   40ee8:	e8 70 1a 00 00       	callq  4295d <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40eed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ef1:	48 83 c0 08          	add    $0x8,%rax
   40ef5:	48 89 c7             	mov    %rax,%rdi
   40ef8:	e8 c6 f1 ff ff       	callq  400c3 <exception_return>

0000000000040efd <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   40efd:	55                   	push   %rbp
   40efe:	48 89 e5             	mov    %rsp,%rbp
   40f01:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40f05:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40f0c:	00 
   40f0d:	e9 81 00 00 00       	jmpq   40f93 <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   40f12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f16:	48 89 c7             	mov    %rax,%rdi
   40f19:	e8 ef 0e 00 00       	callq  41e0d <physical_memory_isreserved>
   40f1e:	85 c0                	test   %eax,%eax
   40f20:	74 09                	je     40f2b <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   40f22:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40f29:	eb 2f                	jmp    40f5a <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   40f2b:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40f32:	00 
   40f33:	76 0b                	jbe    40f40 <pageinfo_init+0x43>
   40f35:	b8 08 70 05 00       	mov    $0x57008,%eax
   40f3a:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40f3e:	72 0a                	jb     40f4a <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   40f40:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40f47:	00 
   40f48:	75 09                	jne    40f53 <pageinfo_init+0x56>
            owner = PO_KERNEL;
   40f4a:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40f51:	eb 07                	jmp    40f5a <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   40f53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40f5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f5e:	48 c1 e8 0c          	shr    $0xc,%rax
   40f62:	89 c1                	mov    %eax,%ecx
   40f64:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f67:	89 c2                	mov    %eax,%edx
   40f69:	48 63 c1             	movslq %ecx,%rax
   40f6c:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   40f73:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40f77:	0f 95 c2             	setne  %dl
   40f7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f7e:	48 c1 e8 0c          	shr    $0xc,%rax
   40f82:	48 98                	cltq   
   40f84:	88 94 00 41 ee 04 00 	mov    %dl,0x4ee41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40f8b:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40f92:	00 
   40f93:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40f9a:	00 
   40f9b:	0f 86 71 ff ff ff    	jbe    40f12 <pageinfo_init+0x15>
    }
}
   40fa1:	90                   	nop
   40fa2:	90                   	nop
   40fa3:	c9                   	leaveq 
   40fa4:	c3                   	retq   

0000000000040fa5 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   40fa5:	55                   	push   %rbp
   40fa6:	48 89 e5             	mov    %rsp,%rbp
   40fa9:	48 83 ec 50          	sub    $0x50,%rsp
   40fad:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   40fb1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40fb5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40fbb:	48 89 c2             	mov    %rax,%rdx
   40fbe:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40fc2:	48 39 c2             	cmp    %rax,%rdx
   40fc5:	74 14                	je     40fdb <check_page_table_mappings+0x36>
   40fc7:	ba 30 3e 04 00       	mov    $0x43e30,%edx
   40fcc:	be 06 02 00 00       	mov    $0x206,%esi
   40fd1:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   40fd6:	e8 b4 17 00 00       	callq  4278f <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   40fdb:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   40fe2:	00 
   40fe3:	e9 9a 00 00 00       	jmpq   41082 <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   40fe8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   40fec:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40ff0:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40ff4:	48 89 ce             	mov    %rcx,%rsi
   40ff7:	48 89 c7             	mov    %rax,%rdi
   40ffa:	e8 4a 1e 00 00       	callq  42e49 <virtual_memory_lookup>
        if (vam.pa != va) {
   40fff:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41003:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41007:	74 27                	je     41030 <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   41009:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4100d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41011:	49 89 d0             	mov    %rdx,%r8
   41014:	48 89 c1             	mov    %rax,%rcx
   41017:	ba 4f 3e 04 00       	mov    $0x43e4f,%edx
   4101c:	be 00 c0 00 00       	mov    $0xc000,%esi
   41021:	bf e0 06 00 00       	mov    $0x6e0,%edi
   41026:	b8 00 00 00 00       	mov    $0x0,%eax
   4102b:	e8 e7 2a 00 00       	callq  43b17 <console_printf>
        }
        assert(vam.pa == va);
   41030:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41034:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41038:	74 14                	je     4104e <check_page_table_mappings+0xa9>
   4103a:	ba 59 3e 04 00       	mov    $0x43e59,%edx
   4103f:	be 0f 02 00 00       	mov    $0x20f,%esi
   41044:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   41049:	e8 41 17 00 00       	callq  4278f <assert_fail>
        if (va >= (uintptr_t) start_data) {
   4104e:	b8 00 50 04 00       	mov    $0x45000,%eax
   41053:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41057:	72 21                	jb     4107a <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   41059:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4105c:	48 98                	cltq   
   4105e:	83 e0 02             	and    $0x2,%eax
   41061:	48 85 c0             	test   %rax,%rax
   41064:	75 14                	jne    4107a <check_page_table_mappings+0xd5>
   41066:	ba 66 3e 04 00       	mov    $0x43e66,%edx
   4106b:	be 11 02 00 00       	mov    $0x211,%esi
   41070:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   41075:	e8 15 17 00 00       	callq  4278f <assert_fail>
         va += PAGESIZE) {
   4107a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41081:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   41082:	b8 08 70 05 00       	mov    $0x57008,%eax
   41087:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4108b:	0f 82 57 ff ff ff    	jb     40fe8 <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   41091:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41098:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41099:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   4109d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   410a1:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   410a5:	48 89 ce             	mov    %rcx,%rsi
   410a8:	48 89 c7             	mov    %rax,%rdi
   410ab:	e8 99 1d 00 00       	callq  42e49 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   410b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   410b4:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   410b8:	74 14                	je     410ce <check_page_table_mappings+0x129>
   410ba:	ba 77 3e 04 00       	mov    $0x43e77,%edx
   410bf:	be 18 02 00 00       	mov    $0x218,%esi
   410c4:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   410c9:	e8 c1 16 00 00       	callq  4278f <assert_fail>
    assert(vam.perm & PTE_W);
   410ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
   410d1:	48 98                	cltq   
   410d3:	83 e0 02             	and    $0x2,%eax
   410d6:	48 85 c0             	test   %rax,%rax
   410d9:	75 14                	jne    410ef <check_page_table_mappings+0x14a>
   410db:	ba 66 3e 04 00       	mov    $0x43e66,%edx
   410e0:	be 19 02 00 00       	mov    $0x219,%esi
   410e5:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   410ea:	e8 a0 16 00 00       	callq  4278f <assert_fail>
}
   410ef:	90                   	nop
   410f0:	c9                   	leaveq 
   410f1:	c3                   	retq   

00000000000410f2 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   410f2:	55                   	push   %rbp
   410f3:	48 89 e5             	mov    %rsp,%rbp
   410f6:	48 83 ec 20          	sub    $0x20,%rsp
   410fa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   410fe:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   41101:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41104:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   41107:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   4110e:	48 8b 05 eb fe 00 00 	mov    0xfeeb(%rip),%rax        # 51000 <kernel_pagetable>
   41115:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   41119:	75 67                	jne    41182 <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   4111b:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41122:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41129:	eb 51                	jmp    4117c <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   4112b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4112e:	48 63 d0             	movslq %eax,%rdx
   41131:	48 89 d0             	mov    %rdx,%rax
   41134:	48 c1 e0 03          	shl    $0x3,%rax
   41138:	48 29 d0             	sub    %rdx,%rax
   4113b:	48 c1 e0 05          	shl    $0x5,%rax
   4113f:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41145:	8b 00                	mov    (%rax),%eax
   41147:	85 c0                	test   %eax,%eax
   41149:	74 2d                	je     41178 <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   4114b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4114e:	48 63 d0             	movslq %eax,%rdx
   41151:	48 89 d0             	mov    %rdx,%rax
   41154:	48 c1 e0 03          	shl    $0x3,%rax
   41158:	48 29 d0             	sub    %rdx,%rax
   4115b:	48 c1 e0 05          	shl    $0x5,%rax
   4115f:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41165:	48 8b 10             	mov    (%rax),%rdx
   41168:	48 8b 05 91 fe 00 00 	mov    0xfe91(%rip),%rax        # 51000 <kernel_pagetable>
   4116f:	48 39 c2             	cmp    %rax,%rdx
   41172:	75 04                	jne    41178 <check_page_table_ownership+0x86>
                ++expected_refcount;
   41174:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41178:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4117c:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   41180:	7e a9                	jle    4112b <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   41182:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41185:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4118c:	be 00 00 00 00       	mov    $0x0,%esi
   41191:	48 89 c7             	mov    %rax,%rdi
   41194:	e8 03 00 00 00       	callq  4119c <check_page_table_ownership_level>
}
   41199:	90                   	nop
   4119a:	c9                   	leaveq 
   4119b:	c3                   	retq   

000000000004119c <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   4119c:	55                   	push   %rbp
   4119d:	48 89 e5             	mov    %rsp,%rbp
   411a0:	48 83 ec 30          	sub    $0x30,%rsp
   411a4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   411a8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   411ab:	89 55 e0             	mov    %edx,-0x20(%rbp)
   411ae:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   411b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411b5:	48 c1 e8 0c          	shr    $0xc,%rax
   411b9:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   411be:	7e 14                	jle    411d4 <check_page_table_ownership_level+0x38>
   411c0:	ba 88 3e 04 00       	mov    $0x43e88,%edx
   411c5:	be 36 02 00 00       	mov    $0x236,%esi
   411ca:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   411cf:	e8 bb 15 00 00       	callq  4278f <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   411d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411d8:	48 c1 e8 0c          	shr    $0xc,%rax
   411dc:	48 98                	cltq   
   411de:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   411e5:	00 
   411e6:	0f be c0             	movsbl %al,%eax
   411e9:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   411ec:	74 14                	je     41202 <check_page_table_ownership_level+0x66>
   411ee:	ba a0 3e 04 00       	mov    $0x43ea0,%edx
   411f3:	be 37 02 00 00       	mov    $0x237,%esi
   411f8:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   411fd:	e8 8d 15 00 00       	callq  4278f <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   41202:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41206:	48 c1 e8 0c          	shr    $0xc,%rax
   4120a:	48 98                	cltq   
   4120c:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41213:	00 
   41214:	0f be c0             	movsbl %al,%eax
   41217:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   4121a:	74 14                	je     41230 <check_page_table_ownership_level+0x94>
   4121c:	ba c8 3e 04 00       	mov    $0x43ec8,%edx
   41221:	be 38 02 00 00       	mov    $0x238,%esi
   41226:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   4122b:	e8 5f 15 00 00       	callq  4278f <assert_fail>
    if (level < 3) {
   41230:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41234:	7f 5b                	jg     41291 <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41236:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4123d:	eb 49                	jmp    41288 <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   4123f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41243:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41246:	48 63 d2             	movslq %edx,%rdx
   41249:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4124d:	48 85 c0             	test   %rax,%rax
   41250:	74 32                	je     41284 <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   41252:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41256:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41259:	48 63 d2             	movslq %edx,%rdx
   4125c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41260:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   41266:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   4126a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4126d:	8d 70 01             	lea    0x1(%rax),%esi
   41270:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41273:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41277:	b9 01 00 00 00       	mov    $0x1,%ecx
   4127c:	48 89 c7             	mov    %rax,%rdi
   4127f:	e8 18 ff ff ff       	callq  4119c <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41284:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41288:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   4128f:	7e ae                	jle    4123f <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   41291:	90                   	nop
   41292:	c9                   	leaveq 
   41293:	c3                   	retq   

0000000000041294 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41294:	55                   	push   %rbp
   41295:	48 89 e5             	mov    %rsp,%rbp
   41298:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   4129c:	8b 05 46 ce 00 00    	mov    0xce46(%rip),%eax        # 4e0e8 <processes+0xc8>
   412a2:	85 c0                	test   %eax,%eax
   412a4:	74 14                	je     412ba <check_virtual_memory+0x26>
   412a6:	ba f8 3e 04 00       	mov    $0x43ef8,%edx
   412ab:	be 4b 02 00 00       	mov    $0x24b,%esi
   412b0:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   412b5:	e8 d5 14 00 00       	callq  4278f <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   412ba:	48 8b 05 3f fd 00 00 	mov    0xfd3f(%rip),%rax        # 51000 <kernel_pagetable>
   412c1:	48 89 c7             	mov    %rax,%rdi
   412c4:	e8 dc fc ff ff       	callq  40fa5 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   412c9:	48 8b 05 30 fd 00 00 	mov    0xfd30(%rip),%rax        # 51000 <kernel_pagetable>
   412d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
   412d5:	48 89 c7             	mov    %rax,%rdi
   412d8:	e8 15 fe ff ff       	callq  410f2 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   412dd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   412e4:	e9 9c 00 00 00       	jmpq   41385 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   412e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   412ec:	48 63 d0             	movslq %eax,%rdx
   412ef:	48 89 d0             	mov    %rdx,%rax
   412f2:	48 c1 e0 03          	shl    $0x3,%rax
   412f6:	48 29 d0             	sub    %rdx,%rax
   412f9:	48 c1 e0 05          	shl    $0x5,%rax
   412fd:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41303:	8b 00                	mov    (%rax),%eax
   41305:	85 c0                	test   %eax,%eax
   41307:	74 78                	je     41381 <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   41309:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4130c:	48 63 d0             	movslq %eax,%rdx
   4130f:	48 89 d0             	mov    %rdx,%rax
   41312:	48 c1 e0 03          	shl    $0x3,%rax
   41316:	48 29 d0             	sub    %rdx,%rax
   41319:	48 c1 e0 05          	shl    $0x5,%rax
   4131d:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41323:	48 8b 10             	mov    (%rax),%rdx
   41326:	48 8b 05 d3 fc 00 00 	mov    0xfcd3(%rip),%rax        # 51000 <kernel_pagetable>
   4132d:	48 39 c2             	cmp    %rax,%rdx
   41330:	74 4f                	je     41381 <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   41332:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41335:	48 63 d0             	movslq %eax,%rdx
   41338:	48 89 d0             	mov    %rdx,%rax
   4133b:	48 c1 e0 03          	shl    $0x3,%rax
   4133f:	48 29 d0             	sub    %rdx,%rax
   41342:	48 c1 e0 05          	shl    $0x5,%rax
   41346:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4134c:	48 8b 00             	mov    (%rax),%rax
   4134f:	48 89 c7             	mov    %rax,%rdi
   41352:	e8 4e fc ff ff       	callq  40fa5 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41357:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4135a:	48 63 d0             	movslq %eax,%rdx
   4135d:	48 89 d0             	mov    %rdx,%rax
   41360:	48 c1 e0 03          	shl    $0x3,%rax
   41364:	48 29 d0             	sub    %rdx,%rax
   41367:	48 c1 e0 05          	shl    $0x5,%rax
   4136b:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41371:	48 8b 00             	mov    (%rax),%rax
   41374:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41377:	89 d6                	mov    %edx,%esi
   41379:	48 89 c7             	mov    %rax,%rdi
   4137c:	e8 71 fd ff ff       	callq  410f2 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41381:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41385:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41389:	0f 8e 5a ff ff ff    	jle    412e9 <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4138f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41396:	eb 67                	jmp    413ff <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   41398:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4139b:	48 98                	cltq   
   4139d:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   413a4:	00 
   413a5:	84 c0                	test   %al,%al
   413a7:	7e 52                	jle    413fb <check_virtual_memory+0x167>
   413a9:	8b 45 f8             	mov    -0x8(%rbp),%eax
   413ac:	48 98                	cltq   
   413ae:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   413b5:	00 
   413b6:	84 c0                	test   %al,%al
   413b8:	78 41                	js     413fb <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   413ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
   413bd:	48 98                	cltq   
   413bf:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   413c6:	00 
   413c7:	0f be c0             	movsbl %al,%eax
   413ca:	48 63 d0             	movslq %eax,%rdx
   413cd:	48 89 d0             	mov    %rdx,%rax
   413d0:	48 c1 e0 03          	shl    $0x3,%rax
   413d4:	48 29 d0             	sub    %rdx,%rax
   413d7:	48 c1 e0 05          	shl    $0x5,%rax
   413db:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   413e1:	8b 00                	mov    (%rax),%eax
   413e3:	85 c0                	test   %eax,%eax
   413e5:	75 14                	jne    413fb <check_virtual_memory+0x167>
   413e7:	ba 18 3f 04 00       	mov    $0x43f18,%edx
   413ec:	be 62 02 00 00       	mov    $0x262,%esi
   413f1:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   413f6:	e8 94 13 00 00       	callq  4278f <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   413fb:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   413ff:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41406:	7e 90                	jle    41398 <check_virtual_memory+0x104>
        }
    }
}
   41408:	90                   	nop
   41409:	90                   	nop
   4140a:	c9                   	leaveq 
   4140b:	c3                   	retq   

000000000004140c <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   4140c:	55                   	push   %rbp
   4140d:	48 89 e5             	mov    %rsp,%rbp
   41410:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41414:	ba 86 3f 04 00       	mov    $0x43f86,%edx
   41419:	be 00 0f 00 00       	mov    $0xf00,%esi
   4141e:	bf 20 00 00 00       	mov    $0x20,%edi
   41423:	b8 00 00 00 00       	mov    $0x0,%eax
   41428:	e8 ea 26 00 00       	callq  43b17 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4142d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41434:	e9 f4 00 00 00       	jmpq   4152d <memshow_physical+0x121>
        if (pn % 64 == 0) {
   41439:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4143c:	83 e0 3f             	and    $0x3f,%eax
   4143f:	85 c0                	test   %eax,%eax
   41441:	75 3e                	jne    41481 <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41443:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41446:	c1 e0 0c             	shl    $0xc,%eax
   41449:	89 c2                	mov    %eax,%edx
   4144b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4144e:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41451:	85 c0                	test   %eax,%eax
   41453:	0f 48 c1             	cmovs  %ecx,%eax
   41456:	c1 f8 06             	sar    $0x6,%eax
   41459:	8d 48 01             	lea    0x1(%rax),%ecx
   4145c:	89 c8                	mov    %ecx,%eax
   4145e:	c1 e0 02             	shl    $0x2,%eax
   41461:	01 c8                	add    %ecx,%eax
   41463:	c1 e0 04             	shl    $0x4,%eax
   41466:	83 c0 03             	add    $0x3,%eax
   41469:	89 d1                	mov    %edx,%ecx
   4146b:	ba 96 3f 04 00       	mov    $0x43f96,%edx
   41470:	be 00 0f 00 00       	mov    $0xf00,%esi
   41475:	89 c7                	mov    %eax,%edi
   41477:	b8 00 00 00 00       	mov    $0x0,%eax
   4147c:	e8 96 26 00 00       	callq  43b17 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41481:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41484:	48 98                	cltq   
   41486:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4148d:	00 
   4148e:	0f be c0             	movsbl %al,%eax
   41491:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   41494:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41497:	48 98                	cltq   
   41499:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   414a0:	00 
   414a1:	84 c0                	test   %al,%al
   414a3:	75 07                	jne    414ac <memshow_physical+0xa0>
            owner = PO_FREE;
   414a5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   414ac:	8b 45 f8             	mov    -0x8(%rbp),%eax
   414af:	83 c0 02             	add    $0x2,%eax
   414b2:	48 98                	cltq   
   414b4:	0f b7 84 00 60 3f 04 	movzwl 0x43f60(%rax,%rax,1),%eax
   414bb:	00 
   414bc:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   414c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414c3:	48 98                	cltq   
   414c5:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   414cc:	00 
   414cd:	3c 01                	cmp    $0x1,%al
   414cf:	7e 1a                	jle    414eb <memshow_physical+0xdf>
   414d1:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   414d6:	48 c1 e8 0c          	shr    $0xc,%rax
   414da:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   414dd:	74 0c                	je     414eb <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   414df:	b8 53 00 00 00       	mov    $0x53,%eax
   414e4:	80 cc 0f             	or     $0xf,%ah
   414e7:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
	    color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   414eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414ee:	8d 50 3f             	lea    0x3f(%rax),%edx
   414f1:	85 c0                	test   %eax,%eax
   414f3:	0f 48 c2             	cmovs  %edx,%eax
   414f6:	c1 f8 06             	sar    $0x6,%eax
   414f9:	8d 50 01             	lea    0x1(%rax),%edx
   414fc:	89 d0                	mov    %edx,%eax
   414fe:	c1 e0 02             	shl    $0x2,%eax
   41501:	01 d0                	add    %edx,%eax
   41503:	c1 e0 04             	shl    $0x4,%eax
   41506:	89 c1                	mov    %eax,%ecx
   41508:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4150b:	99                   	cltd   
   4150c:	c1 ea 1a             	shr    $0x1a,%edx
   4150f:	01 d0                	add    %edx,%eax
   41511:	83 e0 3f             	and    $0x3f,%eax
   41514:	29 d0                	sub    %edx,%eax
   41516:	83 c0 0c             	add    $0xc,%eax
   41519:	01 c8                	add    %ecx,%eax
   4151b:	48 98                	cltq   
   4151d:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   41521:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   41528:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41529:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4152d:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41534:	0f 8e ff fe ff ff    	jle    41439 <memshow_physical+0x2d>
    }
}
   4153a:	90                   	nop
   4153b:	90                   	nop
   4153c:	c9                   	leaveq 
   4153d:	c3                   	retq   

000000000004153e <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   4153e:	55                   	push   %rbp
   4153f:	48 89 e5             	mov    %rsp,%rbp
   41542:	48 83 ec 40          	sub    $0x40,%rsp
   41546:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4154a:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   4154e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41552:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41558:	48 89 c2             	mov    %rax,%rdx
   4155b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4155f:	48 39 c2             	cmp    %rax,%rdx
   41562:	74 14                	je     41578 <memshow_virtual+0x3a>
   41564:	ba a0 3f 04 00       	mov    $0x43fa0,%edx
   41569:	be 93 02 00 00       	mov    $0x293,%esi
   4156e:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   41573:	e8 17 12 00 00       	callq  4278f <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41578:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4157c:	48 89 c1             	mov    %rax,%rcx
   4157f:	ba cd 3f 04 00       	mov    $0x43fcd,%edx
   41584:	be 00 0f 00 00       	mov    $0xf00,%esi
   41589:	bf 3a 03 00 00       	mov    $0x33a,%edi
   4158e:	b8 00 00 00 00       	mov    $0x0,%eax
   41593:	e8 7f 25 00 00       	callq  43b17 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41598:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4159f:	00 
   415a0:	e9 80 01 00 00       	jmpq   41725 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   415a5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   415a9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   415ad:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   415b1:	48 89 ce             	mov    %rcx,%rsi
   415b4:	48 89 c7             	mov    %rax,%rdi
   415b7:	e8 8d 18 00 00       	callq  42e49 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   415bc:	8b 45 d0             	mov    -0x30(%rbp),%eax
   415bf:	85 c0                	test   %eax,%eax
   415c1:	79 0b                	jns    415ce <memshow_virtual+0x90>
            color = ' ';
   415c3:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   415c9:	e9 d7 00 00 00       	jmpq   416a5 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   415ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   415d2:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   415d8:	76 14                	jbe    415ee <memshow_virtual+0xb0>
   415da:	ba ea 3f 04 00       	mov    $0x43fea,%edx
   415df:	be 9c 02 00 00       	mov    $0x29c,%esi
   415e4:	bf 20 3c 04 00       	mov    $0x43c20,%edi
   415e9:	e8 a1 11 00 00       	callq  4278f <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   415ee:	8b 45 d0             	mov    -0x30(%rbp),%eax
   415f1:	48 98                	cltq   
   415f3:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   415fa:	00 
   415fb:	0f be c0             	movsbl %al,%eax
   415fe:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41601:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41604:	48 98                	cltq   
   41606:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4160d:	00 
   4160e:	84 c0                	test   %al,%al
   41610:	75 07                	jne    41619 <memshow_virtual+0xdb>
                owner = PO_FREE;
   41612:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41619:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4161c:	83 c0 02             	add    $0x2,%eax
   4161f:	48 98                	cltq   
   41621:	0f b7 84 00 60 3f 04 	movzwl 0x43f60(%rax,%rax,1),%eax
   41628:	00 
   41629:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   4162d:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41630:	48 98                	cltq   
   41632:	83 e0 04             	and    $0x4,%eax
   41635:	48 85 c0             	test   %rax,%rax
   41638:	74 27                	je     41661 <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   4163a:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4163e:	c1 e0 04             	shl    $0x4,%eax
   41641:	66 25 00 f0          	and    $0xf000,%ax
   41645:	89 c2                	mov    %eax,%edx
   41647:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4164b:	c1 f8 04             	sar    $0x4,%eax
   4164e:	66 25 00 0f          	and    $0xf00,%ax
   41652:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   41654:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41658:	0f b6 c0             	movzbl %al,%eax
   4165b:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   4165d:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   41661:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41664:	48 98                	cltq   
   41666:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4166d:	00 
   4166e:	3c 01                	cmp    $0x1,%al
   41670:	7e 33                	jle    416a5 <memshow_virtual+0x167>
   41672:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41677:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4167b:	74 28                	je     416a5 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   4167d:	b8 53 00 00 00       	mov    $0x53,%eax
   41682:	89 c2                	mov    %eax,%edx
   41684:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41688:	66 25 00 f0          	and    $0xf000,%ax
   4168c:	09 d0                	or     %edx,%eax
   4168e:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41692:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41695:	48 98                	cltq   
   41697:	83 e0 04             	and    $0x4,%eax
   4169a:	48 85 c0             	test   %rax,%rax
   4169d:	75 06                	jne    416a5 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   4169f:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
		color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   416a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416a9:	48 c1 e8 0c          	shr    $0xc,%rax
   416ad:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   416b0:	8b 45 ec             	mov    -0x14(%rbp),%eax
   416b3:	83 e0 3f             	and    $0x3f,%eax
   416b6:	85 c0                	test   %eax,%eax
   416b8:	75 34                	jne    416ee <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   416ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
   416bd:	c1 e8 06             	shr    $0x6,%eax
   416c0:	89 c2                	mov    %eax,%edx
   416c2:	89 d0                	mov    %edx,%eax
   416c4:	c1 e0 02             	shl    $0x2,%eax
   416c7:	01 d0                	add    %edx,%eax
   416c9:	c1 e0 04             	shl    $0x4,%eax
   416cc:	05 73 03 00 00       	add    $0x373,%eax
   416d1:	89 c7                	mov    %eax,%edi
   416d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416d7:	48 89 c1             	mov    %rax,%rcx
   416da:	ba 96 3f 04 00       	mov    $0x43f96,%edx
   416df:	be 00 0f 00 00       	mov    $0xf00,%esi
   416e4:	b8 00 00 00 00       	mov    $0x0,%eax
   416e9:	e8 29 24 00 00       	callq  43b17 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   416ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
   416f1:	c1 e8 06             	shr    $0x6,%eax
   416f4:	89 c2                	mov    %eax,%edx
   416f6:	89 d0                	mov    %edx,%eax
   416f8:	c1 e0 02             	shl    $0x2,%eax
   416fb:	01 d0                	add    %edx,%eax
   416fd:	c1 e0 04             	shl    $0x4,%eax
   41700:	89 c2                	mov    %eax,%edx
   41702:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41705:	83 e0 3f             	and    $0x3f,%eax
   41708:	01 d0                	add    %edx,%eax
   4170a:	05 7c 03 00 00       	add    $0x37c,%eax
   4170f:	89 c2                	mov    %eax,%edx
   41711:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41715:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   4171c:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4171d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41724:	00 
   41725:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   4172c:	00 
   4172d:	0f 86 72 fe ff ff    	jbe    415a5 <memshow_virtual+0x67>
    }
}
   41733:	90                   	nop
   41734:	90                   	nop
   41735:	c9                   	leaveq 
   41736:	c3                   	retq   

0000000000041737 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41737:	55                   	push   %rbp
   41738:	48 89 e5             	mov    %rsp,%rbp
   4173b:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   4173f:	8b 05 fb da 00 00    	mov    0xdafb(%rip),%eax        # 4f240 <last_ticks.1>
   41745:	85 c0                	test   %eax,%eax
   41747:	74 13                	je     4175c <memshow_virtual_animate+0x25>
   41749:	8b 05 d1 d6 00 00    	mov    0xd6d1(%rip),%eax        # 4ee20 <ticks>
   4174f:	8b 15 eb da 00 00    	mov    0xdaeb(%rip),%edx        # 4f240 <last_ticks.1>
   41755:	29 d0                	sub    %edx,%eax
   41757:	83 f8 31             	cmp    $0x31,%eax
   4175a:	76 2c                	jbe    41788 <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   4175c:	8b 05 be d6 00 00    	mov    0xd6be(%rip),%eax        # 4ee20 <ticks>
   41762:	89 05 d8 da 00 00    	mov    %eax,0xdad8(%rip)        # 4f240 <last_ticks.1>
        ++showing;
   41768:	8b 05 96 38 00 00    	mov    0x3896(%rip),%eax        # 45004 <showing.0>
   4176e:	83 c0 01             	add    $0x1,%eax
   41771:	89 05 8d 38 00 00    	mov    %eax,0x388d(%rip)        # 45004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   41777:	eb 0f                	jmp    41788 <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   41779:	8b 05 85 38 00 00    	mov    0x3885(%rip),%eax        # 45004 <showing.0>
   4177f:	83 c0 01             	add    $0x1,%eax
   41782:	89 05 7c 38 00 00    	mov    %eax,0x387c(%rip)        # 45004 <showing.0>
    while (showing <= 2*NPROC
   41788:	8b 05 76 38 00 00    	mov    0x3876(%rip),%eax        # 45004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   4178e:	83 f8 20             	cmp    $0x20,%eax
   41791:	7f 2e                	jg     417c1 <memshow_virtual_animate+0x8a>
   41793:	8b 05 6b 38 00 00    	mov    0x386b(%rip),%eax        # 45004 <showing.0>
   41799:	99                   	cltd   
   4179a:	c1 ea 1c             	shr    $0x1c,%edx
   4179d:	01 d0                	add    %edx,%eax
   4179f:	83 e0 0f             	and    $0xf,%eax
   417a2:	29 d0                	sub    %edx,%eax
   417a4:	48 63 d0             	movslq %eax,%rdx
   417a7:	48 89 d0             	mov    %rdx,%rax
   417aa:	48 c1 e0 03          	shl    $0x3,%rax
   417ae:	48 29 d0             	sub    %rdx,%rax
   417b1:	48 c1 e0 05          	shl    $0x5,%rax
   417b5:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   417bb:	8b 00                	mov    (%rax),%eax
   417bd:	85 c0                	test   %eax,%eax
   417bf:	74 b8                	je     41779 <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   417c1:	8b 05 3d 38 00 00    	mov    0x383d(%rip),%eax        # 45004 <showing.0>
   417c7:	99                   	cltd   
   417c8:	c1 ea 1c             	shr    $0x1c,%edx
   417cb:	01 d0                	add    %edx,%eax
   417cd:	83 e0 0f             	and    $0xf,%eax
   417d0:	29 d0                	sub    %edx,%eax
   417d2:	89 05 2c 38 00 00    	mov    %eax,0x382c(%rip)        # 45004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   417d8:	8b 05 26 38 00 00    	mov    0x3826(%rip),%eax        # 45004 <showing.0>
   417de:	48 63 d0             	movslq %eax,%rdx
   417e1:	48 89 d0             	mov    %rdx,%rax
   417e4:	48 c1 e0 03          	shl    $0x3,%rax
   417e8:	48 29 d0             	sub    %rdx,%rax
   417eb:	48 c1 e0 05          	shl    $0x5,%rax
   417ef:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   417f5:	8b 00                	mov    (%rax),%eax
   417f7:	85 c0                	test   %eax,%eax
   417f9:	74 52                	je     4184d <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   417fb:	8b 15 03 38 00 00    	mov    0x3803(%rip),%edx        # 45004 <showing.0>
   41801:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41805:	89 d1                	mov    %edx,%ecx
   41807:	ba 04 40 04 00       	mov    $0x44004,%edx
   4180c:	be 04 00 00 00       	mov    $0x4,%esi
   41811:	48 89 c7             	mov    %rax,%rdi
   41814:	b8 00 00 00 00       	mov    $0x0,%eax
   41819:	e8 77 23 00 00       	callq  43b95 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   4181e:	8b 05 e0 37 00 00    	mov    0x37e0(%rip),%eax        # 45004 <showing.0>
   41824:	48 63 d0             	movslq %eax,%rdx
   41827:	48 89 d0             	mov    %rdx,%rax
   4182a:	48 c1 e0 03          	shl    $0x3,%rax
   4182e:	48 29 d0             	sub    %rdx,%rax
   41831:	48 c1 e0 05          	shl    $0x5,%rax
   41835:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4183b:	48 8b 00             	mov    (%rax),%rax
   4183e:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   41842:	48 89 d6             	mov    %rdx,%rsi
   41845:	48 89 c7             	mov    %rax,%rdi
   41848:	e8 f1 fc ff ff       	callq  4153e <memshow_virtual>
    }
}
   4184d:	90                   	nop
   4184e:	c9                   	leaveq 
   4184f:	c3                   	retq   

0000000000041850 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   41850:	55                   	push   %rbp
   41851:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   41854:	e8 53 01 00 00       	callq  419ac <segments_init>
    interrupt_init();
   41859:	e8 d4 03 00 00       	callq  41c32 <interrupt_init>
    virtual_memory_init();
   4185e:	e8 e7 0f 00 00       	callq  4284a <virtual_memory_init>
}
   41863:	90                   	nop
   41864:	5d                   	pop    %rbp
   41865:	c3                   	retq   

0000000000041866 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   41866:	55                   	push   %rbp
   41867:	48 89 e5             	mov    %rsp,%rbp
   4186a:	48 83 ec 18          	sub    $0x18,%rsp
   4186e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41872:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41876:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   41879:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4187c:	48 98                	cltq   
   4187e:	48 c1 e0 2d          	shl    $0x2d,%rax
   41882:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   41886:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   4188d:	90 00 00 
   41890:	48 09 c2             	or     %rax,%rdx
    *segment = type
   41893:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41897:	48 89 10             	mov    %rdx,(%rax)
}
   4189a:	90                   	nop
   4189b:	c9                   	leaveq 
   4189c:	c3                   	retq   

000000000004189d <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   4189d:	55                   	push   %rbp
   4189e:	48 89 e5             	mov    %rsp,%rbp
   418a1:	48 83 ec 28          	sub    $0x28,%rsp
   418a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   418a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   418ad:	89 55 ec             	mov    %edx,-0x14(%rbp)
   418b0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   418b4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   418b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418bc:	48 c1 e0 10          	shl    $0x10,%rax
   418c0:	48 89 c2             	mov    %rax,%rdx
   418c3:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   418ca:	00 00 00 
   418cd:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   418d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418d4:	48 c1 e0 20          	shl    $0x20,%rax
   418d8:	48 89 c1             	mov    %rax,%rcx
   418db:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   418e2:	00 00 ff 
   418e5:	48 21 c8             	and    %rcx,%rax
   418e8:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   418eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   418ef:	48 83 e8 01          	sub    $0x1,%rax
   418f3:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   418f6:	48 09 d0             	or     %rdx,%rax
        | type
   418f9:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   418fd:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41900:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41903:	48 98                	cltq   
   41905:	48 c1 e0 2d          	shl    $0x2d,%rax
   41909:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   4190c:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41913:	80 00 00 
   41916:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41919:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4191d:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41920:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41924:	48 83 c0 08          	add    $0x8,%rax
   41928:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4192c:	48 c1 ea 20          	shr    $0x20,%rdx
   41930:	48 89 10             	mov    %rdx,(%rax)
}
   41933:	90                   	nop
   41934:	c9                   	leaveq 
   41935:	c3                   	retq   

0000000000041936 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41936:	55                   	push   %rbp
   41937:	48 89 e5             	mov    %rsp,%rbp
   4193a:	48 83 ec 20          	sub    $0x20,%rsp
   4193e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41942:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41946:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41949:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4194d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41951:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41954:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41958:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   4195b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4195e:	48 98                	cltq   
   41960:	48 c1 e0 2d          	shl    $0x2d,%rax
   41964:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41967:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4196b:	48 c1 e0 20          	shl    $0x20,%rax
   4196f:	48 89 c1             	mov    %rax,%rcx
   41972:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41979:	00 ff ff 
   4197c:	48 21 c8             	and    %rcx,%rax
   4197f:	48 09 c2             	or     %rax,%rdx
   41982:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41989:	80 00 00 
   4198c:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4198f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41993:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41996:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4199a:	48 c1 e8 20          	shr    $0x20,%rax
   4199e:	48 89 c2             	mov    %rax,%rdx
   419a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   419a5:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   419a9:	90                   	nop
   419aa:	c9                   	leaveq 
   419ab:	c3                   	retq   

00000000000419ac <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   419ac:	55                   	push   %rbp
   419ad:	48 89 e5             	mov    %rsp,%rbp
   419b0:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   419b4:	48 c7 05 a1 d8 00 00 	movq   $0x0,0xd8a1(%rip)        # 4f260 <segments>
   419bb:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   419bf:	ba 00 00 00 00       	mov    $0x0,%edx
   419c4:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   419cb:	08 20 00 
   419ce:	48 89 c6             	mov    %rax,%rsi
   419d1:	bf 68 f2 04 00       	mov    $0x4f268,%edi
   419d6:	e8 8b fe ff ff       	callq  41866 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   419db:	ba 03 00 00 00       	mov    $0x3,%edx
   419e0:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   419e7:	08 20 00 
   419ea:	48 89 c6             	mov    %rax,%rsi
   419ed:	bf 70 f2 04 00       	mov    $0x4f270,%edi
   419f2:	e8 6f fe ff ff       	callq  41866 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   419f7:	ba 00 00 00 00       	mov    $0x0,%edx
   419fc:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41a03:	02 00 00 
   41a06:	48 89 c6             	mov    %rax,%rsi
   41a09:	bf 78 f2 04 00       	mov    $0x4f278,%edi
   41a0e:	e8 53 fe ff ff       	callq  41866 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41a13:	ba 03 00 00 00       	mov    $0x3,%edx
   41a18:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41a1f:	02 00 00 
   41a22:	48 89 c6             	mov    %rax,%rsi
   41a25:	bf 80 f2 04 00       	mov    $0x4f280,%edi
   41a2a:	e8 37 fe ff ff       	callq  41866 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41a2f:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   41a34:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41a3a:	48 89 c1             	mov    %rax,%rcx
   41a3d:	ba 00 00 00 00       	mov    $0x0,%edx
   41a42:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41a49:	09 00 00 
   41a4c:	48 89 c6             	mov    %rax,%rsi
   41a4f:	bf 88 f2 04 00       	mov    $0x4f288,%edi
   41a54:	e8 44 fe ff ff       	callq  4189d <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41a59:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41a5f:	b8 60 f2 04 00       	mov    $0x4f260,%eax
   41a64:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41a68:	ba 60 00 00 00       	mov    $0x60,%edx
   41a6d:	be 00 00 00 00       	mov    $0x0,%esi
   41a72:	bf a0 02 05 00       	mov    $0x502a0,%edi
   41a77:	e8 66 18 00 00       	callq  432e2 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41a7c:	48 c7 05 1d e8 00 00 	movq   $0x80000,0xe81d(%rip)        # 502a4 <kernel_task_descriptor+0x4>
   41a83:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41a87:	ba 00 10 00 00       	mov    $0x1000,%edx
   41a8c:	be 00 00 00 00       	mov    $0x0,%esi
   41a91:	bf a0 f2 04 00       	mov    $0x4f2a0,%edi
   41a96:	e8 47 18 00 00       	callq  432e2 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41a9b:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41aa2:	eb 30                	jmp    41ad4 <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41aa4:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   41aa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41aac:	48 c1 e0 04          	shl    $0x4,%rax
   41ab0:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41ab6:	48 89 d1             	mov    %rdx,%rcx
   41ab9:	ba 00 00 00 00       	mov    $0x0,%edx
   41abe:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41ac5:	0e 00 00 
   41ac8:	48 89 c7             	mov    %rax,%rdi
   41acb:	e8 66 fe ff ff       	callq  41936 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41ad0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41ad4:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41adb:	76 c7                	jbe    41aa4 <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41add:	b8 36 00 04 00       	mov    $0x40036,%eax
   41ae2:	48 89 c1             	mov    %rax,%rcx
   41ae5:	ba 00 00 00 00       	mov    $0x0,%edx
   41aea:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41af1:	0e 00 00 
   41af4:	48 89 c6             	mov    %rax,%rsi
   41af7:	bf a0 f4 04 00       	mov    $0x4f4a0,%edi
   41afc:	e8 35 fe ff ff       	callq  41936 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41b01:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   41b06:	48 89 c1             	mov    %rax,%rcx
   41b09:	ba 00 00 00 00       	mov    $0x0,%edx
   41b0e:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41b15:	0e 00 00 
   41b18:	48 89 c6             	mov    %rax,%rsi
   41b1b:	bf 70 f3 04 00       	mov    $0x4f370,%edi
   41b20:	e8 11 fe ff ff       	callq  41936 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41b25:	b8 32 00 04 00       	mov    $0x40032,%eax
   41b2a:	48 89 c1             	mov    %rax,%rcx
   41b2d:	ba 00 00 00 00       	mov    $0x0,%edx
   41b32:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41b39:	0e 00 00 
   41b3c:	48 89 c6             	mov    %rax,%rsi
   41b3f:	bf 80 f3 04 00       	mov    $0x4f380,%edi
   41b44:	e8 ed fd ff ff       	callq  41936 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41b49:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41b50:	eb 3e                	jmp    41b90 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41b52:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b55:	83 e8 30             	sub    $0x30,%eax
   41b58:	89 c0                	mov    %eax,%eax
   41b5a:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   41b61:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41b62:	48 89 c2             	mov    %rax,%rdx
   41b65:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b68:	48 c1 e0 04          	shl    $0x4,%rax
   41b6c:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41b72:	48 89 d1             	mov    %rdx,%rcx
   41b75:	ba 03 00 00 00       	mov    $0x3,%edx
   41b7a:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41b81:	0e 00 00 
   41b84:	48 89 c7             	mov    %rax,%rdi
   41b87:	e8 aa fd ff ff       	callq  41936 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41b8c:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41b90:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41b94:	76 bc                	jbe    41b52 <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41b96:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41b9c:	b8 a0 f2 04 00       	mov    $0x4f2a0,%eax
   41ba1:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41ba5:	b8 28 00 00 00       	mov    $0x28,%eax
   41baa:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41bae:	0f 00 d8             	ltr    %ax
   41bb1:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41bb5:	0f 20 c0             	mov    %cr0,%rax
   41bb8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41bbc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41bc0:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41bc3:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41bca:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41bcd:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41bd0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41bd3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41bdb:	0f 22 c0             	mov    %rax,%cr0
}
   41bde:	90                   	nop
    lcr0(cr0);
}
   41bdf:	90                   	nop
   41be0:	c9                   	leaveq 
   41be1:	c3                   	retq   

0000000000041be2 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41be2:	55                   	push   %rbp
   41be3:	48 89 e5             	mov    %rsp,%rbp
   41be6:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41bea:	0f b7 05 0f e7 00 00 	movzwl 0xe70f(%rip),%eax        # 50300 <interrupts_enabled>
   41bf1:	f7 d0                	not    %eax
   41bf3:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41bf7:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41bfb:	0f b6 c0             	movzbl %al,%eax
   41bfe:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41c05:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c08:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41c0c:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41c0f:	ee                   	out    %al,(%dx)
}
   41c10:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41c11:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41c15:	66 c1 e8 08          	shr    $0x8,%ax
   41c19:	0f b6 c0             	movzbl %al,%eax
   41c1c:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41c23:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c26:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41c2a:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41c2d:	ee                   	out    %al,(%dx)
}
   41c2e:	90                   	nop
}
   41c2f:	90                   	nop
   41c30:	c9                   	leaveq 
   41c31:	c3                   	retq   

0000000000041c32 <interrupt_init>:

void interrupt_init(void) {
   41c32:	55                   	push   %rbp
   41c33:	48 89 e5             	mov    %rsp,%rbp
   41c36:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41c3a:	66 c7 05 bd e6 00 00 	movw   $0x0,0xe6bd(%rip)        # 50300 <interrupts_enabled>
   41c41:	00 00 
    interrupt_mask();
   41c43:	e8 9a ff ff ff       	callq  41be2 <interrupt_mask>
   41c48:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   41c4f:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c53:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   41c57:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   41c5a:	ee                   	out    %al,(%dx)
}
   41c5b:	90                   	nop
   41c5c:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   41c63:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c67:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   41c6b:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41c6e:	ee                   	out    %al,(%dx)
}
   41c6f:	90                   	nop
   41c70:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   41c77:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c7b:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   41c7f:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   41c82:	ee                   	out    %al,(%dx)
}
   41c83:	90                   	nop
   41c84:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   41c8b:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c8f:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   41c93:	8b 55 bc             	mov    -0x44(%rbp),%edx
   41c96:	ee                   	out    %al,(%dx)
}
   41c97:	90                   	nop
   41c98:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   41c9f:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ca3:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   41ca7:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   41caa:	ee                   	out    %al,(%dx)
}
   41cab:	90                   	nop
   41cac:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   41cb3:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cb7:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   41cbb:	8b 55 cc             	mov    -0x34(%rbp),%edx
   41cbe:	ee                   	out    %al,(%dx)
}
   41cbf:	90                   	nop
   41cc0:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   41cc7:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ccb:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   41ccf:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   41cd2:	ee                   	out    %al,(%dx)
}
   41cd3:	90                   	nop
   41cd4:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   41cdb:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cdf:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   41ce3:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41ce6:	ee                   	out    %al,(%dx)
}
   41ce7:	90                   	nop
   41ce8:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   41cef:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cf3:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   41cf7:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   41cfa:	ee                   	out    %al,(%dx)
}
   41cfb:	90                   	nop
   41cfc:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   41d03:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d07:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41d0b:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41d0e:	ee                   	out    %al,(%dx)
}
   41d0f:	90                   	nop
   41d10:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   41d17:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d1b:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41d1f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41d22:	ee                   	out    %al,(%dx)
}
   41d23:	90                   	nop
   41d24:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   41d2b:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d2f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41d33:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41d36:	ee                   	out    %al,(%dx)
}
   41d37:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   41d38:	e8 a5 fe ff ff       	callq  41be2 <interrupt_mask>
}
   41d3d:	90                   	nop
   41d3e:	c9                   	leaveq 
   41d3f:	c3                   	retq   

0000000000041d40 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   41d40:	55                   	push   %rbp
   41d41:	48 89 e5             	mov    %rsp,%rbp
   41d44:	48 83 ec 28          	sub    $0x28,%rsp
   41d48:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   41d4b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41d4f:	0f 8e 9f 00 00 00    	jle    41df4 <timer_init+0xb4>
   41d55:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   41d5c:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d60:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41d64:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41d67:	ee                   	out    %al,(%dx)
}
   41d68:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   41d69:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41d6c:	89 c2                	mov    %eax,%edx
   41d6e:	c1 ea 1f             	shr    $0x1f,%edx
   41d71:	01 d0                	add    %edx,%eax
   41d73:	d1 f8                	sar    %eax
   41d75:	05 de 34 12 00       	add    $0x1234de,%eax
   41d7a:	99                   	cltd   
   41d7b:	f7 7d dc             	idivl  -0x24(%rbp)
   41d7e:	89 c2                	mov    %eax,%edx
   41d80:	89 d0                	mov    %edx,%eax
   41d82:	c1 f8 1f             	sar    $0x1f,%eax
   41d85:	c1 e8 18             	shr    $0x18,%eax
   41d88:	89 c1                	mov    %eax,%ecx
   41d8a:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   41d8d:	0f b6 c0             	movzbl %al,%eax
   41d90:	29 c8                	sub    %ecx,%eax
   41d92:	0f b6 c0             	movzbl %al,%eax
   41d95:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   41d9c:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d9f:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41da3:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41da6:	ee                   	out    %al,(%dx)
}
   41da7:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   41da8:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41dab:	89 c2                	mov    %eax,%edx
   41dad:	c1 ea 1f             	shr    $0x1f,%edx
   41db0:	01 d0                	add    %edx,%eax
   41db2:	d1 f8                	sar    %eax
   41db4:	05 de 34 12 00       	add    $0x1234de,%eax
   41db9:	99                   	cltd   
   41dba:	f7 7d dc             	idivl  -0x24(%rbp)
   41dbd:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   41dc3:	85 c0                	test   %eax,%eax
   41dc5:	0f 48 c2             	cmovs  %edx,%eax
   41dc8:	c1 f8 08             	sar    $0x8,%eax
   41dcb:	0f b6 c0             	movzbl %al,%eax
   41dce:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   41dd5:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41dd8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41ddc:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41ddf:	ee                   	out    %al,(%dx)
}
   41de0:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   41de1:	0f b7 05 18 e5 00 00 	movzwl 0xe518(%rip),%eax        # 50300 <interrupts_enabled>
   41de8:	83 c8 01             	or     $0x1,%eax
   41deb:	66 89 05 0e e5 00 00 	mov    %ax,0xe50e(%rip)        # 50300 <interrupts_enabled>
   41df2:	eb 11                	jmp    41e05 <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   41df4:	0f b7 05 05 e5 00 00 	movzwl 0xe505(%rip),%eax        # 50300 <interrupts_enabled>
   41dfb:	83 e0 fe             	and    $0xfffffffe,%eax
   41dfe:	66 89 05 fb e4 00 00 	mov    %ax,0xe4fb(%rip)        # 50300 <interrupts_enabled>
    }
    interrupt_mask();
   41e05:	e8 d8 fd ff ff       	callq  41be2 <interrupt_mask>
}
   41e0a:	90                   	nop
   41e0b:	c9                   	leaveq 
   41e0c:	c3                   	retq   

0000000000041e0d <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   41e0d:	55                   	push   %rbp
   41e0e:	48 89 e5             	mov    %rsp,%rbp
   41e11:	48 83 ec 08          	sub    $0x8,%rsp
   41e15:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41e19:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   41e1e:	74 14                	je     41e34 <physical_memory_isreserved+0x27>
   41e20:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   41e27:	00 
   41e28:	76 11                	jbe    41e3b <physical_memory_isreserved+0x2e>
   41e2a:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   41e31:	00 
   41e32:	77 07                	ja     41e3b <physical_memory_isreserved+0x2e>
   41e34:	b8 01 00 00 00       	mov    $0x1,%eax
   41e39:	eb 05                	jmp    41e40 <physical_memory_isreserved+0x33>
   41e3b:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41e40:	c9                   	leaveq 
   41e41:	c3                   	retq   

0000000000041e42 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   41e42:	55                   	push   %rbp
   41e43:	48 89 e5             	mov    %rsp,%rbp
   41e46:	48 83 ec 10          	sub    $0x10,%rsp
   41e4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
   41e4d:	89 75 f8             	mov    %esi,-0x8(%rbp)
   41e50:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   41e53:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e56:	c1 e0 10             	shl    $0x10,%eax
   41e59:	89 c2                	mov    %eax,%edx
   41e5b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41e5e:	c1 e0 0b             	shl    $0xb,%eax
   41e61:	09 c2                	or     %eax,%edx
   41e63:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41e66:	c1 e0 08             	shl    $0x8,%eax
   41e69:	09 d0                	or     %edx,%eax
}
   41e6b:	c9                   	leaveq 
   41e6c:	c3                   	retq   

0000000000041e6d <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   41e6d:	55                   	push   %rbp
   41e6e:	48 89 e5             	mov    %rsp,%rbp
   41e71:	48 83 ec 18          	sub    $0x18,%rsp
   41e75:	89 7d ec             	mov    %edi,-0x14(%rbp)
   41e78:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   41e7b:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41e7e:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41e81:	09 d0                	or     %edx,%eax
   41e83:	0d 00 00 00 80       	or     $0x80000000,%eax
   41e88:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   41e8f:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   41e92:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41e95:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41e98:	ef                   	out    %eax,(%dx)
}
   41e99:	90                   	nop
   41e9a:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   41ea1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ea4:	89 c2                	mov    %eax,%edx
   41ea6:	ed                   	in     (%dx),%eax
   41ea7:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   41eaa:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   41ead:	c9                   	leaveq 
   41eae:	c3                   	retq   

0000000000041eaf <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   41eaf:	55                   	push   %rbp
   41eb0:	48 89 e5             	mov    %rsp,%rbp
   41eb3:	48 83 ec 28          	sub    $0x28,%rsp
   41eb7:	89 7d dc             	mov    %edi,-0x24(%rbp)
   41eba:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   41ebd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41ec4:	eb 73                	jmp    41f39 <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   41ec6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41ecd:	eb 60                	jmp    41f2f <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   41ecf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41ed6:	eb 4a                	jmp    41f22 <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   41ed8:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41edb:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41ede:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ee1:	89 ce                	mov    %ecx,%esi
   41ee3:	89 c7                	mov    %eax,%edi
   41ee5:	e8 58 ff ff ff       	callq  41e42 <pci_make_configaddr>
   41eea:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   41eed:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41ef0:	be 00 00 00 00       	mov    $0x0,%esi
   41ef5:	89 c7                	mov    %eax,%edi
   41ef7:	e8 71 ff ff ff       	callq  41e6d <pci_config_readl>
   41efc:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   41eff:	8b 45 d8             	mov    -0x28(%rbp),%eax
   41f02:	c1 e0 10             	shl    $0x10,%eax
   41f05:	0b 45 dc             	or     -0x24(%rbp),%eax
   41f08:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   41f0b:	75 05                	jne    41f12 <pci_find_device+0x63>
                    return configaddr;
   41f0d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41f10:	eb 35                	jmp    41f47 <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   41f12:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   41f16:	75 06                	jne    41f1e <pci_find_device+0x6f>
   41f18:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41f1c:	74 0c                	je     41f2a <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   41f1e:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41f22:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   41f26:	75 b0                	jne    41ed8 <pci_find_device+0x29>
   41f28:	eb 01                	jmp    41f2b <pci_find_device+0x7c>
                    break;
   41f2a:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   41f2b:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41f2f:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   41f33:	75 9a                	jne    41ecf <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   41f35:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41f39:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   41f40:	75 84                	jne    41ec6 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   41f42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41f47:	c9                   	leaveq 
   41f48:	c3                   	retq   

0000000000041f49 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   41f49:	55                   	push   %rbp
   41f4a:	48 89 e5             	mov    %rsp,%rbp
   41f4d:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   41f51:	be 13 71 00 00       	mov    $0x7113,%esi
   41f56:	bf 86 80 00 00       	mov    $0x8086,%edi
   41f5b:	e8 4f ff ff ff       	callq  41eaf <pci_find_device>
   41f60:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   41f63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   41f67:	78 30                	js     41f99 <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   41f69:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41f6c:	be 40 00 00 00       	mov    $0x40,%esi
   41f71:	89 c7                	mov    %eax,%edi
   41f73:	e8 f5 fe ff ff       	callq  41e6d <pci_config_readl>
   41f78:	25 c0 ff 00 00       	and    $0xffc0,%eax
   41f7d:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   41f80:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41f83:	83 c0 04             	add    $0x4,%eax
   41f86:	89 45 f4             	mov    %eax,-0xc(%rbp)
   41f89:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   41f8f:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   41f93:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41f96:	66 ef                	out    %ax,(%dx)
}
   41f98:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   41f99:	ba 20 40 04 00       	mov    $0x44020,%edx
   41f9e:	be 00 c0 00 00       	mov    $0xc000,%esi
   41fa3:	bf 80 07 00 00       	mov    $0x780,%edi
   41fa8:	b8 00 00 00 00       	mov    $0x0,%eax
   41fad:	e8 65 1b 00 00       	callq  43b17 <console_printf>
 spinloop: goto spinloop;
   41fb2:	eb fe                	jmp    41fb2 <poweroff+0x69>

0000000000041fb4 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   41fb4:	55                   	push   %rbp
   41fb5:	48 89 e5             	mov    %rsp,%rbp
   41fb8:	48 83 ec 10          	sub    $0x10,%rsp
   41fbc:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   41fc3:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41fc7:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41fcb:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41fce:	ee                   	out    %al,(%dx)
}
   41fcf:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   41fd0:	eb fe                	jmp    41fd0 <reboot+0x1c>

0000000000041fd2 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   41fd2:	55                   	push   %rbp
   41fd3:	48 89 e5             	mov    %rsp,%rbp
   41fd6:	48 83 ec 10          	sub    $0x10,%rsp
   41fda:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41fde:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   41fe1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fe5:	48 83 c0 08          	add    $0x8,%rax
   41fe9:	ba c0 00 00 00       	mov    $0xc0,%edx
   41fee:	be 00 00 00 00       	mov    $0x0,%esi
   41ff3:	48 89 c7             	mov    %rax,%rdi
   41ff6:	e8 e7 12 00 00       	callq  432e2 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   41ffb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fff:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   42006:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   42008:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4200c:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   42013:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   42017:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4201b:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   42022:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42026:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4202a:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   42031:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   42033:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42037:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   4203e:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42042:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42045:	83 e0 01             	and    $0x1,%eax
   42048:	85 c0                	test   %eax,%eax
   4204a:	74 1c                	je     42068 <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   4204c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42050:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42057:	80 cc 30             	or     $0x30,%ah
   4205a:	48 89 c2             	mov    %rax,%rdx
   4205d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42061:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42068:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4206b:	83 e0 02             	and    $0x2,%eax
   4206e:	85 c0                	test   %eax,%eax
   42070:	74 1c                	je     4208e <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42072:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42076:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   4207d:	80 e4 fd             	and    $0xfd,%ah
   42080:	48 89 c2             	mov    %rax,%rdx
   42083:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42087:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   4208e:	90                   	nop
   4208f:	c9                   	leaveq 
   42090:	c3                   	retq   

0000000000042091 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   42091:	55                   	push   %rbp
   42092:	48 89 e5             	mov    %rsp,%rbp
   42095:	48 83 ec 28          	sub    $0x28,%rsp
   42099:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4209c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   420a0:	78 09                	js     420ab <console_show_cursor+0x1a>
   420a2:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   420a9:	7e 07                	jle    420b2 <console_show_cursor+0x21>
        cpos = 0;
   420ab:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   420b2:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   420b9:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420bd:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   420c1:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   420c4:	ee                   	out    %al,(%dx)
}
   420c5:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   420c6:	8b 45 dc             	mov    -0x24(%rbp),%eax
   420c9:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   420cf:	85 c0                	test   %eax,%eax
   420d1:	0f 48 c2             	cmovs  %edx,%eax
   420d4:	c1 f8 08             	sar    $0x8,%eax
   420d7:	0f b6 c0             	movzbl %al,%eax
   420da:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   420e1:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420e4:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   420e8:	8b 55 ec             	mov    -0x14(%rbp),%edx
   420eb:	ee                   	out    %al,(%dx)
}
   420ec:	90                   	nop
   420ed:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   420f4:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420f8:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   420fc:	8b 55 f4             	mov    -0xc(%rbp),%edx
   420ff:	ee                   	out    %al,(%dx)
}
   42100:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   42101:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42104:	99                   	cltd   
   42105:	c1 ea 18             	shr    $0x18,%edx
   42108:	01 d0                	add    %edx,%eax
   4210a:	0f b6 c0             	movzbl %al,%eax
   4210d:	29 d0                	sub    %edx,%eax
   4210f:	0f b6 c0             	movzbl %al,%eax
   42112:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42119:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4211c:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42120:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42123:	ee                   	out    %al,(%dx)
}
   42124:	90                   	nop
}
   42125:	90                   	nop
   42126:	c9                   	leaveq 
   42127:	c3                   	retq   

0000000000042128 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42128:	55                   	push   %rbp
   42129:	48 89 e5             	mov    %rsp,%rbp
   4212c:	48 83 ec 20          	sub    $0x20,%rsp
   42130:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42137:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4213a:	89 c2                	mov    %eax,%edx
   4213c:	ec                   	in     (%dx),%al
   4213d:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42140:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42144:	0f b6 c0             	movzbl %al,%eax
   42147:	83 e0 01             	and    $0x1,%eax
   4214a:	85 c0                	test   %eax,%eax
   4214c:	75 0a                	jne    42158 <keyboard_readc+0x30>
        return -1;
   4214e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42153:	e9 e7 01 00 00       	jmpq   4233f <keyboard_readc+0x217>
   42158:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4215f:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42162:	89 c2                	mov    %eax,%edx
   42164:	ec                   	in     (%dx),%al
   42165:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   42168:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   4216c:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   4216f:	0f b6 05 8c e1 00 00 	movzbl 0xe18c(%rip),%eax        # 50302 <last_escape.2>
   42176:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   42179:	c6 05 82 e1 00 00 00 	movb   $0x0,0xe182(%rip)        # 50302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42180:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42184:	75 11                	jne    42197 <keyboard_readc+0x6f>
        last_escape = 0x80;
   42186:	c6 05 75 e1 00 00 80 	movb   $0x80,0xe175(%rip)        # 50302 <last_escape.2>
        return 0;
   4218d:	b8 00 00 00 00       	mov    $0x0,%eax
   42192:	e9 a8 01 00 00       	jmpq   4233f <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42197:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4219b:	84 c0                	test   %al,%al
   4219d:	79 60                	jns    421ff <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   4219f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   421a3:	83 e0 7f             	and    $0x7f,%eax
   421a6:	89 c2                	mov    %eax,%edx
   421a8:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   421ac:	09 d0                	or     %edx,%eax
   421ae:	48 98                	cltq   
   421b0:	0f b6 80 40 40 04 00 	movzbl 0x44040(%rax),%eax
   421b7:	0f b6 c0             	movzbl %al,%eax
   421ba:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   421bd:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   421c4:	7e 2f                	jle    421f5 <keyboard_readc+0xcd>
   421c6:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   421cd:	7f 26                	jg     421f5 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   421cf:	8b 45 f4             	mov    -0xc(%rbp),%eax
   421d2:	2d fa 00 00 00       	sub    $0xfa,%eax
   421d7:	ba 01 00 00 00       	mov    $0x1,%edx
   421dc:	89 c1                	mov    %eax,%ecx
   421de:	d3 e2                	shl    %cl,%edx
   421e0:	89 d0                	mov    %edx,%eax
   421e2:	f7 d0                	not    %eax
   421e4:	89 c2                	mov    %eax,%edx
   421e6:	0f b6 05 16 e1 00 00 	movzbl 0xe116(%rip),%eax        # 50303 <modifiers.1>
   421ed:	21 d0                	and    %edx,%eax
   421ef:	88 05 0e e1 00 00    	mov    %al,0xe10e(%rip)        # 50303 <modifiers.1>
        }
        return 0;
   421f5:	b8 00 00 00 00       	mov    $0x0,%eax
   421fa:	e9 40 01 00 00       	jmpq   4233f <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   421ff:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42203:	0a 45 fa             	or     -0x6(%rbp),%al
   42206:	0f b6 c0             	movzbl %al,%eax
   42209:	48 98                	cltq   
   4220b:	0f b6 80 40 40 04 00 	movzbl 0x44040(%rax),%eax
   42212:	0f b6 c0             	movzbl %al,%eax
   42215:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42218:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   4221c:	7e 57                	jle    42275 <keyboard_readc+0x14d>
   4221e:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   42222:	7f 51                	jg     42275 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   42224:	0f b6 05 d8 e0 00 00 	movzbl 0xe0d8(%rip),%eax        # 50303 <modifiers.1>
   4222b:	0f b6 c0             	movzbl %al,%eax
   4222e:	83 e0 02             	and    $0x2,%eax
   42231:	85 c0                	test   %eax,%eax
   42233:	74 09                	je     4223e <keyboard_readc+0x116>
            ch -= 0x60;
   42235:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42239:	e9 fd 00 00 00       	jmpq   4233b <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   4223e:	0f b6 05 be e0 00 00 	movzbl 0xe0be(%rip),%eax        # 50303 <modifiers.1>
   42245:	0f b6 c0             	movzbl %al,%eax
   42248:	83 e0 01             	and    $0x1,%eax
   4224b:	85 c0                	test   %eax,%eax
   4224d:	0f 94 c2             	sete   %dl
   42250:	0f b6 05 ac e0 00 00 	movzbl 0xe0ac(%rip),%eax        # 50303 <modifiers.1>
   42257:	0f b6 c0             	movzbl %al,%eax
   4225a:	83 e0 08             	and    $0x8,%eax
   4225d:	85 c0                	test   %eax,%eax
   4225f:	0f 94 c0             	sete   %al
   42262:	31 d0                	xor    %edx,%eax
   42264:	84 c0                	test   %al,%al
   42266:	0f 84 cf 00 00 00    	je     4233b <keyboard_readc+0x213>
            ch -= 0x20;
   4226c:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42270:	e9 c6 00 00 00       	jmpq   4233b <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42275:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   4227c:	7e 30                	jle    422ae <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   4227e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42281:	2d fa 00 00 00       	sub    $0xfa,%eax
   42286:	ba 01 00 00 00       	mov    $0x1,%edx
   4228b:	89 c1                	mov    %eax,%ecx
   4228d:	d3 e2                	shl    %cl,%edx
   4228f:	89 d0                	mov    %edx,%eax
   42291:	89 c2                	mov    %eax,%edx
   42293:	0f b6 05 69 e0 00 00 	movzbl 0xe069(%rip),%eax        # 50303 <modifiers.1>
   4229a:	31 d0                	xor    %edx,%eax
   4229c:	88 05 61 e0 00 00    	mov    %al,0xe061(%rip)        # 50303 <modifiers.1>
        ch = 0;
   422a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   422a9:	e9 8e 00 00 00       	jmpq   4233c <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   422ae:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   422b5:	7e 2d                	jle    422e4 <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   422b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422ba:	2d fa 00 00 00       	sub    $0xfa,%eax
   422bf:	ba 01 00 00 00       	mov    $0x1,%edx
   422c4:	89 c1                	mov    %eax,%ecx
   422c6:	d3 e2                	shl    %cl,%edx
   422c8:	89 d0                	mov    %edx,%eax
   422ca:	89 c2                	mov    %eax,%edx
   422cc:	0f b6 05 30 e0 00 00 	movzbl 0xe030(%rip),%eax        # 50303 <modifiers.1>
   422d3:	09 d0                	or     %edx,%eax
   422d5:	88 05 28 e0 00 00    	mov    %al,0xe028(%rip)        # 50303 <modifiers.1>
        ch = 0;
   422db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   422e2:	eb 58                	jmp    4233c <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   422e4:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   422e8:	7e 31                	jle    4231b <keyboard_readc+0x1f3>
   422ea:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   422f1:	7f 28                	jg     4231b <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   422f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422f6:	8d 50 80             	lea    -0x80(%rax),%edx
   422f9:	0f b6 05 03 e0 00 00 	movzbl 0xe003(%rip),%eax        # 50303 <modifiers.1>
   42300:	0f b6 c0             	movzbl %al,%eax
   42303:	83 e0 03             	and    $0x3,%eax
   42306:	48 98                	cltq   
   42308:	48 63 d2             	movslq %edx,%rdx
   4230b:	0f b6 84 90 40 41 04 	movzbl 0x44140(%rax,%rdx,4),%eax
   42312:	00 
   42313:	0f b6 c0             	movzbl %al,%eax
   42316:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42319:	eb 21                	jmp    4233c <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   4231b:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   4231f:	7f 1b                	jg     4233c <keyboard_readc+0x214>
   42321:	0f b6 05 db df 00 00 	movzbl 0xdfdb(%rip),%eax        # 50303 <modifiers.1>
   42328:	0f b6 c0             	movzbl %al,%eax
   4232b:	83 e0 02             	and    $0x2,%eax
   4232e:	85 c0                	test   %eax,%eax
   42330:	74 0a                	je     4233c <keyboard_readc+0x214>
        ch = 0;
   42332:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42339:	eb 01                	jmp    4233c <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   4233b:	90                   	nop
    }

    return ch;
   4233c:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   4233f:	c9                   	leaveq 
   42340:	c3                   	retq   

0000000000042341 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   42341:	55                   	push   %rbp
   42342:	48 89 e5             	mov    %rsp,%rbp
   42345:	48 83 ec 20          	sub    $0x20,%rsp
   42349:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42350:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42353:	89 c2                	mov    %eax,%edx
   42355:	ec                   	in     (%dx),%al
   42356:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42359:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42360:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42363:	89 c2                	mov    %eax,%edx
   42365:	ec                   	in     (%dx),%al
   42366:	88 45 eb             	mov    %al,-0x15(%rbp)
   42369:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42370:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42373:	89 c2                	mov    %eax,%edx
   42375:	ec                   	in     (%dx),%al
   42376:	88 45 f3             	mov    %al,-0xd(%rbp)
   42379:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42380:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42383:	89 c2                	mov    %eax,%edx
   42385:	ec                   	in     (%dx),%al
   42386:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42389:	90                   	nop
   4238a:	c9                   	leaveq 
   4238b:	c3                   	retq   

000000000004238c <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   4238c:	55                   	push   %rbp
   4238d:	48 89 e5             	mov    %rsp,%rbp
   42390:	48 83 ec 40          	sub    $0x40,%rsp
   42394:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42398:	89 f0                	mov    %esi,%eax
   4239a:	89 55 c0             	mov    %edx,-0x40(%rbp)
   4239d:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   423a0:	8b 05 5e df 00 00    	mov    0xdf5e(%rip),%eax        # 50304 <initialized.0>
   423a6:	85 c0                	test   %eax,%eax
   423a8:	75 1e                	jne    423c8 <parallel_port_putc+0x3c>
   423aa:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   423b1:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   423b5:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   423b9:	8b 55 f8             	mov    -0x8(%rbp),%edx
   423bc:	ee                   	out    %al,(%dx)
}
   423bd:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   423be:	c7 05 3c df 00 00 01 	movl   $0x1,0xdf3c(%rip)        # 50304 <initialized.0>
   423c5:	00 00 00 
    }

    for (int i = 0;
   423c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   423cf:	eb 09                	jmp    423da <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   423d1:	e8 6b ff ff ff       	callq  42341 <delay>
         ++i) {
   423d6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   423da:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   423e1:	7f 18                	jg     423fb <parallel_port_putc+0x6f>
   423e3:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   423ea:	8b 45 f0             	mov    -0x10(%rbp),%eax
   423ed:	89 c2                	mov    %eax,%edx
   423ef:	ec                   	in     (%dx),%al
   423f0:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   423f3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   423f7:	84 c0                	test   %al,%al
   423f9:	79 d6                	jns    423d1 <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   423fb:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   423ff:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42406:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42409:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   4240d:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42410:	ee                   	out    %al,(%dx)
}
   42411:	90                   	nop
   42412:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42419:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4241d:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42421:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42424:	ee                   	out    %al,(%dx)
}
   42425:	90                   	nop
   42426:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   4242d:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42431:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42435:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42438:	ee                   	out    %al,(%dx)
}
   42439:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   4243a:	90                   	nop
   4243b:	c9                   	leaveq 
   4243c:	c3                   	retq   

000000000004243d <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   4243d:	55                   	push   %rbp
   4243e:	48 89 e5             	mov    %rsp,%rbp
   42441:	48 83 ec 20          	sub    $0x20,%rsp
   42445:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42449:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   4244d:	48 c7 45 f8 8c 23 04 	movq   $0x4238c,-0x8(%rbp)
   42454:	00 
    printer_vprintf(&p, 0, format, val);
   42455:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42459:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4245d:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42461:	be 00 00 00 00       	mov    $0x0,%esi
   42466:	48 89 c7             	mov    %rax,%rdi
   42469:	e8 85 0f 00 00       	callq  433f3 <printer_vprintf>
}
   4246e:	90                   	nop
   4246f:	c9                   	leaveq 
   42470:	c3                   	retq   

0000000000042471 <log_printf>:

void log_printf(const char* format, ...) {
   42471:	55                   	push   %rbp
   42472:	48 89 e5             	mov    %rsp,%rbp
   42475:	48 83 ec 60          	sub    $0x60,%rsp
   42479:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   4247d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42481:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42485:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42489:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4248d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42491:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42498:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4249c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   424a0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   424a4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   424a8:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   424ac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   424b0:	48 89 d6             	mov    %rdx,%rsi
   424b3:	48 89 c7             	mov    %rax,%rdi
   424b6:	e8 82 ff ff ff       	callq  4243d <log_vprintf>
    va_end(val);
}
   424bb:	90                   	nop
   424bc:	c9                   	leaveq 
   424bd:	c3                   	retq   

00000000000424be <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   424be:	55                   	push   %rbp
   424bf:	48 89 e5             	mov    %rsp,%rbp
   424c2:	48 83 ec 40          	sub    $0x40,%rsp
   424c6:	89 7d dc             	mov    %edi,-0x24(%rbp)
   424c9:	89 75 d8             	mov    %esi,-0x28(%rbp)
   424cc:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   424d0:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   424d4:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   424d8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   424dc:	48 8b 0a             	mov    (%rdx),%rcx
   424df:	48 89 08             	mov    %rcx,(%rax)
   424e2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   424e6:	48 89 48 08          	mov    %rcx,0x8(%rax)
   424ea:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   424ee:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   424f2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   424f6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   424fa:	48 89 d6             	mov    %rdx,%rsi
   424fd:	48 89 c7             	mov    %rax,%rdi
   42500:	e8 38 ff ff ff       	callq  4243d <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42505:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42509:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   4250d:	8b 75 d8             	mov    -0x28(%rbp),%esi
   42510:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42513:	89 c7                	mov    %eax,%edi
   42515:	e8 b8 15 00 00       	callq  43ad2 <console_vprintf>
}
   4251a:	c9                   	leaveq 
   4251b:	c3                   	retq   

000000000004251c <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   4251c:	55                   	push   %rbp
   4251d:	48 89 e5             	mov    %rsp,%rbp
   42520:	48 83 ec 60          	sub    $0x60,%rsp
   42524:	89 7d ac             	mov    %edi,-0x54(%rbp)
   42527:	89 75 a8             	mov    %esi,-0x58(%rbp)
   4252a:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   4252e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42532:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42536:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4253a:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42541:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42545:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42549:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4254d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42551:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42555:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   42559:	8b 75 a8             	mov    -0x58(%rbp),%esi
   4255c:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4255f:	89 c7                	mov    %eax,%edi
   42561:	e8 58 ff ff ff       	callq  424be <error_vprintf>
   42566:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   42569:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   4256c:	c9                   	leaveq 
   4256d:	c3                   	retq   

000000000004256e <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   4256e:	55                   	push   %rbp
   4256f:	48 89 e5             	mov    %rsp,%rbp
   42572:	53                   	push   %rbx
   42573:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   42577:	e8 ac fb ff ff       	callq  42128 <keyboard_readc>
   4257c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   4257f:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42583:	74 1c                	je     425a1 <check_keyboard+0x33>
   42585:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   42589:	74 16                	je     425a1 <check_keyboard+0x33>
   4258b:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   4258f:	74 10                	je     425a1 <check_keyboard+0x33>
   42591:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42595:	74 0a                	je     425a1 <check_keyboard+0x33>
   42597:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4259b:	0f 85 e9 00 00 00    	jne    4268a <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   425a1:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   425a8:	00 
        memset(pt, 0, PAGESIZE * 3);
   425a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   425ad:	ba 00 30 00 00       	mov    $0x3000,%edx
   425b2:	be 00 00 00 00       	mov    $0x0,%esi
   425b7:	48 89 c7             	mov    %rax,%rdi
   425ba:	e8 23 0d 00 00       	callq  432e2 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   425bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   425c3:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   425ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   425ce:	48 05 00 10 00 00    	add    $0x1000,%rax
   425d4:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   425db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   425df:	48 05 00 20 00 00    	add    $0x2000,%rax
   425e5:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   425ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   425f0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   425f4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   425f8:	0f 22 d8             	mov    %rax,%cr3
}
   425fb:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   425fc:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42603:	48 c7 45 e8 98 41 04 	movq   $0x44198,-0x18(%rbp)
   4260a:	00 
        if (c == 'a') {
   4260b:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   4260f:	75 0a                	jne    4261b <check_keyboard+0xad>
            argument = "allocator";
   42611:	48 c7 45 e8 9d 41 04 	movq   $0x4419d,-0x18(%rbp)
   42618:	00 
   42619:	eb 2e                	jmp    42649 <check_keyboard+0xdb>
        } else if (c == 'e') {
   4261b:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   4261f:	75 0a                	jne    4262b <check_keyboard+0xbd>
            argument = "forkexit";
   42621:	48 c7 45 e8 a7 41 04 	movq   $0x441a7,-0x18(%rbp)
   42628:	00 
   42629:	eb 1e                	jmp    42649 <check_keyboard+0xdb>
        }
        else if (c == 't'){
   4262b:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   4262f:	75 0a                	jne    4263b <check_keyboard+0xcd>
            argument = "test";
   42631:	48 c7 45 e8 b0 41 04 	movq   $0x441b0,-0x18(%rbp)
   42638:	00 
   42639:	eb 0e                	jmp    42649 <check_keyboard+0xdb>
        }
        else if(c == '2'){
   4263b:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4263f:	75 08                	jne    42649 <check_keyboard+0xdb>
            argument = "test2";
   42641:	48 c7 45 e8 b5 41 04 	movq   $0x441b5,-0x18(%rbp)
   42648:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   42649:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4264d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   42651:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42656:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   4265a:	76 14                	jbe    42670 <check_keyboard+0x102>
   4265c:	ba bb 41 04 00       	mov    $0x441bb,%edx
   42661:	be 5c 02 00 00       	mov    $0x25c,%esi
   42666:	bf d7 41 04 00       	mov    $0x441d7,%edi
   4266b:	e8 1f 01 00 00       	callq  4278f <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42670:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42674:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42677:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   4267b:	48 89 c3             	mov    %rax,%rbx
   4267e:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42683:	e9 78 d9 ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42688:	eb 11                	jmp    4269b <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   4268a:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   4268e:	74 06                	je     42696 <check_keyboard+0x128>
   42690:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42694:	75 05                	jne    4269b <check_keyboard+0x12d>
        poweroff();
   42696:	e8 ae f8 ff ff       	callq  41f49 <poweroff>
    }
    return c;
   4269b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   4269e:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   426a2:	c9                   	leaveq 
   426a3:	c3                   	retq   

00000000000426a4 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   426a4:	55                   	push   %rbp
   426a5:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   426a8:	e8 c1 fe ff ff       	callq  4256e <check_keyboard>
   426ad:	eb f9                	jmp    426a8 <fail+0x4>

00000000000426af <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   426af:	55                   	push   %rbp
   426b0:	48 89 e5             	mov    %rsp,%rbp
   426b3:	48 83 ec 60          	sub    $0x60,%rsp
   426b7:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   426bb:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   426bf:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   426c3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   426c7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   426cb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   426cf:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   426d6:	48 8d 45 10          	lea    0x10(%rbp),%rax
   426da:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   426de:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   426e2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   426e6:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   426eb:	0f 84 80 00 00 00    	je     42771 <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   426f1:	ba e4 41 04 00       	mov    $0x441e4,%edx
   426f6:	be 00 c0 00 00       	mov    $0xc000,%esi
   426fb:	bf 30 07 00 00       	mov    $0x730,%edi
   42700:	b8 00 00 00 00       	mov    $0x0,%eax
   42705:	e8 12 fe ff ff       	callq  4251c <error_printf>
   4270a:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   4270d:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42711:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42715:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42718:	be 00 c0 00 00       	mov    $0xc000,%esi
   4271d:	89 c7                	mov    %eax,%edi
   4271f:	e8 9a fd ff ff       	callq  424be <error_vprintf>
   42724:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42727:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   4272a:	48 63 c1             	movslq %ecx,%rax
   4272d:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42734:	48 c1 e8 20          	shr    $0x20,%rax
   42738:	c1 f8 05             	sar    $0x5,%eax
   4273b:	89 ce                	mov    %ecx,%esi
   4273d:	c1 fe 1f             	sar    $0x1f,%esi
   42740:	29 f0                	sub    %esi,%eax
   42742:	89 c2                	mov    %eax,%edx
   42744:	89 d0                	mov    %edx,%eax
   42746:	c1 e0 02             	shl    $0x2,%eax
   42749:	01 d0                	add    %edx,%eax
   4274b:	c1 e0 04             	shl    $0x4,%eax
   4274e:	29 c1                	sub    %eax,%ecx
   42750:	89 ca                	mov    %ecx,%edx
   42752:	85 d2                	test   %edx,%edx
   42754:	74 34                	je     4278a <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   42756:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42759:	ba ec 41 04 00       	mov    $0x441ec,%edx
   4275e:	be 00 c0 00 00       	mov    $0xc000,%esi
   42763:	89 c7                	mov    %eax,%edi
   42765:	b8 00 00 00 00       	mov    $0x0,%eax
   4276a:	e8 ad fd ff ff       	callq  4251c <error_printf>
   4276f:	eb 19                	jmp    4278a <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42771:	ba ee 41 04 00       	mov    $0x441ee,%edx
   42776:	be 00 c0 00 00       	mov    $0xc000,%esi
   4277b:	bf 30 07 00 00       	mov    $0x730,%edi
   42780:	b8 00 00 00 00       	mov    $0x0,%eax
   42785:	e8 92 fd ff ff       	callq  4251c <error_printf>
    }

    va_end(val);
    fail();
   4278a:	e8 15 ff ff ff       	callq  426a4 <fail>

000000000004278f <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   4278f:	55                   	push   %rbp
   42790:	48 89 e5             	mov    %rsp,%rbp
   42793:	48 83 ec 20          	sub    $0x20,%rsp
   42797:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4279b:	89 75 f4             	mov    %esi,-0xc(%rbp)
   4279e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   427a2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   427a6:	8b 55 f4             	mov    -0xc(%rbp),%edx
   427a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427ad:	48 89 c6             	mov    %rax,%rsi
   427b0:	bf f4 41 04 00       	mov    $0x441f4,%edi
   427b5:	b8 00 00 00 00       	mov    $0x0,%eax
   427ba:	e8 f0 fe ff ff       	callq  426af <panic>

00000000000427bf <default_exception>:
}

void default_exception(proc* p){
   427bf:	55                   	push   %rbp
   427c0:	48 89 e5             	mov    %rsp,%rbp
   427c3:	48 83 ec 20          	sub    $0x20,%rsp
   427c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   427cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   427cf:	48 83 c0 08          	add    $0x8,%rax
   427d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   427d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427db:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   427e2:	48 89 c6             	mov    %rax,%rsi
   427e5:	bf 12 42 04 00       	mov    $0x44212,%edi
   427ea:	b8 00 00 00 00       	mov    $0x0,%eax
   427ef:	e8 bb fe ff ff       	callq  426af <panic>

00000000000427f4 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   427f4:	55                   	push   %rbp
   427f5:	48 89 e5             	mov    %rsp,%rbp
   427f8:	48 83 ec 10          	sub    $0x10,%rsp
   427fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42800:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42803:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42807:	78 06                	js     4280f <pageindex+0x1b>
   42809:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   4280d:	7e 14                	jle    42823 <pageindex+0x2f>
   4280f:	ba 30 42 04 00       	mov    $0x44230,%edx
   42814:	be 1e 00 00 00       	mov    $0x1e,%esi
   42819:	bf 49 42 04 00       	mov    $0x44249,%edi
   4281e:	e8 6c ff ff ff       	callq  4278f <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42823:	b8 03 00 00 00       	mov    $0x3,%eax
   42828:	2b 45 f4             	sub    -0xc(%rbp),%eax
   4282b:	89 c2                	mov    %eax,%edx
   4282d:	89 d0                	mov    %edx,%eax
   4282f:	c1 e0 03             	shl    $0x3,%eax
   42832:	01 d0                	add    %edx,%eax
   42834:	83 c0 0c             	add    $0xc,%eax
   42837:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4283b:	89 c1                	mov    %eax,%ecx
   4283d:	48 d3 ea             	shr    %cl,%rdx
   42840:	48 89 d0             	mov    %rdx,%rax
   42843:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   42848:	c9                   	leaveq 
   42849:	c3                   	retq   

000000000004284a <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   4284a:	55                   	push   %rbp
   4284b:	48 89 e5             	mov    %rsp,%rbp
   4284e:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   42852:	48 c7 05 a3 e7 00 00 	movq   $0x52000,0xe7a3(%rip)        # 51000 <kernel_pagetable>
   42859:	00 20 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   4285d:	ba 00 50 00 00       	mov    $0x5000,%edx
   42862:	be 00 00 00 00       	mov    $0x0,%esi
   42867:	bf 00 20 05 00       	mov    $0x52000,%edi
   4286c:	e8 71 0a 00 00       	callq  432e2 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   42871:	b8 00 30 05 00       	mov    $0x53000,%eax
   42876:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   4287a:	48 89 05 7f f7 00 00 	mov    %rax,0xf77f(%rip)        # 52000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   42881:	b8 00 40 05 00       	mov    $0x54000,%eax
   42886:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   4288a:	48 89 05 6f 07 01 00 	mov    %rax,0x1076f(%rip)        # 53000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42891:	b8 00 50 05 00       	mov    $0x55000,%eax
   42896:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   4289a:	48 89 05 5f 17 01 00 	mov    %rax,0x1175f(%rip)        # 54000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   428a1:	b8 00 60 05 00       	mov    $0x56000,%eax
   428a6:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   428aa:	48 89 05 57 17 01 00 	mov    %rax,0x11757(%rip)        # 54008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   428b1:	48 8b 05 48 e7 00 00 	mov    0xe748(%rip),%rax        # 51000 <kernel_pagetable>
   428b8:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   428be:	b9 00 00 20 00       	mov    $0x200000,%ecx
   428c3:	ba 00 00 00 00       	mov    $0x0,%edx
   428c8:	be 00 00 00 00       	mov    $0x0,%esi
   428cd:	48 89 c7             	mov    %rax,%rdi
   428d0:	e8 b9 01 00 00       	callq  42a8e <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   428d5:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   428dc:	00 
   428dd:	eb 62                	jmp    42941 <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   428df:	48 8b 0d 1a e7 00 00 	mov    0xe71a(%rip),%rcx        # 51000 <kernel_pagetable>
   428e6:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   428ea:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   428ee:	48 89 ce             	mov    %rcx,%rsi
   428f1:	48 89 c7             	mov    %rax,%rdi
   428f4:	e8 50 05 00 00       	callq  42e49 <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   428f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   428fd:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42901:	74 14                	je     42917 <virtual_memory_init+0xcd>
   42903:	ba 52 42 04 00       	mov    $0x44252,%edx
   42908:	be 2d 00 00 00       	mov    $0x2d,%esi
   4290d:	bf 62 42 04 00       	mov    $0x44262,%edi
   42912:	e8 78 fe ff ff       	callq  4278f <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   42917:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4291a:	48 98                	cltq   
   4291c:	83 e0 03             	and    $0x3,%eax
   4291f:	48 83 f8 03          	cmp    $0x3,%rax
   42923:	74 14                	je     42939 <virtual_memory_init+0xef>
   42925:	ba 68 42 04 00       	mov    $0x44268,%edx
   4292a:	be 2e 00 00 00       	mov    $0x2e,%esi
   4292f:	bf 62 42 04 00       	mov    $0x44262,%edi
   42934:	e8 56 fe ff ff       	callq  4278f <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42939:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42940:	00 
   42941:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   42948:	00 
   42949:	76 94                	jbe    428df <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   4294b:	48 8b 05 ae e6 00 00 	mov    0xe6ae(%rip),%rax        # 51000 <kernel_pagetable>
   42952:	48 89 c7             	mov    %rax,%rdi
   42955:	e8 03 00 00 00       	callq  4295d <set_pagetable>
}
   4295a:	90                   	nop
   4295b:	c9                   	leaveq 
   4295c:	c3                   	retq   

000000000004295d <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   4295d:	55                   	push   %rbp
   4295e:	48 89 e5             	mov    %rsp,%rbp
   42961:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42965:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42969:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   4296d:	25 ff 0f 00 00       	and    $0xfff,%eax
   42972:	48 85 c0             	test   %rax,%rax
   42975:	74 14                	je     4298b <set_pagetable+0x2e>
   42977:	ba 95 42 04 00       	mov    $0x44295,%edx
   4297c:	be 3d 00 00 00       	mov    $0x3d,%esi
   42981:	bf 62 42 04 00       	mov    $0x44262,%edi
   42986:	e8 04 fe ff ff       	callq  4278f <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   4298b:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42990:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   42994:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42998:	48 89 ce             	mov    %rcx,%rsi
   4299b:	48 89 c7             	mov    %rax,%rdi
   4299e:	e8 a6 04 00 00       	callq  42e49 <virtual_memory_lookup>
   429a3:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   429a7:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   429ac:	48 39 d0             	cmp    %rdx,%rax
   429af:	74 14                	je     429c5 <set_pagetable+0x68>
   429b1:	ba b0 42 04 00       	mov    $0x442b0,%edx
   429b6:	be 3f 00 00 00       	mov    $0x3f,%esi
   429bb:	bf 62 42 04 00       	mov    $0x44262,%edi
   429c0:	e8 ca fd ff ff       	callq  4278f <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   429c5:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   429c9:	48 8b 0d 30 e6 00 00 	mov    0xe630(%rip),%rcx        # 51000 <kernel_pagetable>
   429d0:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   429d4:	48 89 ce             	mov    %rcx,%rsi
   429d7:	48 89 c7             	mov    %rax,%rdi
   429da:	e8 6a 04 00 00       	callq  42e49 <virtual_memory_lookup>
   429df:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   429e3:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   429e7:	48 39 c2             	cmp    %rax,%rdx
   429ea:	74 14                	je     42a00 <set_pagetable+0xa3>
   429ec:	ba 18 43 04 00       	mov    $0x44318,%edx
   429f1:	be 41 00 00 00       	mov    $0x41,%esi
   429f6:	bf 62 42 04 00       	mov    $0x44262,%edi
   429fb:	e8 8f fd ff ff       	callq  4278f <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42a00:	48 8b 05 f9 e5 00 00 	mov    0xe5f9(%rip),%rax        # 51000 <kernel_pagetable>
   42a07:	48 89 c2             	mov    %rax,%rdx
   42a0a:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42a0e:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a12:	48 89 ce             	mov    %rcx,%rsi
   42a15:	48 89 c7             	mov    %rax,%rdi
   42a18:	e8 2c 04 00 00       	callq  42e49 <virtual_memory_lookup>
   42a1d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42a21:	48 8b 15 d8 e5 00 00 	mov    0xe5d8(%rip),%rdx        # 51000 <kernel_pagetable>
   42a28:	48 39 d0             	cmp    %rdx,%rax
   42a2b:	74 14                	je     42a41 <set_pagetable+0xe4>
   42a2d:	ba 78 43 04 00       	mov    $0x44378,%edx
   42a32:	be 43 00 00 00       	mov    $0x43,%esi
   42a37:	bf 62 42 04 00       	mov    $0x44262,%edi
   42a3c:	e8 4e fd ff ff       	callq  4278f <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   42a41:	ba 8e 2a 04 00       	mov    $0x42a8e,%edx
   42a46:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42a4a:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a4e:	48 89 ce             	mov    %rcx,%rsi
   42a51:	48 89 c7             	mov    %rax,%rdi
   42a54:	e8 f0 03 00 00       	callq  42e49 <virtual_memory_lookup>
   42a59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42a5d:	ba 8e 2a 04 00       	mov    $0x42a8e,%edx
   42a62:	48 39 d0             	cmp    %rdx,%rax
   42a65:	74 14                	je     42a7b <set_pagetable+0x11e>
   42a67:	ba e0 43 04 00       	mov    $0x443e0,%edx
   42a6c:	be 45 00 00 00       	mov    $0x45,%esi
   42a71:	bf 62 42 04 00       	mov    $0x44262,%edi
   42a76:	e8 14 fd ff ff       	callq  4278f <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   42a7b:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42a7f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42a83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42a87:	0f 22 d8             	mov    %rax,%cr3
}
   42a8a:	90                   	nop
}
   42a8b:	90                   	nop
   42a8c:	c9                   	leaveq 
   42a8d:	c3                   	retq   

0000000000042a8e <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   42a8e:	55                   	push   %rbp
   42a8f:	48 89 e5             	mov    %rsp,%rbp
   42a92:	53                   	push   %rbx
   42a93:	48 83 ec 58          	sub    $0x58,%rsp
   42a97:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42a9b:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42a9f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42aa3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42aa7:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42aab:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42aaf:	25 ff 0f 00 00       	and    $0xfff,%eax
   42ab4:	48 85 c0             	test   %rax,%rax
   42ab7:	74 14                	je     42acd <virtual_memory_map+0x3f>
   42ab9:	ba 46 44 04 00       	mov    $0x44446,%edx
   42abe:	be 63 00 00 00       	mov    $0x63,%esi
   42ac3:	bf 62 42 04 00       	mov    $0x44262,%edi
   42ac8:	e8 c2 fc ff ff       	callq  4278f <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   42acd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42ad1:	25 ff 0f 00 00       	and    $0xfff,%eax
   42ad6:	48 85 c0             	test   %rax,%rax
   42ad9:	74 14                	je     42aef <virtual_memory_map+0x61>
   42adb:	ba 59 44 04 00       	mov    $0x44459,%edx
   42ae0:	be 64 00 00 00       	mov    $0x64,%esi
   42ae5:	bf 62 42 04 00       	mov    $0x44262,%edi
   42aea:	e8 a0 fc ff ff       	callq  4278f <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42aef:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42af3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42af7:	48 01 d0             	add    %rdx,%rax
   42afa:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42afe:	76 24                	jbe    42b24 <virtual_memory_map+0x96>
   42b00:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42b04:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b08:	48 01 d0             	add    %rdx,%rax
   42b0b:	48 85 c0             	test   %rax,%rax
   42b0e:	74 14                	je     42b24 <virtual_memory_map+0x96>
   42b10:	ba 6c 44 04 00       	mov    $0x4446c,%edx
   42b15:	be 65 00 00 00       	mov    $0x65,%esi
   42b1a:	bf 62 42 04 00       	mov    $0x44262,%edi
   42b1f:	e8 6b fc ff ff       	callq  4278f <assert_fail>
    if (perm & PTE_P) {
   42b24:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42b27:	48 98                	cltq   
   42b29:	83 e0 01             	and    $0x1,%eax
   42b2c:	48 85 c0             	test   %rax,%rax
   42b2f:	74 6e                	je     42b9f <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   42b31:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42b35:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b3a:	48 85 c0             	test   %rax,%rax
   42b3d:	74 14                	je     42b53 <virtual_memory_map+0xc5>
   42b3f:	ba 8a 44 04 00       	mov    $0x4448a,%edx
   42b44:	be 67 00 00 00       	mov    $0x67,%esi
   42b49:	bf 62 42 04 00       	mov    $0x44262,%edi
   42b4e:	e8 3c fc ff ff       	callq  4278f <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   42b53:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42b57:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b5b:	48 01 d0             	add    %rdx,%rax
   42b5e:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42b62:	76 14                	jbe    42b78 <virtual_memory_map+0xea>
   42b64:	ba 9d 44 04 00       	mov    $0x4449d,%edx
   42b69:	be 68 00 00 00       	mov    $0x68,%esi
   42b6e:	bf 62 42 04 00       	mov    $0x44262,%edi
   42b73:	e8 17 fc ff ff       	callq  4278f <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42b78:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42b7c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b80:	48 01 d0             	add    %rdx,%rax
   42b83:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42b89:	76 14                	jbe    42b9f <virtual_memory_map+0x111>
   42b8b:	ba ab 44 04 00       	mov    $0x444ab,%edx
   42b90:	be 69 00 00 00       	mov    $0x69,%esi
   42b95:	bf 62 42 04 00       	mov    $0x44262,%edi
   42b9a:	e8 f0 fb ff ff       	callq  4278f <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   42b9f:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42ba3:	78 09                	js     42bae <virtual_memory_map+0x120>
   42ba5:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42bac:	7e 14                	jle    42bc2 <virtual_memory_map+0x134>
   42bae:	ba c7 44 04 00       	mov    $0x444c7,%edx
   42bb3:	be 6b 00 00 00       	mov    $0x6b,%esi
   42bb8:	bf 62 42 04 00       	mov    $0x44262,%edi
   42bbd:	e8 cd fb ff ff       	callq  4278f <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42bc2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42bc6:	25 ff 0f 00 00       	and    $0xfff,%eax
   42bcb:	48 85 c0             	test   %rax,%rax
   42bce:	74 14                	je     42be4 <virtual_memory_map+0x156>
   42bd0:	ba e8 44 04 00       	mov    $0x444e8,%edx
   42bd5:	be 6c 00 00 00       	mov    $0x6c,%esi
   42bda:	bf 62 42 04 00       	mov    $0x44262,%edi
   42bdf:	e8 ab fb ff ff       	callq  4278f <assert_fail>

    int last_index123 = -1;
   42be4:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   42beb:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42bf2:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42bf3:	e9 e1 00 00 00       	jmpq   42cd9 <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42bf8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42bfc:	48 c1 e8 15          	shr    $0x15,%rax
   42c00:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   42c03:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42c06:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42c09:	74 20                	je     42c2b <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   42c0b:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42c0e:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42c12:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42c16:	48 89 ce             	mov    %rcx,%rsi
   42c19:	48 89 c7             	mov    %rax,%rdi
   42c1c:	e8 ce 00 00 00       	callq  42cef <lookup_l4pagetable>
   42c21:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42c25:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42c28:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   42c2b:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42c2e:	48 98                	cltq   
   42c30:	83 e0 01             	and    $0x1,%eax
   42c33:	48 85 c0             	test   %rax,%rax
   42c36:	74 34                	je     42c6c <virtual_memory_map+0x1de>
   42c38:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42c3d:	74 2d                	je     42c6c <virtual_memory_map+0x1de>
            // TODO
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   42c3f:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42c42:	48 63 d8             	movslq %eax,%rbx
   42c45:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42c49:	be 03 00 00 00       	mov    $0x3,%esi
   42c4e:	48 89 c7             	mov    %rax,%rdi
   42c51:	e8 9e fb ff ff       	callq  427f4 <pageindex>
   42c56:	89 c2                	mov    %eax,%edx
   42c58:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42c5c:	48 89 d9             	mov    %rbx,%rcx
   42c5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42c63:	48 63 d2             	movslq %edx,%rdx
   42c66:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42c6a:	eb 55                	jmp    42cc1 <virtual_memory_map+0x233>
            // map `pa` at appropriate entry with permissions `perm`
        } else if (l4pagetable) { // if page is NOT marked present
   42c6c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42c71:	74 26                	je     42c99 <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   42c73:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42c77:	be 03 00 00 00       	mov    $0x3,%esi
   42c7c:	48 89 c7             	mov    %rax,%rdi
   42c7f:	e8 70 fb ff ff       	callq  427f4 <pageindex>
   42c84:	89 c2                	mov    %eax,%edx
   42c86:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42c89:	48 63 c8             	movslq %eax,%rcx
   42c8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42c90:	48 63 d2             	movslq %edx,%rdx
   42c93:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42c97:	eb 28                	jmp    42cc1 <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   42c99:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42c9c:	48 98                	cltq   
   42c9e:	83 e0 01             	and    $0x1,%eax
   42ca1:	48 85 c0             	test   %rax,%rax
   42ca4:	74 1b                	je     42cc1 <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   42ca6:	be 84 00 00 00       	mov    $0x84,%esi
   42cab:	bf 10 45 04 00       	mov    $0x44510,%edi
   42cb0:	b8 00 00 00 00       	mov    $0x0,%eax
   42cb5:	e8 b7 f7 ff ff       	callq  42471 <log_printf>
            return -1;
   42cba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42cbf:	eb 28                	jmp    42ce9 <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42cc1:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   42cc8:	00 
   42cc9:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   42cd0:	00 
   42cd1:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   42cd8:	00 
   42cd9:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   42cde:	0f 85 14 ff ff ff    	jne    42bf8 <virtual_memory_map+0x16a>
        }
    }
    return 0;
   42ce4:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42ce9:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42ced:	c9                   	leaveq 
   42cee:	c3                   	retq   

0000000000042cef <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   42cef:	55                   	push   %rbp
   42cf0:	48 89 e5             	mov    %rsp,%rbp
   42cf3:	48 83 ec 40          	sub    $0x40,%rsp
   42cf7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42cfb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   42cff:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   42d02:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42d06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   42d0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42d11:	e9 23 01 00 00       	jmpq   42e39 <lookup_l4pagetable+0x14a>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   42d16:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42d19:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42d1d:	89 d6                	mov    %edx,%esi
   42d1f:	48 89 c7             	mov    %rax,%rdi
   42d22:	e8 cd fa ff ff       	callq  427f4 <pageindex>
   42d27:	89 c2                	mov    %eax,%edx
   42d29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d2d:	48 63 d2             	movslq %edx,%rdx
   42d30:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42d34:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   42d38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d3c:	83 e0 01             	and    $0x1,%eax
   42d3f:	48 85 c0             	test   %rax,%rax
   42d42:	75 63                	jne    42da7 <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   42d44:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42d47:	8d 48 02             	lea    0x2(%rax),%ecx
   42d4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d4e:	25 ff 0f 00 00       	and    $0xfff,%eax
   42d53:	48 89 c2             	mov    %rax,%rdx
   42d56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d5a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42d60:	48 89 c6             	mov    %rax,%rsi
   42d63:	bf 50 45 04 00       	mov    $0x44550,%edi
   42d68:	b8 00 00 00 00       	mov    $0x0,%eax
   42d6d:	e8 ff f6 ff ff       	callq  42471 <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   42d72:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42d75:	48 98                	cltq   
   42d77:	83 e0 01             	and    $0x1,%eax
   42d7a:	48 85 c0             	test   %rax,%rax
   42d7d:	75 0a                	jne    42d89 <lookup_l4pagetable+0x9a>
                return NULL;
   42d7f:	b8 00 00 00 00       	mov    $0x0,%eax
   42d84:	e9 be 00 00 00       	jmpq   42e47 <lookup_l4pagetable+0x158>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   42d89:	be a7 00 00 00       	mov    $0xa7,%esi
   42d8e:	bf b8 45 04 00       	mov    $0x445b8,%edi
   42d93:	b8 00 00 00 00       	mov    $0x0,%eax
   42d98:	e8 d4 f6 ff ff       	callq  42471 <log_printf>
            return NULL;
   42d9d:	b8 00 00 00 00       	mov    $0x0,%eax
   42da2:	e9 a0 00 00 00       	jmpq   42e47 <lookup_l4pagetable+0x158>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   42da7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42dab:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42db1:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42db7:	76 14                	jbe    42dcd <lookup_l4pagetable+0xde>
   42db9:	ba f8 45 04 00       	mov    $0x445f8,%edx
   42dbe:	be ac 00 00 00       	mov    $0xac,%esi
   42dc3:	bf 62 42 04 00       	mov    $0x44262,%edi
   42dc8:	e8 c2 f9 ff ff       	callq  4278f <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   42dcd:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42dd0:	48 98                	cltq   
   42dd2:	83 e0 02             	and    $0x2,%eax
   42dd5:	48 85 c0             	test   %rax,%rax
   42dd8:	74 20                	je     42dfa <lookup_l4pagetable+0x10b>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   42dda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42dde:	83 e0 02             	and    $0x2,%eax
   42de1:	48 85 c0             	test   %rax,%rax
   42de4:	75 14                	jne    42dfa <lookup_l4pagetable+0x10b>
   42de6:	ba 18 46 04 00       	mov    $0x44618,%edx
   42deb:	be ae 00 00 00       	mov    $0xae,%esi
   42df0:	bf 62 42 04 00       	mov    $0x44262,%edi
   42df5:	e8 95 f9 ff ff       	callq  4278f <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   42dfa:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42dfd:	48 98                	cltq   
   42dff:	83 e0 04             	and    $0x4,%eax
   42e02:	48 85 c0             	test   %rax,%rax
   42e05:	74 20                	je     42e27 <lookup_l4pagetable+0x138>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   42e07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e0b:	83 e0 04             	and    $0x4,%eax
   42e0e:	48 85 c0             	test   %rax,%rax
   42e11:	75 14                	jne    42e27 <lookup_l4pagetable+0x138>
   42e13:	ba 23 46 04 00       	mov    $0x44623,%edx
   42e18:	be b1 00 00 00       	mov    $0xb1,%esi
   42e1d:	bf 62 42 04 00       	mov    $0x44262,%edi
   42e22:	e8 68 f9 ff ff       	callq  4278f <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   42e27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e2b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e31:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   42e35:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42e39:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   42e3d:	0f 8e d3 fe ff ff    	jle    42d16 <lookup_l4pagetable+0x27>
    }
    return pt;
   42e43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   42e47:	c9                   	leaveq 
   42e48:	c3                   	retq   

0000000000042e49 <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   42e49:	55                   	push   %rbp
   42e4a:	48 89 e5             	mov    %rsp,%rbp
   42e4d:	48 83 ec 50          	sub    $0x50,%rsp
   42e51:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42e55:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42e59:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   42e5d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42e61:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   42e65:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   42e6c:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42e6d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   42e74:	eb 41                	jmp    42eb7 <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   42e76:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42e79:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42e7d:	89 d6                	mov    %edx,%esi
   42e7f:	48 89 c7             	mov    %rax,%rdi
   42e82:	e8 6d f9 ff ff       	callq  427f4 <pageindex>
   42e87:	89 c2                	mov    %eax,%edx
   42e89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42e8d:	48 63 d2             	movslq %edx,%rdx
   42e90:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   42e94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e98:	83 e0 06             	and    $0x6,%eax
   42e9b:	48 f7 d0             	not    %rax
   42e9e:	48 21 d0             	and    %rdx,%rax
   42ea1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   42ea5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ea9:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42eaf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42eb3:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   42eb7:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   42ebb:	7f 0c                	jg     42ec9 <virtual_memory_lookup+0x80>
   42ebd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ec1:	83 e0 01             	and    $0x1,%eax
   42ec4:	48 85 c0             	test   %rax,%rax
   42ec7:	75 ad                	jne    42e76 <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   42ec9:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   42ed0:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   42ed7:	ff 
   42ed8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   42edf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ee3:	83 e0 01             	and    $0x1,%eax
   42ee6:	48 85 c0             	test   %rax,%rax
   42ee9:	74 34                	je     42f1f <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   42eeb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42eef:	48 c1 e8 0c          	shr    $0xc,%rax
   42ef3:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   42ef6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42efa:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42f00:	48 89 c2             	mov    %rax,%rdx
   42f03:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42f07:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f0c:	48 09 d0             	or     %rdx,%rax
   42f0f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   42f13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f17:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f1c:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   42f1f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42f23:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42f27:	48 89 10             	mov    %rdx,(%rax)
   42f2a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   42f2e:	48 89 50 08          	mov    %rdx,0x8(%rax)
   42f32:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42f36:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   42f3a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42f3e:	c9                   	leaveq 
   42f3f:	c3                   	retq   

0000000000042f40 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   42f40:	55                   	push   %rbp
   42f41:	48 89 e5             	mov    %rsp,%rbp
   42f44:	48 83 ec 40          	sub    $0x40,%rsp
   42f48:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42f4c:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   42f4f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   42f53:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   42f5a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   42f5e:	78 08                	js     42f68 <program_load+0x28>
   42f60:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   42f63:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   42f66:	7c 14                	jl     42f7c <program_load+0x3c>
   42f68:	ba 30 46 04 00       	mov    $0x44630,%edx
   42f6d:	be 37 00 00 00       	mov    $0x37,%esi
   42f72:	bf 60 46 04 00       	mov    $0x44660,%edi
   42f77:	e8 13 f8 ff ff       	callq  4278f <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   42f7c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   42f7f:	48 98                	cltq   
   42f81:	48 c1 e0 04          	shl    $0x4,%rax
   42f85:	48 05 20 50 04 00    	add    $0x45020,%rax
   42f8b:	48 8b 00             	mov    (%rax),%rax
   42f8e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   42f92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f96:	8b 00                	mov    (%rax),%eax
   42f98:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   42f9d:	74 14                	je     42fb3 <program_load+0x73>
   42f9f:	ba 6b 46 04 00       	mov    $0x4466b,%edx
   42fa4:	be 39 00 00 00       	mov    $0x39,%esi
   42fa9:	bf 60 46 04 00       	mov    $0x44660,%edi
   42fae:	e8 dc f7 ff ff       	callq  4278f <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   42fb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fb7:	48 8b 50 20          	mov    0x20(%rax),%rdx
   42fbb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fbf:	48 01 d0             	add    %rdx,%rax
   42fc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   42fc6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42fcd:	e9 94 00 00 00       	jmpq   43066 <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   42fd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42fd5:	48 63 d0             	movslq %eax,%rdx
   42fd8:	48 89 d0             	mov    %rdx,%rax
   42fdb:	48 c1 e0 03          	shl    $0x3,%rax
   42fdf:	48 29 d0             	sub    %rdx,%rax
   42fe2:	48 c1 e0 03          	shl    $0x3,%rax
   42fe6:	48 89 c2             	mov    %rax,%rdx
   42fe9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42fed:	48 01 d0             	add    %rdx,%rax
   42ff0:	8b 00                	mov    (%rax),%eax
   42ff2:	83 f8 01             	cmp    $0x1,%eax
   42ff5:	75 6b                	jne    43062 <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   42ff7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ffa:	48 63 d0             	movslq %eax,%rdx
   42ffd:	48 89 d0             	mov    %rdx,%rax
   43000:	48 c1 e0 03          	shl    $0x3,%rax
   43004:	48 29 d0             	sub    %rdx,%rax
   43007:	48 c1 e0 03          	shl    $0x3,%rax
   4300b:	48 89 c2             	mov    %rax,%rdx
   4300e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43012:	48 01 d0             	add    %rdx,%rax
   43015:	48 8b 50 08          	mov    0x8(%rax),%rdx
   43019:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4301d:	48 01 d0             	add    %rdx,%rax
   43020:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   43024:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43027:	48 63 d0             	movslq %eax,%rdx
   4302a:	48 89 d0             	mov    %rdx,%rax
   4302d:	48 c1 e0 03          	shl    $0x3,%rax
   43031:	48 29 d0             	sub    %rdx,%rax
   43034:	48 c1 e0 03          	shl    $0x3,%rax
   43038:	48 89 c2             	mov    %rax,%rdx
   4303b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4303f:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43043:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43047:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4304b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4304f:	48 89 c7             	mov    %rax,%rdi
   43052:	e8 3d 00 00 00       	callq  43094 <program_load_segment>
   43057:	85 c0                	test   %eax,%eax
   43059:	79 07                	jns    43062 <program_load+0x122>
                return -1;
   4305b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43060:	eb 30                	jmp    43092 <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43062:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43066:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4306a:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   4306e:	0f b7 c0             	movzwl %ax,%eax
   43071:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43074:	0f 8c 58 ff ff ff    	jl     42fd2 <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4307a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4307e:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43082:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43086:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   4308d:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43092:	c9                   	leaveq 
   43093:	c3                   	retq   

0000000000043094 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43094:	55                   	push   %rbp
   43095:	48 89 e5             	mov    %rsp,%rbp
   43098:	48 83 ec 40          	sub    $0x40,%rsp
   4309c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   430a0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   430a4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   430a8:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   430ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   430b0:	48 8b 40 10          	mov    0x10(%rax),%rax
   430b4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   430b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   430bc:	48 8b 50 20          	mov    0x20(%rax),%rdx
   430c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430c4:	48 01 d0             	add    %rdx,%rax
   430c7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   430cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   430cf:	48 8b 50 28          	mov    0x28(%rax),%rdx
   430d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430d7:	48 01 d0             	add    %rdx,%rax
   430da:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   430de:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   430e5:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   430e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   430ee:	eb 7c                	jmp    4316c <program_load_segment+0xd8>
        if (assign_physical_page(addr, p->p_pid) < 0
   430f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   430f4:	8b 00                	mov    (%rax),%eax
   430f6:	0f be d0             	movsbl %al,%edx
   430f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   430fd:	89 d6                	mov    %edx,%esi
   430ff:	48 89 c7             	mov    %rax,%rdi
   43102:	e8 f3 d7 ff ff       	callq  408fa <assign_physical_page>
   43107:	85 c0                	test   %eax,%eax
   43109:	78 2a                	js     43135 <program_load_segment+0xa1>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   4310b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4310f:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43116:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4311a:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   4311e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43124:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43129:	48 89 c7             	mov    %rax,%rdi
   4312c:	e8 5d f9 ff ff       	callq  42a8e <virtual_memory_map>
   43131:	85 c0                	test   %eax,%eax
   43133:	79 2f                	jns    43164 <program_load_segment+0xd0>
                                  PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43135:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43139:	8b 00                	mov    (%rax),%eax
   4313b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4313f:	49 89 d0             	mov    %rdx,%r8
   43142:	89 c1                	mov    %eax,%ecx
   43144:	ba 88 46 04 00       	mov    $0x44688,%edx
   43149:	be 00 c0 00 00       	mov    $0xc000,%esi
   4314e:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43153:	b8 00 00 00 00       	mov    $0x0,%eax
   43158:	e8 ba 09 00 00       	callq  43b17 <console_printf>
            return -1;
   4315d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43162:	eb 77                	jmp    431db <program_load_segment+0x147>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43164:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4316b:	00 
   4316c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43170:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43174:	0f 82 76 ff ff ff    	jb     430f0 <program_load_segment+0x5c>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   4317a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4317e:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43185:	48 89 c7             	mov    %rax,%rdi
   43188:	e8 d0 f7 ff ff       	callq  4295d <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   4318d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43191:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   43195:	48 89 c2             	mov    %rax,%rdx
   43198:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4319c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   431a0:	48 89 ce             	mov    %rcx,%rsi
   431a3:	48 89 c7             	mov    %rax,%rdi
   431a6:	e8 ce 00 00 00       	callq  43279 <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   431ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   431af:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   431b3:	48 89 c2             	mov    %rax,%rdx
   431b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431ba:	be 00 00 00 00       	mov    $0x0,%esi
   431bf:	48 89 c7             	mov    %rax,%rdi
   431c2:	e8 1b 01 00 00       	callq  432e2 <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   431c7:	48 8b 05 32 de 00 00 	mov    0xde32(%rip),%rax        # 51000 <kernel_pagetable>
   431ce:	48 89 c7             	mov    %rax,%rdi
   431d1:	e8 87 f7 ff ff       	callq  4295d <set_pagetable>
    return 0;
   431d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
   431db:	c9                   	leaveq 
   431dc:	c3                   	retq   

00000000000431dd <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   431dd:	48 89 f9             	mov    %rdi,%rcx
   431e0:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   431e2:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   431e9:	00 
   431ea:	72 08                	jb     431f4 <console_putc+0x17>
        cp->cursor = console;
   431ec:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   431f3:	00 
    }
    if (c == '\n') {
   431f4:	40 80 fe 0a          	cmp    $0xa,%sil
   431f8:	74 16                	je     43210 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   431fa:	48 8b 41 08          	mov    0x8(%rcx),%rax
   431fe:	48 8d 50 02          	lea    0x2(%rax),%rdx
   43202:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   43206:	40 0f b6 f6          	movzbl %sil,%esi
   4320a:	09 fe                	or     %edi,%esi
   4320c:	66 89 30             	mov    %si,(%rax)
    }
}
   4320f:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   43210:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   43214:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   4321b:	4c 89 c6             	mov    %r8,%rsi
   4321e:	48 d1 fe             	sar    %rsi
   43221:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43228:	66 66 66 
   4322b:	48 89 f0             	mov    %rsi,%rax
   4322e:	48 f7 ea             	imul   %rdx
   43231:	48 c1 fa 05          	sar    $0x5,%rdx
   43235:	49 c1 f8 3f          	sar    $0x3f,%r8
   43239:	4c 29 c2             	sub    %r8,%rdx
   4323c:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   43240:	48 c1 e2 04          	shl    $0x4,%rdx
   43244:	89 f0                	mov    %esi,%eax
   43246:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   43248:	83 cf 20             	or     $0x20,%edi
   4324b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   4324f:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   43253:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   43257:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   4325a:	83 c0 01             	add    $0x1,%eax
   4325d:	83 f8 50             	cmp    $0x50,%eax
   43260:	75 e9                	jne    4324b <console_putc+0x6e>
   43262:	c3                   	retq   

0000000000043263 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43263:	48 8b 47 08          	mov    0x8(%rdi),%rax
   43267:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   4326b:	73 0b                	jae    43278 <string_putc+0x15>
        *sp->s++ = c;
   4326d:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43271:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   43275:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   43278:	c3                   	retq   

0000000000043279 <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   43279:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   4327c:	48 85 d2             	test   %rdx,%rdx
   4327f:	74 17                	je     43298 <memcpy+0x1f>
   43281:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   43286:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   4328b:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   4328f:	48 83 c1 01          	add    $0x1,%rcx
   43293:	48 39 d1             	cmp    %rdx,%rcx
   43296:	75 ee                	jne    43286 <memcpy+0xd>
}
   43298:	c3                   	retq   

0000000000043299 <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   43299:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   4329c:	48 39 fe             	cmp    %rdi,%rsi
   4329f:	72 1d                	jb     432be <memmove+0x25>
        while (n-- > 0) {
   432a1:	b9 00 00 00 00       	mov    $0x0,%ecx
   432a6:	48 85 d2             	test   %rdx,%rdx
   432a9:	74 12                	je     432bd <memmove+0x24>
            *d++ = *s++;
   432ab:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   432af:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   432b3:	48 83 c1 01          	add    $0x1,%rcx
   432b7:	48 39 ca             	cmp    %rcx,%rdx
   432ba:	75 ef                	jne    432ab <memmove+0x12>
}
   432bc:	c3                   	retq   
   432bd:	c3                   	retq   
    if (s < d && s + n > d) {
   432be:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   432c2:	48 39 cf             	cmp    %rcx,%rdi
   432c5:	73 da                	jae    432a1 <memmove+0x8>
        while (n-- > 0) {
   432c7:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   432cb:	48 85 d2             	test   %rdx,%rdx
   432ce:	74 ec                	je     432bc <memmove+0x23>
            *--d = *--s;
   432d0:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   432d4:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   432d7:	48 83 e9 01          	sub    $0x1,%rcx
   432db:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   432df:	75 ef                	jne    432d0 <memmove+0x37>
   432e1:	c3                   	retq   

00000000000432e2 <memset>:
void* memset(void* v, int c, size_t n) {
   432e2:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   432e5:	48 85 d2             	test   %rdx,%rdx
   432e8:	74 12                	je     432fc <memset+0x1a>
   432ea:	48 01 fa             	add    %rdi,%rdx
   432ed:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   432f0:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   432f3:	48 83 c1 01          	add    $0x1,%rcx
   432f7:	48 39 ca             	cmp    %rcx,%rdx
   432fa:	75 f4                	jne    432f0 <memset+0xe>
}
   432fc:	c3                   	retq   

00000000000432fd <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   432fd:	80 3f 00             	cmpb   $0x0,(%rdi)
   43300:	74 10                	je     43312 <strlen+0x15>
   43302:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43307:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   4330b:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   4330f:	75 f6                	jne    43307 <strlen+0xa>
   43311:	c3                   	retq   
   43312:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43317:	c3                   	retq   

0000000000043318 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   43318:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4331b:	ba 00 00 00 00       	mov    $0x0,%edx
   43320:	48 85 f6             	test   %rsi,%rsi
   43323:	74 11                	je     43336 <strnlen+0x1e>
   43325:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   43329:	74 0c                	je     43337 <strnlen+0x1f>
        ++n;
   4332b:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4332f:	48 39 d0             	cmp    %rdx,%rax
   43332:	75 f1                	jne    43325 <strnlen+0xd>
   43334:	eb 04                	jmp    4333a <strnlen+0x22>
   43336:	c3                   	retq   
   43337:	48 89 d0             	mov    %rdx,%rax
}
   4333a:	c3                   	retq   

000000000004333b <strcpy>:
char* strcpy(char* dst, const char* src) {
   4333b:	48 89 f8             	mov    %rdi,%rax
   4333e:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   43343:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   43347:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   4334a:	48 83 c2 01          	add    $0x1,%rdx
   4334e:	84 c9                	test   %cl,%cl
   43350:	75 f1                	jne    43343 <strcpy+0x8>
}
   43352:	c3                   	retq   

0000000000043353 <strcmp>:
    while (*a && *b && *a == *b) {
   43353:	0f b6 07             	movzbl (%rdi),%eax
   43356:	84 c0                	test   %al,%al
   43358:	74 1a                	je     43374 <strcmp+0x21>
   4335a:	0f b6 16             	movzbl (%rsi),%edx
   4335d:	38 c2                	cmp    %al,%dl
   4335f:	75 13                	jne    43374 <strcmp+0x21>
   43361:	84 d2                	test   %dl,%dl
   43363:	74 0f                	je     43374 <strcmp+0x21>
        ++a, ++b;
   43365:	48 83 c7 01          	add    $0x1,%rdi
   43369:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   4336d:	0f b6 07             	movzbl (%rdi),%eax
   43370:	84 c0                	test   %al,%al
   43372:	75 e6                	jne    4335a <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   43374:	3a 06                	cmp    (%rsi),%al
   43376:	0f 97 c0             	seta   %al
   43379:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   4337c:	83 d8 00             	sbb    $0x0,%eax
}
   4337f:	c3                   	retq   

0000000000043380 <strchr>:
    while (*s && *s != (char) c) {
   43380:	0f b6 07             	movzbl (%rdi),%eax
   43383:	84 c0                	test   %al,%al
   43385:	74 10                	je     43397 <strchr+0x17>
   43387:	40 38 f0             	cmp    %sil,%al
   4338a:	74 18                	je     433a4 <strchr+0x24>
        ++s;
   4338c:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   43390:	0f b6 07             	movzbl (%rdi),%eax
   43393:	84 c0                	test   %al,%al
   43395:	75 f0                	jne    43387 <strchr+0x7>
        return NULL;
   43397:	40 84 f6             	test   %sil,%sil
   4339a:	b8 00 00 00 00       	mov    $0x0,%eax
   4339f:	48 0f 44 c7          	cmove  %rdi,%rax
}
   433a3:	c3                   	retq   
   433a4:	48 89 f8             	mov    %rdi,%rax
   433a7:	c3                   	retq   

00000000000433a8 <rand>:
    if (!rand_seed_set) {
   433a8:	83 3d 55 3c 01 00 00 	cmpl   $0x0,0x13c55(%rip)        # 57004 <rand_seed_set>
   433af:	74 1b                	je     433cc <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   433b1:	69 05 45 3c 01 00 0d 	imul   $0x19660d,0x13c45(%rip),%eax        # 57000 <rand_seed>
   433b8:	66 19 00 
   433bb:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   433c0:	89 05 3a 3c 01 00    	mov    %eax,0x13c3a(%rip)        # 57000 <rand_seed>
    return rand_seed & RAND_MAX;
   433c6:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   433cb:	c3                   	retq   
    rand_seed = seed;
   433cc:	c7 05 2a 3c 01 00 9e 	movl   $0x30d4879e,0x13c2a(%rip)        # 57000 <rand_seed>
   433d3:	87 d4 30 
    rand_seed_set = 1;
   433d6:	c7 05 24 3c 01 00 01 	movl   $0x1,0x13c24(%rip)        # 57004 <rand_seed_set>
   433dd:	00 00 00 
}
   433e0:	eb cf                	jmp    433b1 <rand+0x9>

00000000000433e2 <srand>:
    rand_seed = seed;
   433e2:	89 3d 18 3c 01 00    	mov    %edi,0x13c18(%rip)        # 57000 <rand_seed>
    rand_seed_set = 1;
   433e8:	c7 05 12 3c 01 00 01 	movl   $0x1,0x13c12(%rip)        # 57004 <rand_seed_set>
   433ef:	00 00 00 
}
   433f2:	c3                   	retq   

00000000000433f3 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   433f3:	55                   	push   %rbp
   433f4:	48 89 e5             	mov    %rsp,%rbp
   433f7:	41 57                	push   %r15
   433f9:	41 56                	push   %r14
   433fb:	41 55                	push   %r13
   433fd:	41 54                	push   %r12
   433ff:	53                   	push   %rbx
   43400:	48 83 ec 58          	sub    $0x58,%rsp
   43404:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   43408:	0f b6 02             	movzbl (%rdx),%eax
   4340b:	84 c0                	test   %al,%al
   4340d:	0f 84 b0 06 00 00    	je     43ac3 <printer_vprintf+0x6d0>
   43413:	49 89 fe             	mov    %rdi,%r14
   43416:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   43419:	41 89 f7             	mov    %esi,%r15d
   4341c:	e9 a4 04 00 00       	jmpq   438c5 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   43421:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   43426:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   4342c:	45 84 e4             	test   %r12b,%r12b
   4342f:	0f 84 82 06 00 00    	je     43ab7 <printer_vprintf+0x6c4>
        int flags = 0;
   43435:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   4343b:	41 0f be f4          	movsbl %r12b,%esi
   4343f:	bf c1 48 04 00       	mov    $0x448c1,%edi
   43444:	e8 37 ff ff ff       	callq  43380 <strchr>
   43449:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   4344c:	48 85 c0             	test   %rax,%rax
   4344f:	74 55                	je     434a6 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   43451:	48 81 e9 c1 48 04 00 	sub    $0x448c1,%rcx
   43458:	b8 01 00 00 00       	mov    $0x1,%eax
   4345d:	d3 e0                	shl    %cl,%eax
   4345f:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43462:	48 83 c3 01          	add    $0x1,%rbx
   43466:	44 0f b6 23          	movzbl (%rbx),%r12d
   4346a:	45 84 e4             	test   %r12b,%r12b
   4346d:	75 cc                	jne    4343b <printer_vprintf+0x48>
   4346f:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   43473:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   43479:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   43480:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   43483:	0f 84 a9 00 00 00    	je     43532 <printer_vprintf+0x13f>
        int length = 0;
   43489:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   4348e:	0f b6 13             	movzbl (%rbx),%edx
   43491:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43494:	3c 37                	cmp    $0x37,%al
   43496:	0f 87 c4 04 00 00    	ja     43960 <printer_vprintf+0x56d>
   4349c:	0f b6 c0             	movzbl %al,%eax
   4349f:	ff 24 c5 d0 46 04 00 	jmpq   *0x446d0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   434a6:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   434aa:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   434af:	3c 08                	cmp    $0x8,%al
   434b1:	77 2f                	ja     434e2 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   434b3:	0f b6 03             	movzbl (%rbx),%eax
   434b6:	8d 50 d0             	lea    -0x30(%rax),%edx
   434b9:	80 fa 09             	cmp    $0x9,%dl
   434bc:	77 5e                	ja     4351c <printer_vprintf+0x129>
   434be:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   434c4:	48 83 c3 01          	add    $0x1,%rbx
   434c8:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   434cd:	0f be c0             	movsbl %al,%eax
   434d0:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   434d5:	0f b6 03             	movzbl (%rbx),%eax
   434d8:	8d 50 d0             	lea    -0x30(%rax),%edx
   434db:	80 fa 09             	cmp    $0x9,%dl
   434de:	76 e4                	jbe    434c4 <printer_vprintf+0xd1>
   434e0:	eb 97                	jmp    43479 <printer_vprintf+0x86>
        } else if (*format == '*') {
   434e2:	41 80 fc 2a          	cmp    $0x2a,%r12b
   434e6:	75 3f                	jne    43527 <printer_vprintf+0x134>
            width = va_arg(val, int);
   434e8:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   434ec:	8b 07                	mov    (%rdi),%eax
   434ee:	83 f8 2f             	cmp    $0x2f,%eax
   434f1:	77 17                	ja     4350a <printer_vprintf+0x117>
   434f3:	89 c2                	mov    %eax,%edx
   434f5:	48 03 57 10          	add    0x10(%rdi),%rdx
   434f9:	83 c0 08             	add    $0x8,%eax
   434fc:	89 07                	mov    %eax,(%rdi)
   434fe:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43501:	48 83 c3 01          	add    $0x1,%rbx
   43505:	e9 6f ff ff ff       	jmpq   43479 <printer_vprintf+0x86>
            width = va_arg(val, int);
   4350a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4350e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43512:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43516:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4351a:	eb e2                	jmp    434fe <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   4351c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43522:	e9 52 ff ff ff       	jmpq   43479 <printer_vprintf+0x86>
        int width = -1;
   43527:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   4352d:	e9 47 ff ff ff       	jmpq   43479 <printer_vprintf+0x86>
            ++format;
   43532:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   43536:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   4353a:	8d 48 d0             	lea    -0x30(%rax),%ecx
   4353d:	80 f9 09             	cmp    $0x9,%cl
   43540:	76 13                	jbe    43555 <printer_vprintf+0x162>
            } else if (*format == '*') {
   43542:	3c 2a                	cmp    $0x2a,%al
   43544:	74 33                	je     43579 <printer_vprintf+0x186>
            ++format;
   43546:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   43549:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   43550:	e9 34 ff ff ff       	jmpq   43489 <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43555:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   4355a:	48 83 c2 01          	add    $0x1,%rdx
   4355e:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43561:	0f be c0             	movsbl %al,%eax
   43564:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43568:	0f b6 02             	movzbl (%rdx),%eax
   4356b:	8d 70 d0             	lea    -0x30(%rax),%esi
   4356e:	40 80 fe 09          	cmp    $0x9,%sil
   43572:	76 e6                	jbe    4355a <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   43574:	48 89 d3             	mov    %rdx,%rbx
   43577:	eb 1c                	jmp    43595 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   43579:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4357d:	8b 07                	mov    (%rdi),%eax
   4357f:	83 f8 2f             	cmp    $0x2f,%eax
   43582:	77 23                	ja     435a7 <printer_vprintf+0x1b4>
   43584:	89 c2                	mov    %eax,%edx
   43586:	48 03 57 10          	add    0x10(%rdi),%rdx
   4358a:	83 c0 08             	add    $0x8,%eax
   4358d:	89 07                	mov    %eax,(%rdi)
   4358f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43591:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   43595:	85 c9                	test   %ecx,%ecx
   43597:	b8 00 00 00 00       	mov    $0x0,%eax
   4359c:	0f 49 c1             	cmovns %ecx,%eax
   4359f:	89 45 9c             	mov    %eax,-0x64(%rbp)
   435a2:	e9 e2 fe ff ff       	jmpq   43489 <printer_vprintf+0x96>
                precision = va_arg(val, int);
   435a7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   435ab:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   435af:	48 8d 42 08          	lea    0x8(%rdx),%rax
   435b3:	48 89 41 08          	mov    %rax,0x8(%rcx)
   435b7:	eb d6                	jmp    4358f <printer_vprintf+0x19c>
        switch (*format) {
   435b9:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   435be:	e9 f3 00 00 00       	jmpq   436b6 <printer_vprintf+0x2c3>
            ++format;
   435c3:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   435c7:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   435cc:	e9 bd fe ff ff       	jmpq   4348e <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   435d1:	85 c9                	test   %ecx,%ecx
   435d3:	74 55                	je     4362a <printer_vprintf+0x237>
   435d5:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   435d9:	8b 07                	mov    (%rdi),%eax
   435db:	83 f8 2f             	cmp    $0x2f,%eax
   435de:	77 38                	ja     43618 <printer_vprintf+0x225>
   435e0:	89 c2                	mov    %eax,%edx
   435e2:	48 03 57 10          	add    0x10(%rdi),%rdx
   435e6:	83 c0 08             	add    $0x8,%eax
   435e9:	89 07                	mov    %eax,(%rdi)
   435eb:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   435ee:	48 89 d0             	mov    %rdx,%rax
   435f1:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   435f5:	49 89 d0             	mov    %rdx,%r8
   435f8:	49 f7 d8             	neg    %r8
   435fb:	25 80 00 00 00       	and    $0x80,%eax
   43600:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43604:	0b 45 a8             	or     -0x58(%rbp),%eax
   43607:	83 c8 60             	or     $0x60,%eax
   4360a:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   4360d:	41 bc c7 46 04 00    	mov    $0x446c7,%r12d
            break;
   43613:	e9 35 01 00 00       	jmpq   4374d <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43618:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4361c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43620:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43624:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43628:	eb c1                	jmp    435eb <printer_vprintf+0x1f8>
   4362a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4362e:	8b 07                	mov    (%rdi),%eax
   43630:	83 f8 2f             	cmp    $0x2f,%eax
   43633:	77 10                	ja     43645 <printer_vprintf+0x252>
   43635:	89 c2                	mov    %eax,%edx
   43637:	48 03 57 10          	add    0x10(%rdi),%rdx
   4363b:	83 c0 08             	add    $0x8,%eax
   4363e:	89 07                	mov    %eax,(%rdi)
   43640:	48 63 12             	movslq (%rdx),%rdx
   43643:	eb a9                	jmp    435ee <printer_vprintf+0x1fb>
   43645:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43649:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   4364d:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43651:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43655:	eb e9                	jmp    43640 <printer_vprintf+0x24d>
        int base = 10;
   43657:	be 0a 00 00 00       	mov    $0xa,%esi
   4365c:	eb 58                	jmp    436b6 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   4365e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43662:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43666:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4366a:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4366e:	eb 60                	jmp    436d0 <printer_vprintf+0x2dd>
   43670:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43674:	8b 07                	mov    (%rdi),%eax
   43676:	83 f8 2f             	cmp    $0x2f,%eax
   43679:	77 10                	ja     4368b <printer_vprintf+0x298>
   4367b:	89 c2                	mov    %eax,%edx
   4367d:	48 03 57 10          	add    0x10(%rdi),%rdx
   43681:	83 c0 08             	add    $0x8,%eax
   43684:	89 07                	mov    %eax,(%rdi)
   43686:	44 8b 02             	mov    (%rdx),%r8d
   43689:	eb 48                	jmp    436d3 <printer_vprintf+0x2e0>
   4368b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4368f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43693:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43697:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4369b:	eb e9                	jmp    43686 <printer_vprintf+0x293>
   4369d:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   436a0:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   436a7:	bf b0 48 04 00       	mov    $0x448b0,%edi
   436ac:	e9 e2 02 00 00       	jmpq   43993 <printer_vprintf+0x5a0>
            base = 16;
   436b1:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   436b6:	85 c9                	test   %ecx,%ecx
   436b8:	74 b6                	je     43670 <printer_vprintf+0x27d>
   436ba:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   436be:	8b 01                	mov    (%rcx),%eax
   436c0:	83 f8 2f             	cmp    $0x2f,%eax
   436c3:	77 99                	ja     4365e <printer_vprintf+0x26b>
   436c5:	89 c2                	mov    %eax,%edx
   436c7:	48 03 51 10          	add    0x10(%rcx),%rdx
   436cb:	83 c0 08             	add    $0x8,%eax
   436ce:	89 01                	mov    %eax,(%rcx)
   436d0:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   436d3:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   436d7:	85 f6                	test   %esi,%esi
   436d9:	79 c2                	jns    4369d <printer_vprintf+0x2aa>
        base = -base;
   436db:	41 89 f1             	mov    %esi,%r9d
   436de:	f7 de                	neg    %esi
   436e0:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   436e7:	bf 90 48 04 00       	mov    $0x44890,%edi
   436ec:	e9 a2 02 00 00       	jmpq   43993 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   436f1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   436f5:	8b 07                	mov    (%rdi),%eax
   436f7:	83 f8 2f             	cmp    $0x2f,%eax
   436fa:	77 1c                	ja     43718 <printer_vprintf+0x325>
   436fc:	89 c2                	mov    %eax,%edx
   436fe:	48 03 57 10          	add    0x10(%rdi),%rdx
   43702:	83 c0 08             	add    $0x8,%eax
   43705:	89 07                	mov    %eax,(%rdi)
   43707:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   4370a:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   43711:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43716:	eb c3                	jmp    436db <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   43718:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4371c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43720:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43724:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43728:	eb dd                	jmp    43707 <printer_vprintf+0x314>
            data = va_arg(val, char*);
   4372a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4372e:	8b 01                	mov    (%rcx),%eax
   43730:	83 f8 2f             	cmp    $0x2f,%eax
   43733:	0f 87 a5 01 00 00    	ja     438de <printer_vprintf+0x4eb>
   43739:	89 c2                	mov    %eax,%edx
   4373b:	48 03 51 10          	add    0x10(%rcx),%rdx
   4373f:	83 c0 08             	add    $0x8,%eax
   43742:	89 01                	mov    %eax,(%rcx)
   43744:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   43747:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   4374d:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43750:	83 e0 20             	and    $0x20,%eax
   43753:	89 45 8c             	mov    %eax,-0x74(%rbp)
   43756:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   4375c:	0f 85 21 02 00 00    	jne    43983 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43762:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43765:	89 45 88             	mov    %eax,-0x78(%rbp)
   43768:	83 e0 60             	and    $0x60,%eax
   4376b:	83 f8 60             	cmp    $0x60,%eax
   4376e:	0f 84 54 02 00 00    	je     439c8 <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43774:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43777:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   4377a:	48 c7 45 a0 c7 46 04 	movq   $0x446c7,-0x60(%rbp)
   43781:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43782:	83 f8 21             	cmp    $0x21,%eax
   43785:	0f 84 79 02 00 00    	je     43a04 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   4378b:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   4378e:	89 f8                	mov    %edi,%eax
   43790:	f7 d0                	not    %eax
   43792:	c1 e8 1f             	shr    $0x1f,%eax
   43795:	89 45 84             	mov    %eax,-0x7c(%rbp)
   43798:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   4379c:	0f 85 9e 02 00 00    	jne    43a40 <printer_vprintf+0x64d>
   437a2:	84 c0                	test   %al,%al
   437a4:	0f 84 96 02 00 00    	je     43a40 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   437aa:	48 63 f7             	movslq %edi,%rsi
   437ad:	4c 89 e7             	mov    %r12,%rdi
   437b0:	e8 63 fb ff ff       	callq  43318 <strnlen>
   437b5:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   437b8:	8b 45 88             	mov    -0x78(%rbp),%eax
   437bb:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   437be:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   437c5:	83 f8 22             	cmp    $0x22,%eax
   437c8:	0f 84 aa 02 00 00    	je     43a78 <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   437ce:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   437d2:	e8 26 fb ff ff       	callq  432fd <strlen>
   437d7:	8b 55 9c             	mov    -0x64(%rbp),%edx
   437da:	03 55 98             	add    -0x68(%rbp),%edx
   437dd:	44 89 e9             	mov    %r13d,%ecx
   437e0:	29 d1                	sub    %edx,%ecx
   437e2:	29 c1                	sub    %eax,%ecx
   437e4:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   437e7:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   437ea:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   437ee:	75 2d                	jne    4381d <printer_vprintf+0x42a>
   437f0:	85 c9                	test   %ecx,%ecx
   437f2:	7e 29                	jle    4381d <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   437f4:	44 89 fa             	mov    %r15d,%edx
   437f7:	be 20 00 00 00       	mov    $0x20,%esi
   437fc:	4c 89 f7             	mov    %r14,%rdi
   437ff:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43802:	41 83 ed 01          	sub    $0x1,%r13d
   43806:	45 85 ed             	test   %r13d,%r13d
   43809:	7f e9                	jg     437f4 <printer_vprintf+0x401>
   4380b:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   4380e:	85 ff                	test   %edi,%edi
   43810:	b8 01 00 00 00       	mov    $0x1,%eax
   43815:	0f 4f c7             	cmovg  %edi,%eax
   43818:	29 c7                	sub    %eax,%edi
   4381a:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   4381d:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43821:	0f b6 07             	movzbl (%rdi),%eax
   43824:	84 c0                	test   %al,%al
   43826:	74 22                	je     4384a <printer_vprintf+0x457>
   43828:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4382c:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   4382f:	0f b6 f0             	movzbl %al,%esi
   43832:	44 89 fa             	mov    %r15d,%edx
   43835:	4c 89 f7             	mov    %r14,%rdi
   43838:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   4383b:	48 83 c3 01          	add    $0x1,%rbx
   4383f:	0f b6 03             	movzbl (%rbx),%eax
   43842:	84 c0                	test   %al,%al
   43844:	75 e9                	jne    4382f <printer_vprintf+0x43c>
   43846:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   4384a:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4384d:	85 c0                	test   %eax,%eax
   4384f:	7e 1d                	jle    4386e <printer_vprintf+0x47b>
   43851:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   43855:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   43857:	44 89 fa             	mov    %r15d,%edx
   4385a:	be 30 00 00 00       	mov    $0x30,%esi
   4385f:	4c 89 f7             	mov    %r14,%rdi
   43862:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   43865:	83 eb 01             	sub    $0x1,%ebx
   43868:	75 ed                	jne    43857 <printer_vprintf+0x464>
   4386a:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   4386e:	8b 45 98             	mov    -0x68(%rbp),%eax
   43871:	85 c0                	test   %eax,%eax
   43873:	7e 27                	jle    4389c <printer_vprintf+0x4a9>
   43875:	89 c0                	mov    %eax,%eax
   43877:	4c 01 e0             	add    %r12,%rax
   4387a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4387e:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   43881:	41 0f b6 34 24       	movzbl (%r12),%esi
   43886:	44 89 fa             	mov    %r15d,%edx
   43889:	4c 89 f7             	mov    %r14,%rdi
   4388c:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   4388f:	49 83 c4 01          	add    $0x1,%r12
   43893:	49 39 dc             	cmp    %rbx,%r12
   43896:	75 e9                	jne    43881 <printer_vprintf+0x48e>
   43898:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   4389c:	45 85 ed             	test   %r13d,%r13d
   4389f:	7e 14                	jle    438b5 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   438a1:	44 89 fa             	mov    %r15d,%edx
   438a4:	be 20 00 00 00       	mov    $0x20,%esi
   438a9:	4c 89 f7             	mov    %r14,%rdi
   438ac:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   438af:	41 83 ed 01          	sub    $0x1,%r13d
   438b3:	75 ec                	jne    438a1 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   438b5:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   438b9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   438bd:	84 c0                	test   %al,%al
   438bf:	0f 84 fe 01 00 00    	je     43ac3 <printer_vprintf+0x6d0>
        if (*format != '%') {
   438c5:	3c 25                	cmp    $0x25,%al
   438c7:	0f 84 54 fb ff ff    	je     43421 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   438cd:	0f b6 f0             	movzbl %al,%esi
   438d0:	44 89 fa             	mov    %r15d,%edx
   438d3:	4c 89 f7             	mov    %r14,%rdi
   438d6:	41 ff 16             	callq  *(%r14)
            continue;
   438d9:	4c 89 e3             	mov    %r12,%rbx
   438dc:	eb d7                	jmp    438b5 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   438de:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   438e2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   438e6:	48 8d 42 08          	lea    0x8(%rdx),%rax
   438ea:	48 89 47 08          	mov    %rax,0x8(%rdi)
   438ee:	e9 51 fe ff ff       	jmpq   43744 <printer_vprintf+0x351>
            color = va_arg(val, int);
   438f3:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   438f7:	8b 07                	mov    (%rdi),%eax
   438f9:	83 f8 2f             	cmp    $0x2f,%eax
   438fc:	77 10                	ja     4390e <printer_vprintf+0x51b>
   438fe:	89 c2                	mov    %eax,%edx
   43900:	48 03 57 10          	add    0x10(%rdi),%rdx
   43904:	83 c0 08             	add    $0x8,%eax
   43907:	89 07                	mov    %eax,(%rdi)
   43909:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   4390c:	eb a7                	jmp    438b5 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   4390e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43912:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43916:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4391a:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4391e:	eb e9                	jmp    43909 <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   43920:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43924:	8b 01                	mov    (%rcx),%eax
   43926:	83 f8 2f             	cmp    $0x2f,%eax
   43929:	77 23                	ja     4394e <printer_vprintf+0x55b>
   4392b:	89 c2                	mov    %eax,%edx
   4392d:	48 03 51 10          	add    0x10(%rcx),%rdx
   43931:	83 c0 08             	add    $0x8,%eax
   43934:	89 01                	mov    %eax,(%rcx)
   43936:	8b 02                	mov    (%rdx),%eax
   43938:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   4393b:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   4393f:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43943:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   43949:	e9 ff fd ff ff       	jmpq   4374d <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   4394e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43952:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43956:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4395a:	48 89 47 08          	mov    %rax,0x8(%rdi)
   4395e:	eb d6                	jmp    43936 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   43960:	84 d2                	test   %dl,%dl
   43962:	0f 85 39 01 00 00    	jne    43aa1 <printer_vprintf+0x6ae>
   43968:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   4396c:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   43970:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   43974:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43978:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   4397e:	e9 ca fd ff ff       	jmpq   4374d <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   43983:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   43989:	bf b0 48 04 00       	mov    $0x448b0,%edi
        if (flags & FLAG_NUMERIC) {
   4398e:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   43993:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   43997:	4c 89 c1             	mov    %r8,%rcx
   4399a:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   4399e:	48 63 f6             	movslq %esi,%rsi
   439a1:	49 83 ec 01          	sub    $0x1,%r12
   439a5:	48 89 c8             	mov    %rcx,%rax
   439a8:	ba 00 00 00 00       	mov    $0x0,%edx
   439ad:	48 f7 f6             	div    %rsi
   439b0:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   439b4:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   439b8:	48 89 ca             	mov    %rcx,%rdx
   439bb:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   439be:	48 39 d6             	cmp    %rdx,%rsi
   439c1:	76 de                	jbe    439a1 <printer_vprintf+0x5ae>
   439c3:	e9 9a fd ff ff       	jmpq   43762 <printer_vprintf+0x36f>
                prefix = "-";
   439c8:	48 c7 45 a0 c4 46 04 	movq   $0x446c4,-0x60(%rbp)
   439cf:	00 
            if (flags & FLAG_NEGATIVE) {
   439d0:	8b 45 a8             	mov    -0x58(%rbp),%eax
   439d3:	a8 80                	test   $0x80,%al
   439d5:	0f 85 b0 fd ff ff    	jne    4378b <printer_vprintf+0x398>
                prefix = "+";
   439db:	48 c7 45 a0 bf 46 04 	movq   $0x446bf,-0x60(%rbp)
   439e2:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   439e3:	a8 10                	test   $0x10,%al
   439e5:	0f 85 a0 fd ff ff    	jne    4378b <printer_vprintf+0x398>
                prefix = " ";
   439eb:	a8 08                	test   $0x8,%al
   439ed:	ba c7 46 04 00       	mov    $0x446c7,%edx
   439f2:	b8 c6 46 04 00       	mov    $0x446c6,%eax
   439f7:	48 0f 44 c2          	cmove  %rdx,%rax
   439fb:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   439ff:	e9 87 fd ff ff       	jmpq   4378b <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   43a04:	41 8d 41 10          	lea    0x10(%r9),%eax
   43a08:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   43a0d:	0f 85 78 fd ff ff    	jne    4378b <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   43a13:	4d 85 c0             	test   %r8,%r8
   43a16:	75 0d                	jne    43a25 <printer_vprintf+0x632>
   43a18:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   43a1f:	0f 84 66 fd ff ff    	je     4378b <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   43a25:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   43a29:	ba c8 46 04 00       	mov    $0x446c8,%edx
   43a2e:	b8 c1 46 04 00       	mov    $0x446c1,%eax
   43a33:	48 0f 44 c2          	cmove  %rdx,%rax
   43a37:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   43a3b:	e9 4b fd ff ff       	jmpq   4378b <printer_vprintf+0x398>
            len = strlen(data);
   43a40:	4c 89 e7             	mov    %r12,%rdi
   43a43:	e8 b5 f8 ff ff       	callq  432fd <strlen>
   43a48:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   43a4b:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   43a4f:	0f 84 63 fd ff ff    	je     437b8 <printer_vprintf+0x3c5>
   43a55:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   43a59:	0f 84 59 fd ff ff    	je     437b8 <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   43a5f:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   43a62:	89 ca                	mov    %ecx,%edx
   43a64:	29 c2                	sub    %eax,%edx
   43a66:	39 c1                	cmp    %eax,%ecx
   43a68:	b8 00 00 00 00       	mov    $0x0,%eax
   43a6d:	0f 4e d0             	cmovle %eax,%edx
   43a70:	89 55 9c             	mov    %edx,-0x64(%rbp)
   43a73:	e9 56 fd ff ff       	jmpq   437ce <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   43a78:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43a7c:	e8 7c f8 ff ff       	callq  432fd <strlen>
   43a81:	8b 7d 98             	mov    -0x68(%rbp),%edi
   43a84:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   43a87:	44 89 e9             	mov    %r13d,%ecx
   43a8a:	29 f9                	sub    %edi,%ecx
   43a8c:	29 c1                	sub    %eax,%ecx
   43a8e:	44 39 ea             	cmp    %r13d,%edx
   43a91:	b8 00 00 00 00       	mov    $0x0,%eax
   43a96:	0f 4d c8             	cmovge %eax,%ecx
   43a99:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   43a9c:	e9 2d fd ff ff       	jmpq   437ce <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   43aa1:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   43aa4:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43aa8:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43aac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43ab2:	e9 96 fc ff ff       	jmpq   4374d <printer_vprintf+0x35a>
        int flags = 0;
   43ab7:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   43abe:	e9 b0 f9 ff ff       	jmpq   43473 <printer_vprintf+0x80>
}
   43ac3:	48 83 c4 58          	add    $0x58,%rsp
   43ac7:	5b                   	pop    %rbx
   43ac8:	41 5c                	pop    %r12
   43aca:	41 5d                	pop    %r13
   43acc:	41 5e                	pop    %r14
   43ace:	41 5f                	pop    %r15
   43ad0:	5d                   	pop    %rbp
   43ad1:	c3                   	retq   

0000000000043ad2 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   43ad2:	55                   	push   %rbp
   43ad3:	48 89 e5             	mov    %rsp,%rbp
   43ad6:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   43ada:	48 c7 45 f0 dd 31 04 	movq   $0x431dd,-0x10(%rbp)
   43ae1:	00 
        cpos = 0;
   43ae2:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   43ae8:	b8 00 00 00 00       	mov    $0x0,%eax
   43aed:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   43af0:	48 63 ff             	movslq %edi,%rdi
   43af3:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   43afa:	00 
   43afb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   43aff:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43b03:	e8 eb f8 ff ff       	callq  433f3 <printer_vprintf>
    return cp.cursor - console;
   43b08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43b0c:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   43b12:	48 d1 f8             	sar    %rax
}
   43b15:	c9                   	leaveq 
   43b16:	c3                   	retq   

0000000000043b17 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   43b17:	55                   	push   %rbp
   43b18:	48 89 e5             	mov    %rsp,%rbp
   43b1b:	48 83 ec 50          	sub    $0x50,%rsp
   43b1f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43b23:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43b27:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   43b2b:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43b32:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43b36:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43b3a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43b3e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   43b42:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43b46:	e8 87 ff ff ff       	callq  43ad2 <console_vprintf>
}
   43b4b:	c9                   	leaveq 
   43b4c:	c3                   	retq   

0000000000043b4d <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   43b4d:	55                   	push   %rbp
   43b4e:	48 89 e5             	mov    %rsp,%rbp
   43b51:	53                   	push   %rbx
   43b52:	48 83 ec 28          	sub    $0x28,%rsp
   43b56:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   43b59:	48 c7 45 d8 63 32 04 	movq   $0x43263,-0x28(%rbp)
   43b60:	00 
    sp.s = s;
   43b61:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   43b65:	48 85 f6             	test   %rsi,%rsi
   43b68:	75 0b                	jne    43b75 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   43b6a:	8b 45 e0             	mov    -0x20(%rbp),%eax
   43b6d:	29 d8                	sub    %ebx,%eax
}
   43b6f:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43b73:	c9                   	leaveq 
   43b74:	c3                   	retq   
        sp.end = s + size - 1;
   43b75:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   43b7a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   43b7e:	be 00 00 00 00       	mov    $0x0,%esi
   43b83:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   43b87:	e8 67 f8 ff ff       	callq  433f3 <printer_vprintf>
        *sp.s = 0;
   43b8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43b90:	c6 00 00             	movb   $0x0,(%rax)
   43b93:	eb d5                	jmp    43b6a <vsnprintf+0x1d>

0000000000043b95 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   43b95:	55                   	push   %rbp
   43b96:	48 89 e5             	mov    %rsp,%rbp
   43b99:	48 83 ec 50          	sub    $0x50,%rsp
   43b9d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43ba1:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43ba5:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43ba9:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43bb0:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43bb4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43bb8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43bbc:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   43bc0:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43bc4:	e8 84 ff ff ff       	callq  43b4d <vsnprintf>
    va_end(val);
    return n;
}
   43bc9:	c9                   	leaveq 
   43bca:	c3                   	retq   

0000000000043bcb <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43bcb:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   43bd0:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   43bd5:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43bda:	48 83 c0 02          	add    $0x2,%rax
   43bde:	48 39 d0             	cmp    %rdx,%rax
   43be1:	75 f2                	jne    43bd5 <console_clear+0xa>
    }
    cursorpos = 0;
   43be3:	c7 05 0f 54 07 00 00 	movl   $0x0,0x7540f(%rip)        # b8ffc <cursorpos>
   43bea:	00 00 00 
}
   43bed:	c3                   	retq   
