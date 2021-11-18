
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
   40028:	e9 06 02 00 00       	jmpq   40233 <kernel>
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
   400be:	e8 bd 0b 00 00       	callq  40c80 <exception>

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

0000000000040167 <free_page>:
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void free_page(uintptr_t page_ptr) {
   40167:	55                   	push   %rbp
   40168:	48 89 e5             	mov    %rsp,%rbp
   4016b:	48 83 ec 18          	sub    $0x18,%rsp
   4016f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    int pn = PAGENUMBER(page_ptr);
   40173:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40177:	48 c1 e8 0c          	shr    $0xc,%rax
   4017b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    pageinfo[pn].owner = PO_FREE;
   4017e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40181:	48 98                	cltq   
   40183:	c6 84 00 40 fe 04 00 	movb   $0x0,0x4fe40(%rax,%rax,1)
   4018a:	00 
    pageinfo[pn].refcount = 0;
   4018b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4018e:	48 98                	cltq   
   40190:	c6 84 00 41 fe 04 00 	movb   $0x0,0x4fe41(%rax,%rax,1)
   40197:	00 
}
   40198:	90                   	nop
   40199:	c9                   	leaveq 
   4019a:	c3                   	retq   

000000000004019b <free_pt>:

void free_pt(x86_64_pagetable *pt) {
   4019b:	55                   	push   %rbp
   4019c:	48 89 e5             	mov    %rsp,%rbp
   4019f:	48 83 ec 38          	sub    $0x38,%rsp
   401a3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    x86_64_pagetable *l1 = pt;
   401a7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   401ab:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pagetable *l2 = (x86_64_pagetable *) PTE_ADDR(l1->entry[0]);
   401af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   401b3:	48 8b 00             	mov    (%rax),%rax
   401b6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   401bc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    x86_64_pagetable *l3 = (x86_64_pagetable *) PTE_ADDR(l2->entry[0]);
   401c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   401c4:	48 8b 00             	mov    (%rax),%rax
   401c7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   401cd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    x86_64_pagetable *l4i = (x86_64_pagetable *) PTE_ADDR(l3->entry[0]);
   401d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   401d5:	48 8b 00             	mov    (%rax),%rax
   401d8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   401de:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    x86_64_pagetable *l4j = (x86_64_pagetable *) PTE_ADDR(l3->entry[1]);
   401e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   401e6:	48 8b 40 08          	mov    0x8(%rax),%rax
   401ea:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   401f0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    free_page((uintptr_t) l4j);
   401f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   401f8:	48 89 c7             	mov    %rax,%rdi
   401fb:	e8 67 ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l4i);
   40200:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40204:	48 89 c7             	mov    %rax,%rdi
   40207:	e8 5b ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l3);
   4020c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40210:	48 89 c7             	mov    %rax,%rdi
   40213:	e8 4f ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l2);
   40218:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4021c:	48 89 c7             	mov    %rax,%rdi
   4021f:	e8 43 ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l1);
   40224:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40228:	48 89 c7             	mov    %rax,%rdi
   4022b:	e8 37 ff ff ff       	callq  40167 <free_page>
}
   40230:	90                   	nop
   40231:	c9                   	leaveq 
   40232:	c3                   	retq   

0000000000040233 <kernel>:

void kernel(const char* command) {
   40233:	55                   	push   %rbp
   40234:	48 89 e5             	mov    %rsp,%rbp
   40237:	48 83 ec 20          	sub    $0x20,%rsp
   4023b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   4023f:	e8 ee 1d 00 00       	callq  42032 <hardware_init>
    pageinfo_init();
   40244:	e8 96 14 00 00       	callq  416df <pageinfo_init>
    console_clear();
   40249:	e8 96 42 00 00       	callq  444e4 <console_clear>
    timer_init(HZ);
   4024e:	bf 64 00 00 00       	mov    $0x64,%edi
   40253:	e8 ca 22 00 00       	callq  42522 <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   40258:	48 8b 05 a1 1d 01 00 	mov    0x11da1(%rip),%rax        # 52000 <kernel_pagetable>
   4025f:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40265:	b9 00 00 10 00       	mov    $0x100000,%ecx
   4026a:	ba 00 00 00 00       	mov    $0x0,%edx
   4026f:	be 00 00 00 00       	mov    $0x0,%esi
   40274:	48 89 c7             	mov    %rax,%rdi
   40277:	e8 f4 2f 00 00       	callq  43270 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   4027c:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   40281:	be 00 80 0b 00       	mov    $0xb8000,%esi
   40286:	48 8b 05 73 1d 01 00 	mov    0x11d73(%rip),%rax        # 52000 <kernel_pagetable>
   4028d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40293:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40298:	48 89 c7             	mov    %rax,%rdi
   4029b:	e8 d0 2f 00 00       	callq  43270 <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   402a0:	ba 00 0e 00 00       	mov    $0xe00,%edx
   402a5:	be 00 00 00 00       	mov    $0x0,%esi
   402aa:	bf 20 f0 04 00       	mov    $0x4f020,%edi
   402af:	e8 47 39 00 00       	callq  43bfb <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   402b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   402bb:	eb 44                	jmp    40301 <kernel+0xce>
        processes[i].p_pid = i;
   402bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402c0:	48 63 d0             	movslq %eax,%rdx
   402c3:	48 89 d0             	mov    %rdx,%rax
   402c6:	48 c1 e0 03          	shl    $0x3,%rax
   402ca:	48 29 d0             	sub    %rdx,%rax
   402cd:	48 c1 e0 05          	shl    $0x5,%rax
   402d1:	48 8d 90 20 f0 04 00 	lea    0x4f020(%rax),%rdx
   402d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402db:	89 02                	mov    %eax,(%rdx)
        processes[i].p_state = P_FREE;
   402dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402e0:	48 63 d0             	movslq %eax,%rdx
   402e3:	48 89 d0             	mov    %rdx,%rax
   402e6:	48 c1 e0 03          	shl    $0x3,%rax
   402ea:	48 29 d0             	sub    %rdx,%rax
   402ed:	48 c1 e0 05          	shl    $0x5,%rax
   402f1:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   402f7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    for (pid_t i = 0; i < NPROC; i++) {
   402fd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40301:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40305:	7e b6                	jle    402bd <kernel+0x8a>
    }

    if (command && strcmp(command, "fork") == 0) {
   40307:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4030c:	74 29                	je     40337 <kernel+0x104>
   4030e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40312:	be 20 45 04 00       	mov    $0x44520,%esi
   40317:	48 89 c7             	mov    %rax,%rdi
   4031a:	e8 4d 39 00 00       	callq  43c6c <strcmp>
   4031f:	85 c0                	test   %eax,%eax
   40321:	75 14                	jne    40337 <kernel+0x104>
        process_setup(1, 4);
   40323:	be 04 00 00 00       	mov    $0x4,%esi
   40328:	bf 01 00 00 00       	mov    $0x1,%edi
   4032d:	e8 39 05 00 00       	callq  4086b <process_setup>
   40332:	e9 c2 00 00 00       	jmpq   403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   40337:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4033c:	74 29                	je     40367 <kernel+0x134>
   4033e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40342:	be 25 45 04 00       	mov    $0x44525,%esi
   40347:	48 89 c7             	mov    %rax,%rdi
   4034a:	e8 1d 39 00 00       	callq  43c6c <strcmp>
   4034f:	85 c0                	test   %eax,%eax
   40351:	75 14                	jne    40367 <kernel+0x134>
        process_setup(1, 5);
   40353:	be 05 00 00 00       	mov    $0x5,%esi
   40358:	bf 01 00 00 00       	mov    $0x1,%edi
   4035d:	e8 09 05 00 00       	callq  4086b <process_setup>
   40362:	e9 92 00 00 00       	jmpq   403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   40367:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4036c:	74 26                	je     40394 <kernel+0x161>
   4036e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40372:	be 2e 45 04 00       	mov    $0x4452e,%esi
   40377:	48 89 c7             	mov    %rax,%rdi
   4037a:	e8 ed 38 00 00       	callq  43c6c <strcmp>
   4037f:	85 c0                	test   %eax,%eax
   40381:	75 11                	jne    40394 <kernel+0x161>
        process_setup(1, 6);
   40383:	be 06 00 00 00       	mov    $0x6,%esi
   40388:	bf 01 00 00 00       	mov    $0x1,%edi
   4038d:	e8 d9 04 00 00       	callq  4086b <process_setup>
   40392:	eb 65                	jmp    403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   40394:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40399:	74 39                	je     403d4 <kernel+0x1a1>
   4039b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4039f:	be 33 45 04 00       	mov    $0x44533,%esi
   403a4:	48 89 c7             	mov    %rax,%rdi
   403a7:	e8 c0 38 00 00       	callq  43c6c <strcmp>
   403ac:	85 c0                	test   %eax,%eax
   403ae:	75 24                	jne    403d4 <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   403b0:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   403b7:	eb 13                	jmp    403cc <kernel+0x199>
            process_setup(i, 6);
   403b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
   403bc:	be 06 00 00 00       	mov    $0x6,%esi
   403c1:	89 c7                	mov    %eax,%edi
   403c3:	e8 a3 04 00 00       	callq  4086b <process_setup>
        for (pid_t i = 1; i <= 2; ++i) {
   403c8:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   403cc:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   403d0:	7e e7                	jle    403b9 <kernel+0x186>
   403d2:	eb 25                	jmp    403f9 <kernel+0x1c6>
        }
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   403d4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   403db:	eb 16                	jmp    403f3 <kernel+0x1c0>
            process_setup(i, i - 1);
   403dd:	8b 45 f4             	mov    -0xc(%rbp),%eax
   403e0:	8d 50 ff             	lea    -0x1(%rax),%edx
   403e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
   403e6:	89 d6                	mov    %edx,%esi
   403e8:	89 c7                	mov    %eax,%edi
   403ea:	e8 7c 04 00 00       	callq  4086b <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   403ef:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   403f3:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   403f7:	7e e4                	jle    403dd <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   403f9:	bf 00 f1 04 00       	mov    $0x4f100,%edi
   403fe:	e8 7f 12 00 00       	callq  41682 <run>

0000000000040403 <get_free_page_number>:
}

int get_free_page_number() {
   40403:	55                   	push   %rbp
   40404:	48 89 e5             	mov    %rsp,%rbp
   40407:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   4040b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40412:	eb 1a                	jmp    4042e <get_free_page_number+0x2b>
        if (pageinfo[i].owner == PO_FREE) return i;
   40414:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40417:	48 98                	cltq   
   40419:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   40420:	00 
   40421:	84 c0                	test   %al,%al
   40423:	75 05                	jne    4042a <get_free_page_number+0x27>
   40425:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40428:	eb 12                	jmp    4043c <get_free_page_number+0x39>
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   4042a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4042e:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   40435:	7e dd                	jle    40414 <get_free_page_number+0x11>
    }
    return -1;
   40437:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4043c:	c9                   	leaveq 
   4043d:	c3                   	retq   

000000000004043e <copy_kernel_mapping>:

void copy_kernel_mapping(x86_64_pagetable *pt) {
   4043e:	55                   	push   %rbp
   4043f:	48 89 e5             	mov    %rsp,%rbp
   40442:	48 83 ec 30          	sub    $0x30,%rsp
   40446:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   4044a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40451:	eb 44                	jmp    40497 <copy_kernel_mapping+0x59>
        vamapping map = virtual_memory_lookup(kernel_pagetable, va);
   40453:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40456:	48 63 d0             	movslq %eax,%rdx
   40459:	48 8b 0d a0 1b 01 00 	mov    0x11ba0(%rip),%rcx        # 52000 <kernel_pagetable>
   40460:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   40464:	48 89 ce             	mov    %rcx,%rsi
   40467:	48 89 c7             	mov    %rax,%rdi
   4046a:	e8 d2 31 00 00       	callq  43641 <virtual_memory_lookup>
        virtual_memory_map(pt, va, map.pa, PAGESIZE, map.perm);
   4046f:	8b 4d f0             	mov    -0x10(%rbp),%ecx
   40472:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40476:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40479:	48 63 f0             	movslq %eax,%rsi
   4047c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40480:	41 89 c8             	mov    %ecx,%r8d
   40483:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40488:	48 89 c7             	mov    %rax,%rdi
   4048b:	e8 e0 2d 00 00       	callq  43270 <virtual_memory_map>
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   40490:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
   40497:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%rbp)
   4049e:	7e b3                	jle    40453 <copy_kernel_mapping+0x15>
    }
}
   404a0:	90                   	nop
   404a1:	90                   	nop
   404a2:	c9                   	leaveq 
   404a3:	c3                   	retq   

00000000000404a4 <alloc_pt>:

x86_64_pagetable *alloc_pt(pid_t pid) {
   404a4:	55                   	push   %rbp
   404a5:	48 89 e5             	mov    %rsp,%rbp
   404a8:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   404ac:	89 7d 8c             	mov    %edi,-0x74(%rbp)
    size_t sz_pt = sizeof(struct x86_64_pagetable);
   404af:	48 c7 45 f8 00 10 00 	movq   $0x1000,-0x8(%rbp)
   404b6:	00 
    int i = 5;
   404b7:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%rbp)

// L1
    int page_number = get_free_page_number();
   404be:	b8 00 00 00 00       	mov    $0x0,%eax
   404c3:	e8 3b ff ff ff       	callq  40403 <get_free_page_number>
   404c8:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) return NULL;
   404cb:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   404cf:	75 0a                	jne    404db <alloc_pt+0x37>
   404d1:	b8 00 00 00 00       	mov    $0x0,%eax
   404d6:	e9 8e 03 00 00       	jmpq   40869 <alloc_pt+0x3c5>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   404db:	8b 45 f0             	mov    -0x10(%rbp),%eax
   404de:	48 98                	cltq   
   404e0:	48 c1 e0 0c          	shl    $0xc,%rax
   404e4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   404e8:	8b 45 8c             	mov    -0x74(%rbp),%eax
   404eb:	0f be d0             	movsbl %al,%edx
   404ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   404f2:	89 d6                	mov    %edx,%esi
   404f4:	48 89 c7             	mov    %rax,%rdi
   404f7:	e8 42 05 00 00       	callq  40a3e <assign_physical_page>
   404fc:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   404ff:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40503:	75 16                	jne    4051b <alloc_pt+0x77>
        free_page(l1_addr);
   40505:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40509:	48 89 c7             	mov    %rax,%rdi
   4050c:	e8 56 fc ff ff       	callq  40167 <free_page>
        return NULL;
   40511:	b8 00 00 00 00       	mov    $0x0,%eax
   40516:	e9 4e 03 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    memset((void *) l1_addr, 0, sz_pt);
   4051b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4051f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40523:	be 00 00 00 00       	mov    $0x0,%esi
   40528:	48 89 c7             	mov    %rax,%rdi
   4052b:	e8 cb 36 00 00       	callq  43bfb <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   40530:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40534:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    
// L2
    page_number = get_free_page_number();
   40538:	b8 00 00 00 00       	mov    $0x0,%eax
   4053d:	e8 c1 fe ff ff       	callq  40403 <get_free_page_number>
   40542:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40545:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40549:	75 16                	jne    40561 <alloc_pt+0xbd>
        free_page(l1_addr);
   4054b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4054f:	48 89 c7             	mov    %rax,%rdi
   40552:	e8 10 fc ff ff       	callq  40167 <free_page>
        return NULL;
   40557:	b8 00 00 00 00       	mov    $0x0,%eax
   4055c:	e9 08 03 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   40561:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40564:	48 98                	cltq   
   40566:	48 c1 e0 0c          	shl    $0xc,%rax
   4056a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

    page_result = assign_physical_page(l2_addr, pid);
   4056e:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40571:	0f be d0             	movsbl %al,%edx
   40574:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40578:	89 d6                	mov    %edx,%esi
   4057a:	48 89 c7             	mov    %rax,%rdi
   4057d:	e8 bc 04 00 00       	callq  40a3e <assign_physical_page>
   40582:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   40585:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40589:	75 22                	jne    405ad <alloc_pt+0x109>
        free_page(l1_addr); free_page(l2_addr);
   4058b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4058f:	48 89 c7             	mov    %rax,%rdi
   40592:	e8 d0 fb ff ff       	callq  40167 <free_page>
   40597:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4059b:	48 89 c7             	mov    %rax,%rdi
   4059e:	e8 c4 fb ff ff       	callq  40167 <free_page>
        return NULL;
   405a3:	b8 00 00 00 00       	mov    $0x0,%eax
   405a8:	e9 bc 02 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    memset((void *) l2_addr, 0, sz_pt);
   405ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405b1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   405b5:	be 00 00 00 00       	mov    $0x0,%esi
   405ba:	48 89 c7             	mov    %rax,%rdi
   405bd:	e8 39 36 00 00       	callq  43bfb <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   405c2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405c6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

// L3
    page_number = get_free_page_number();
   405ca:	b8 00 00 00 00       	mov    $0x0,%eax
   405cf:	e8 2f fe ff ff       	callq  40403 <get_free_page_number>
   405d4:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   405d7:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   405db:	75 22                	jne    405ff <alloc_pt+0x15b>
        free_page(l1_addr); free_page(l2_addr);
   405dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   405e1:	48 89 c7             	mov    %rax,%rdi
   405e4:	e8 7e fb ff ff       	callq  40167 <free_page>
   405e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405ed:	48 89 c7             	mov    %rax,%rdi
   405f0:	e8 72 fb ff ff       	callq  40167 <free_page>
        return NULL;
   405f5:	b8 00 00 00 00       	mov    $0x0,%eax
   405fa:	e9 6a 02 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   405ff:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40602:	48 98                	cltq   
   40604:	48 c1 e0 0c          	shl    $0xc,%rax
   40608:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    page_result = assign_physical_page(l3_addr, pid);
   4060c:	8b 45 8c             	mov    -0x74(%rbp),%eax
   4060f:	0f be d0             	movsbl %al,%edx
   40612:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40616:	89 d6                	mov    %edx,%esi
   40618:	48 89 c7             	mov    %rax,%rdi
   4061b:	e8 1e 04 00 00       	callq  40a3e <assign_physical_page>
   40620:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   40623:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40627:	75 2e                	jne    40657 <alloc_pt+0x1b3>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr);
   40629:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4062d:	48 89 c7             	mov    %rax,%rdi
   40630:	e8 32 fb ff ff       	callq  40167 <free_page>
   40635:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40639:	48 89 c7             	mov    %rax,%rdi
   4063c:	e8 26 fb ff ff       	callq  40167 <free_page>
   40641:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40645:	48 89 c7             	mov    %rax,%rdi
   40648:	e8 1a fb ff ff       	callq  40167 <free_page>
        return NULL;
   4064d:	b8 00 00 00 00       	mov    $0x0,%eax
   40652:	e9 12 02 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    memset((void *) l3_addr, 0, sz_pt);
   40657:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4065b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4065f:	be 00 00 00 00       	mov    $0x0,%esi
   40664:	48 89 c7             	mov    %rax,%rdi
   40667:	e8 8f 35 00 00       	callq  43bfb <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   4066c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40670:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

// L4i
    page_number = get_free_page_number();
   40674:	b8 00 00 00 00       	mov    $0x0,%eax
   40679:	e8 85 fd ff ff       	callq  40403 <get_free_page_number>
   4067e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40681:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40685:	75 2e                	jne    406b5 <alloc_pt+0x211>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr);
   40687:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4068b:	48 89 c7             	mov    %rax,%rdi
   4068e:	e8 d4 fa ff ff       	callq  40167 <free_page>
   40693:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40697:	48 89 c7             	mov    %rax,%rdi
   4069a:	e8 c8 fa ff ff       	callq  40167 <free_page>
   4069f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   406a3:	48 89 c7             	mov    %rax,%rdi
   406a6:	e8 bc fa ff ff       	callq  40167 <free_page>
        return NULL;
   406ab:	b8 00 00 00 00       	mov    $0x0,%eax
   406b0:	e9 b4 01 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   406b5:	8b 45 f0             	mov    -0x10(%rbp),%eax
   406b8:	48 98                	cltq   
   406ba:	48 c1 e0 0c          	shl    $0xc,%rax
   406be:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

    page_result = assign_physical_page(l4i_addr, pid);
   406c2:	8b 45 8c             	mov    -0x74(%rbp),%eax
   406c5:	0f be d0             	movsbl %al,%edx
   406c8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406cc:	89 d6                	mov    %edx,%esi
   406ce:	48 89 c7             	mov    %rax,%rdi
   406d1:	e8 68 03 00 00       	callq  40a3e <assign_physical_page>
   406d6:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   406d9:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   406dd:	75 3a                	jne    40719 <alloc_pt+0x275>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr);
   406df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406e3:	48 89 c7             	mov    %rax,%rdi
   406e6:	e8 7c fa ff ff       	callq  40167 <free_page>
   406eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   406ef:	48 89 c7             	mov    %rax,%rdi
   406f2:	e8 70 fa ff ff       	callq  40167 <free_page>
   406f7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   406fb:	48 89 c7             	mov    %rax,%rdi
   406fe:	e8 64 fa ff ff       	callq  40167 <free_page>
   40703:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40707:	48 89 c7             	mov    %rax,%rdi
   4070a:	e8 58 fa ff ff       	callq  40167 <free_page>
        return NULL;
   4070f:	b8 00 00 00 00       	mov    $0x0,%eax
   40714:	e9 50 01 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    memset((void *) l4i_addr, 0, sz_pt);
   40719:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4071d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40721:	be 00 00 00 00       	mov    $0x0,%esi
   40726:	48 89 c7             	mov    %rax,%rdi
   40729:	e8 cd 34 00 00       	callq  43bfb <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   4072e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40732:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

// L4j
    page_number = get_free_page_number();
   40736:	b8 00 00 00 00       	mov    $0x0,%eax
   4073b:	e8 c3 fc ff ff       	callq  40403 <get_free_page_number>
   40740:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40743:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40747:	75 3a                	jne    40783 <alloc_pt+0x2df>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr);
   40749:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4074d:	48 89 c7             	mov    %rax,%rdi
   40750:	e8 12 fa ff ff       	callq  40167 <free_page>
   40755:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40759:	48 89 c7             	mov    %rax,%rdi
   4075c:	e8 06 fa ff ff       	callq  40167 <free_page>
   40761:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40765:	48 89 c7             	mov    %rax,%rdi
   40768:	e8 fa f9 ff ff       	callq  40167 <free_page>
   4076d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40771:	48 89 c7             	mov    %rax,%rdi
   40774:	e8 ee f9 ff ff       	callq  40167 <free_page>
        return NULL;
   40779:	b8 00 00 00 00       	mov    $0x0,%eax
   4077e:	e9 e6 00 00 00       	jmpq   40869 <alloc_pt+0x3c5>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   40783:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40786:	48 98                	cltq   
   40788:	48 c1 e0 0c          	shl    $0xc,%rax
   4078c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

    page_result = assign_physical_page(l4j_addr, pid);
   40790:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40793:	0f be d0             	movsbl %al,%edx
   40796:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4079a:	89 d6                	mov    %edx,%esi
   4079c:	48 89 c7             	mov    %rax,%rdi
   4079f:	e8 9a 02 00 00       	callq  40a3e <assign_physical_page>
   407a4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   407a7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   407ab:	75 43                	jne    407f0 <alloc_pt+0x34c>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr); free_page(l4j_addr);
   407ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   407b1:	48 89 c7             	mov    %rax,%rdi
   407b4:	e8 ae f9 ff ff       	callq  40167 <free_page>
   407b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   407bd:	48 89 c7             	mov    %rax,%rdi
   407c0:	e8 a2 f9 ff ff       	callq  40167 <free_page>
   407c5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   407c9:	48 89 c7             	mov    %rax,%rdi
   407cc:	e8 96 f9 ff ff       	callq  40167 <free_page>
   407d1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   407d5:	48 89 c7             	mov    %rax,%rdi
   407d8:	e8 8a f9 ff ff       	callq  40167 <free_page>
   407dd:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   407e1:	48 89 c7             	mov    %rax,%rdi
   407e4:	e8 7e f9 ff ff       	callq  40167 <free_page>
        return NULL;
   407e9:	b8 00 00 00 00       	mov    $0x0,%eax
   407ee:	eb 79                	jmp    40869 <alloc_pt+0x3c5>
    }

    memset((void *) l4j_addr, 0, sz_pt);
   407f0:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   407f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   407f8:	be 00 00 00 00       	mov    $0x0,%esi
   407fd:	48 89 c7             	mov    %rax,%rdi
   40800:	e8 f6 33 00 00       	callq  43bfb <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   40805:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40809:	48 89 45 98          	mov    %rax,-0x68(%rbp)

// Linking

    int perm = PTE_U | PTE_P | PTE_W;
   4080d:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%rbp)

    l1->entry[0] = (x86_64_pageentry_t) l2 | perm;
   40814:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40817:	48 63 d0             	movslq %eax,%rdx
   4081a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4081e:	48 09 c2             	or     %rax,%rdx
   40821:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40825:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = (x86_64_pageentry_t) l3 | perm;
   40828:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4082b:	48 63 d0             	movslq %eax,%rdx
   4082e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40832:	48 09 c2             	or     %rax,%rdx
   40835:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40839:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = (x86_64_pageentry_t) l4i | perm;
   4083c:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4083f:	48 63 d0             	movslq %eax,%rdx
   40842:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40846:	48 09 c2             	or     %rax,%rdx
   40849:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4084d:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = (x86_64_pageentry_t) l4j | perm;
   40850:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40853:	48 63 d0             	movslq %eax,%rdx
   40856:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4085a:	48 09 c2             	or     %rax,%rdx
   4085d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40861:	48 89 50 08          	mov    %rdx,0x8(%rax)

    return l1;
   40865:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
}
   40869:	c9                   	leaveq 
   4086a:	c3                   	retq   

000000000004086b <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   4086b:	55                   	push   %rbp
   4086c:	48 89 e5             	mov    %rsp,%rbp
   4086f:	48 83 ec 40          	sub    $0x40,%rsp
   40873:	89 7d cc             	mov    %edi,-0x34(%rbp)
   40876:	89 75 c8             	mov    %esi,-0x38(%rbp)
    process_init(&processes[pid], 0);
   40879:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4087c:	48 63 d0             	movslq %eax,%rdx
   4087f:	48 89 d0             	mov    %rdx,%rax
   40882:	48 c1 e0 03          	shl    $0x3,%rax
   40886:	48 29 d0             	sub    %rdx,%rax
   40889:	48 c1 e0 05          	shl    $0x5,%rax
   4088d:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   40893:	be 00 00 00 00       	mov    $0x0,%esi
   40898:	48 89 c7             	mov    %rax,%rdi
   4089b:	e8 14 1f 00 00       	callq  427b4 <process_init>

    x86_64_pagetable *pt = alloc_pt(pid);
   408a0:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408a3:	89 c7                	mov    %eax,%edi
   408a5:	e8 fa fb ff ff       	callq  404a4 <alloc_pt>
   408aa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   408ae:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   408b3:	0f 84 82 01 00 00    	je     40a3b <process_setup+0x1d0>

    processes[pid].p_pagetable = pt;
   408b9:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408bc:	48 63 d0             	movslq %eax,%rdx
   408bf:	48 89 d0             	mov    %rdx,%rax
   408c2:	48 c1 e0 03          	shl    $0x3,%rax
   408c6:	48 29 d0             	sub    %rdx,%rax
   408c9:	48 c1 e0 05          	shl    $0x5,%rax
   408cd:	48 8d 90 f0 f0 04 00 	lea    0x4f0f0(%rax),%rdx
   408d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408d8:	48 89 02             	mov    %rax,(%rdx)
    copy_kernel_mapping(pt);
   408db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408df:	48 89 c7             	mov    %rax,%rdi
   408e2:	e8 57 fb ff ff       	callq  4043e <copy_kernel_mapping>
    int r = program_load(&processes[pid], program_number, NULL);
   408e7:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408ea:	48 63 d0             	movslq %eax,%rdx
   408ed:	48 89 d0             	mov    %rdx,%rax
   408f0:	48 c1 e0 03          	shl    $0x3,%rax
   408f4:	48 29 d0             	sub    %rdx,%rax
   408f7:	48 c1 e0 05          	shl    $0x5,%rax
   408fb:	48 8d 88 20 f0 04 00 	lea    0x4f020(%rax),%rcx
   40902:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40905:	ba 00 00 00 00       	mov    $0x0,%edx
   4090a:	89 c6                	mov    %eax,%esi
   4090c:	48 89 cf             	mov    %rcx,%rdi
   4090f:	e8 24 2e 00 00       	callq  43738 <program_load>
   40914:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   40917:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   4091b:	79 14                	jns    40931 <process_setup+0xc6>
   4091d:	ba 39 45 04 00       	mov    $0x44539,%edx
   40922:	be 15 01 00 00       	mov    $0x115,%esi
   40927:	bf 40 45 04 00       	mov    $0x44540,%edi
   4092c:	e8 40 26 00 00       	callq  42f71 <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   40931:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40934:	48 63 d0             	movslq %eax,%rdx
   40937:	48 89 d0             	mov    %rdx,%rax
   4093a:	48 c1 e0 03          	shl    $0x3,%rax
   4093e:	48 29 d0             	sub    %rdx,%rax
   40941:	48 c1 e0 05          	shl    $0x5,%rax
   40945:	48 05 d8 f0 04 00    	add    $0x4f0d8,%rax
   4094b:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40952:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40955:	48 63 d0             	movslq %eax,%rdx
   40958:	48 89 d0             	mov    %rdx,%rax
   4095b:	48 c1 e0 03          	shl    $0x3,%rax
   4095f:	48 29 d0             	sub    %rdx,%rax
   40962:	48 c1 e0 05          	shl    $0x5,%rax
   40966:	48 05 d8 f0 04 00    	add    $0x4f0d8,%rax
   4096c:	48 8b 00             	mov    (%rax),%rax
   4096f:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   40975:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int stack_page_number = get_free_page_number();
   40979:	b8 00 00 00 00       	mov    $0x0,%eax
   4097e:	e8 80 fa ff ff       	callq  40403 <get_free_page_number>
   40983:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (stack_page_number == -1) {
   40986:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4098a:	75 11                	jne    4099d <process_setup+0x132>
        free_pt(pt);
   4098c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40990:	48 89 c7             	mov    %rax,%rdi
   40993:	e8 03 f8 ff ff       	callq  4019b <free_pt>
        return;
   40998:	e9 9f 00 00 00       	jmpq   40a3c <process_setup+0x1d1>
    }
    uintptr_t stack_addr = PAGEADDRESS(stack_page_number);
   4099d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   409a0:	48 98                	cltq   
   409a2:	48 c1 e0 0c          	shl    $0xc,%rax
   409a6:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int assign_status = assign_physical_page(stack_addr, pid);
   409aa:	8b 45 cc             	mov    -0x34(%rbp),%eax
   409ad:	0f be d0             	movsbl %al,%edx
   409b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409b4:	89 d6                	mov    %edx,%esi
   409b6:	48 89 c7             	mov    %rax,%rdi
   409b9:	e8 80 00 00 00       	callq  40a3e <assign_physical_page>
   409be:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (assign_status == -1) {
   409c1:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   409c5:	75 1a                	jne    409e1 <process_setup+0x176>
        free_pt(pt); free_page(stack_addr);
   409c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409cb:	48 89 c7             	mov    %rax,%rdi
   409ce:	e8 c8 f7 ff ff       	callq  4019b <free_pt>
   409d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409d7:	48 89 c7             	mov    %rax,%rdi
   409da:	e8 88 f7 ff ff       	callq  40167 <free_page>
        return;
   409df:	eb 5b                	jmp    40a3c <process_setup+0x1d1>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_addr,
   409e1:	8b 45 cc             	mov    -0x34(%rbp),%eax
   409e4:	48 63 d0             	movslq %eax,%rdx
   409e7:	48 89 d0             	mov    %rdx,%rax
   409ea:	48 c1 e0 03          	shl    $0x3,%rax
   409ee:	48 29 d0             	sub    %rdx,%rax
   409f1:	48 c1 e0 05          	shl    $0x5,%rax
   409f5:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   409fb:	48 8b 00             	mov    (%rax),%rax
   409fe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40a02:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   40a06:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40a0c:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40a11:	48 89 c7             	mov    %rax,%rdi
   40a14:	e8 57 28 00 00       	callq  43270 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   40a19:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40a1c:	48 63 d0             	movslq %eax,%rdx
   40a1f:	48 89 d0             	mov    %rdx,%rax
   40a22:	48 c1 e0 03          	shl    $0x3,%rax
   40a26:	48 29 d0             	sub    %rdx,%rax
   40a29:	48 c1 e0 05          	shl    $0x5,%rax
   40a2d:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   40a33:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   40a39:	eb 01                	jmp    40a3c <process_setup+0x1d1>
    if (pt == NULL) return;
   40a3b:	90                   	nop
}
   40a3c:	c9                   	leaveq 
   40a3d:	c3                   	retq   

0000000000040a3e <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   40a3e:	55                   	push   %rbp
   40a3f:	48 89 e5             	mov    %rsp,%rbp
   40a42:	48 83 ec 10          	sub    $0x10,%rsp
   40a46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40a4a:	89 f0                	mov    %esi,%eax
   40a4c:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   40a4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a53:	25 ff 0f 00 00       	and    $0xfff,%eax
   40a58:	48 85 c0             	test   %rax,%rax
   40a5b:	75 20                	jne    40a7d <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   40a5d:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40a64:	00 
   40a65:	77 16                	ja     40a7d <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   40a67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a6b:	48 c1 e8 0c          	shr    $0xc,%rax
   40a6f:	48 98                	cltq   
   40a71:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   40a78:	00 
   40a79:	84 c0                	test   %al,%al
   40a7b:	74 07                	je     40a84 <assign_physical_page+0x46>
        return -1;
   40a7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40a82:	eb 2c                	jmp    40ab0 <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   40a84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a88:	48 c1 e8 0c          	shr    $0xc,%rax
   40a8c:	48 98                	cltq   
   40a8e:	c6 84 00 41 fe 04 00 	movb   $0x1,0x4fe41(%rax,%rax,1)
   40a95:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40a96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a9a:	48 c1 e8 0c          	shr    $0xc,%rax
   40a9e:	48 98                	cltq   
   40aa0:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   40aa4:	88 94 00 40 fe 04 00 	mov    %dl,0x4fe40(%rax,%rax,1)
        return 0;
   40aab:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40ab0:	c9                   	leaveq 
   40ab1:	c3                   	retq   

0000000000040ab2 <syscall_mapping>:

void syscall_mapping(proc* p){
   40ab2:	55                   	push   %rbp
   40ab3:	48 89 e5             	mov    %rsp,%rbp
   40ab6:	48 83 ec 70          	sub    $0x70,%rsp
   40aba:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40abe:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ac2:	48 8b 40 38          	mov    0x38(%rax),%rax
   40ac6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40aca:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ace:	48 8b 40 30          	mov    0x30(%rax),%rax
   40ad2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40ad6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ada:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40ae1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40ae5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40ae9:	48 89 ce             	mov    %rcx,%rsi
   40aec:	48 89 c7             	mov    %rax,%rdi
   40aef:	e8 4d 2b 00 00       	callq  43641 <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   40af4:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40af7:	48 98                	cltq   
   40af9:	83 e0 06             	and    $0x6,%eax
   40afc:	48 83 f8 06          	cmp    $0x6,%rax
   40b00:	75 73                	jne    40b75 <syscall_mapping+0xc3>
    return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   40b02:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40b06:	48 83 c0 17          	add    $0x17,%rax
   40b0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40b0e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40b12:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b19:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40b1d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40b21:	48 89 ce             	mov    %rcx,%rsi
   40b24:	48 89 c7             	mov    %rax,%rdi
   40b27:	e8 15 2b 00 00       	callq  43641 <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   40b2c:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40b2f:	48 98                	cltq   
   40b31:	83 e0 03             	and    $0x3,%eax
   40b34:	48 83 f8 03          	cmp    $0x3,%rax
   40b38:	75 3e                	jne    40b78 <syscall_mapping+0xc6>
    return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40b3a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40b3e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b45:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40b49:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40b4d:	48 89 ce             	mov    %rcx,%rsi
   40b50:	48 89 c7             	mov    %rax,%rdi
   40b53:	e8 e9 2a 00 00       	callq  43641 <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40b58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40b5c:	48 89 c1             	mov    %rax,%rcx
   40b5f:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40b63:	ba 18 00 00 00       	mov    $0x18,%edx
   40b68:	48 89 c6             	mov    %rax,%rsi
   40b6b:	48 89 cf             	mov    %rcx,%rdi
   40b6e:	e8 1f 30 00 00       	callq  43b92 <memcpy>
   40b73:	eb 04                	jmp    40b79 <syscall_mapping+0xc7>
    return;
   40b75:	90                   	nop
   40b76:	eb 01                	jmp    40b79 <syscall_mapping+0xc7>
    return;
   40b78:	90                   	nop
}
   40b79:	c9                   	leaveq 
   40b7a:	c3                   	retq   

0000000000040b7b <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40b7b:	55                   	push   %rbp
   40b7c:	48 89 e5             	mov    %rsp,%rbp
   40b7f:	48 83 ec 18          	sub    $0x18,%rsp
   40b83:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40b87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b8b:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b8f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40b92:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40b96:	75 14                	jne    40bac <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40b98:	0f b6 05 61 54 00 00 	movzbl 0x5461(%rip),%eax        # 46000 <disp_global>
   40b9f:	84 c0                	test   %al,%al
   40ba1:	0f 94 c0             	sete   %al
   40ba4:	88 05 56 54 00 00    	mov    %al,0x5456(%rip)        # 46000 <disp_global>
   40baa:	eb 36                	jmp    40be2 <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   40bac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40bb0:	78 2f                	js     40be1 <syscall_mem_tog+0x66>
   40bb2:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40bb6:	7f 29                	jg     40be1 <syscall_mem_tog+0x66>
   40bb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bbc:	8b 00                	mov    (%rax),%eax
   40bbe:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40bc1:	75 1e                	jne    40be1 <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40bc3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bc7:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40bce:	84 c0                	test   %al,%al
   40bd0:	0f 94 c0             	sete   %al
   40bd3:	89 c2                	mov    %eax,%edx
   40bd5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bd9:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40bdf:	eb 01                	jmp    40be2 <syscall_mem_tog+0x67>
            return;
   40be1:	90                   	nop
    }
}
   40be2:	c9                   	leaveq 
   40be3:	c3                   	retq   

0000000000040be4 <get_free_process_slot>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

int get_free_process_slot() {
   40be4:	55                   	push   %rbp
   40be5:	48 89 e5             	mov    %rsp,%rbp
   40be8:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 1; i < NPROC; i++) {
   40bec:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40bf3:	eb 29                	jmp    40c1e <get_free_process_slot+0x3a>
        if (processes[i].p_state == P_FREE) return i;
   40bf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40bf8:	48 63 d0             	movslq %eax,%rdx
   40bfb:	48 89 d0             	mov    %rdx,%rax
   40bfe:	48 c1 e0 03          	shl    $0x3,%rax
   40c02:	48 29 d0             	sub    %rdx,%rax
   40c05:	48 c1 e0 05          	shl    $0x5,%rax
   40c09:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   40c0f:	8b 00                	mov    (%rax),%eax
   40c11:	85 c0                	test   %eax,%eax
   40c13:	75 05                	jne    40c1a <get_free_process_slot+0x36>
   40c15:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c18:	eb 0f                	jmp    40c29 <get_free_process_slot+0x45>
    for (int i = 1; i < NPROC; i++) {
   40c1a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40c1e:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40c22:	7e d1                	jle    40bf5 <get_free_process_slot+0x11>
    }
    return -1;
   40c24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40c29:	c9                   	leaveq 
   40c2a:	c3                   	retq   

0000000000040c2b <free_process_pages>:

void free_process_pages(int pid, x86_64_pagetable *pt) {
   40c2b:	55                   	push   %rbp
   40c2c:	48 89 e5             	mov    %rsp,%rbp
   40c2f:	48 83 ec 20          	sub    $0x20,%rsp
   40c33:	89 7d ec             	mov    %edi,-0x14(%rbp)
   40c36:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40c3a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40c41:	00 
   40c42:	eb 2e                	jmp    40c72 <free_process_pages+0x47>
        if (pageinfo[PAGENUMBER(va)].owner == pid) free_page(va);
   40c44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c48:	48 c1 e8 0c          	shr    $0xc,%rax
   40c4c:	48 98                	cltq   
   40c4e:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   40c55:	00 
   40c56:	0f be c0             	movsbl %al,%eax
   40c59:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   40c5c:	75 0c                	jne    40c6a <free_process_pages+0x3f>
   40c5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c62:	48 89 c7             	mov    %rax,%rdi
   40c65:	e8 fd f4 ff ff       	callq  40167 <free_page>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40c6a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40c71:	00 
   40c72:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   40c79:	00 
   40c7a:	76 c8                	jbe    40c44 <free_process_pages+0x19>
    }
}
   40c7c:	90                   	nop
   40c7d:	90                   	nop
   40c7e:	c9                   	leaveq 
   40c7f:	c3                   	retq   

0000000000040c80 <exception>:

void exception(x86_64_registers* reg) {
   40c80:	55                   	push   %rbp
   40c81:	48 89 e5             	mov    %rsp,%rbp
   40c84:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
   40c8b:	48 89 bd 78 fe ff ff 	mov    %rdi,-0x188(%rbp)
    current->p_registers = *reg;
   40c92:	48 8b 05 67 e3 00 00 	mov    0xe367(%rip),%rax        # 4f000 <current>
   40c99:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   40ca0:	48 83 c0 08          	add    $0x8,%rax
   40ca4:	48 89 d6             	mov    %rdx,%rsi
   40ca7:	ba 18 00 00 00       	mov    $0x18,%edx
   40cac:	48 89 c7             	mov    %rax,%rdi
   40caf:	48 89 d1             	mov    %rdx,%rcx
   40cb2:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40cb5:	48 8b 05 44 13 01 00 	mov    0x11344(%rip),%rax        # 52000 <kernel_pagetable>
   40cbc:	48 89 c7             	mov    %rax,%rdi
   40cbf:	e8 7b 24 00 00       	callq  4313f <set_pagetable>
    console_show_cursor(cursorpos);
   40cc4:	8b 05 32 83 07 00    	mov    0x78332(%rip),%eax        # b8ffc <cursorpos>
   40cca:	89 c7                	mov    %eax,%edi
   40ccc:	e8 a2 1b 00 00       	callq  42873 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40cd1:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40cd8:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cdf:	48 83 f8 0e          	cmp    $0xe,%rax
   40ce3:	74 14                	je     40cf9 <exception+0x79>
   40ce5:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40cec:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cf3:	48 83 f8 0d          	cmp    $0xd,%rax
   40cf7:	75 16                	jne    40d0f <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40cf9:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40d00:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d07:	83 e0 04             	and    $0x4,%eax
   40d0a:	48 85 c0             	test   %rax,%rax
   40d0d:	74 1a                	je     40d29 <exception+0xa9>
    {
        check_virtual_memory();
   40d0f:	e8 62 0d 00 00       	callq  41a76 <check_virtual_memory>
        if(disp_global){
   40d14:	0f b6 05 e5 52 00 00 	movzbl 0x52e5(%rip),%eax        # 46000 <disp_global>
   40d1b:	84 c0                	test   %al,%al
   40d1d:	74 0a                	je     40d29 <exception+0xa9>
            memshow_physical();
   40d1f:	e8 ca 0e 00 00       	callq  41bee <memshow_physical>
            memshow_virtual_animate();
   40d24:	e8 f0 11 00 00       	callq  41f19 <memshow_virtual_animate>
        }
    }
    check_keyboard();
   40d29:	e8 22 20 00 00       	callq  42d50 <check_keyboard>
    int fail = 0;
   40d2e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)

    // Actually handle the exception.
    switch (reg->reg_intno) {
   40d35:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40d3c:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40d43:	48 83 e8 0e          	sub    $0xe,%rax
   40d47:	48 83 f8 2a          	cmp    $0x2a,%rax
   40d4b:	0f 87 84 08 00 00    	ja     415d5 <exception+0x955>
   40d51:	48 8b 04 c5 f0 45 04 	mov    0x445f0(,%rax,8),%rax
   40d58:	00 
   40d59:	ff e0                	jmpq   *%rax
    case INT_SYS_FORK:
        int child_pid = get_free_process_slot();
   40d5b:	b8 00 00 00 00       	mov    $0x0,%eax
   40d60:	e8 7f fe ff ff       	callq  40be4 <get_free_process_slot>
   40d65:	89 45 e4             	mov    %eax,-0x1c(%rbp)
        if (child_pid == -1) {
   40d68:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40d6c:	75 14                	jne    40d82 <exception+0x102>
            current->p_registers.reg_rax = -1; break;
   40d6e:	48 8b 05 8b e2 00 00 	mov    0xe28b(%rip),%rax        # 4f000 <current>
   40d75:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40d7c:	ff 
   40d7d:	e9 65 08 00 00       	jmpq   415e7 <exception+0x967>
        }

        process_init(&processes[child_pid], 0);
   40d82:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40d85:	48 63 d0             	movslq %eax,%rdx
   40d88:	48 89 d0             	mov    %rdx,%rax
   40d8b:	48 c1 e0 03          	shl    $0x3,%rax
   40d8f:	48 29 d0             	sub    %rdx,%rax
   40d92:	48 c1 e0 05          	shl    $0x5,%rax
   40d96:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   40d9c:	be 00 00 00 00       	mov    $0x0,%esi
   40da1:	48 89 c7             	mov    %rax,%rdi
   40da4:	e8 0b 1a 00 00       	callq  427b4 <process_init>
        x86_64_pagetable *child_pt = alloc_pt(child_pid);
   40da9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40dac:	89 c7                	mov    %eax,%edi
   40dae:	e8 f1 f6 ff ff       	callq  404a4 <alloc_pt>
   40db3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        if (child_pt == NULL)  {
   40db7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   40dbc:	75 0c                	jne    40dca <exception+0x14a>
            fail = 1;
   40dbe:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
            break;
   40dc5:	e9 1d 08 00 00       	jmpq   415e7 <exception+0x967>
        }

        vamapping map_;

        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40dca:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
   40dd1:	00 
   40dd2:	e9 bf 02 00 00       	jmpq   41096 <exception+0x416>
            map_ = virtual_memory_lookup(current->p_pagetable, va);
   40dd7:	48 8b 05 22 e2 00 00 	mov    0xe222(%rip),%rax        # 4f000 <current>
   40dde:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40de5:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
   40dec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40df0:	48 89 ce             	mov    %rcx,%rsi
   40df3:	48 89 c7             	mov    %rax,%rdi
   40df6:	e8 46 28 00 00       	callq  43641 <virtual_memory_lookup>
            if (map_.pn == -1) continue;
   40dfb:	8b 85 58 ff ff ff    	mov    -0xa8(%rbp),%eax
   40e01:	83 f8 ff             	cmp    $0xffffffff,%eax
   40e04:	0f 84 7d 02 00 00    	je     41087 <exception+0x407>
            if ((map_.perm & (PTE_P | PTE_U)) && !(map_.perm & PTE_W)) {
   40e0a:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40e10:	48 98                	cltq   
   40e12:	83 e0 05             	and    $0x5,%eax
   40e15:	48 85 c0             	test   %rax,%rax
   40e18:	0f 84 a5 00 00 00    	je     40ec3 <exception+0x243>
   40e1e:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40e24:	48 98                	cltq   
   40e26:	83 e0 02             	and    $0x2,%eax
   40e29:	48 85 c0             	test   %rax,%rax
   40e2c:	0f 85 91 00 00 00    	jne    40ec3 <exception+0x243>
                pageinfo[PAGENUMBER(map_.pa)].refcount++; 
   40e32:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   40e39:	48 c1 e8 0c          	shr    $0xc,%rax
   40e3d:	89 c2                	mov    %eax,%edx
   40e3f:	48 63 c2             	movslq %edx,%rax
   40e42:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   40e49:	00 
   40e4a:	83 c0 01             	add    $0x1,%eax
   40e4d:	89 c1                	mov    %eax,%ecx
   40e4f:	48 63 c2             	movslq %edx,%rax
   40e52:	88 8c 00 41 fe 04 00 	mov    %cl,0x4fe41(%rax,%rax,1)
                int map_status = virtual_memory_map(child_pt, va, map_.pa, PAGESIZE, map_.perm);
   40e59:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   40e5f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   40e66:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40e6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40e6e:	41 89 c8             	mov    %ecx,%r8d
   40e71:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40e76:	48 89 c7             	mov    %rax,%rdi
   40e79:	e8 f2 23 00 00       	callq  43270 <virtual_memory_map>
   40e7e:	89 45 d4             	mov    %eax,-0x2c(%rbp)
                if (map_status == -1) {
   40e81:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   40e85:	0f 85 ff 01 00 00    	jne    4108a <exception+0x40a>
                    free_process_pages(child_pid, child_pt);
   40e8b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40e8f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40e92:	48 89 d6             	mov    %rdx,%rsi
   40e95:	89 c7                	mov    %eax,%edi
   40e97:	e8 8f fd ff ff       	callq  40c2b <free_process_pages>
                    free_pt(child_pt);
   40e9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40ea0:	48 89 c7             	mov    %rax,%rdi
   40ea3:	e8 f3 f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40ea8:	48 8b 05 51 e1 00 00 	mov    0xe151(%rip),%rax        # 4f000 <current>
   40eaf:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40eb6:	ff 
                    fail = 1;
   40eb7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40ebe:	e9 e1 01 00 00       	jmpq   410a4 <exception+0x424>
                }
                continue;
            }
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) {
   40ec3:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40ec9:	48 98                	cltq   
   40ecb:	83 e0 04             	and    $0x4,%eax
   40ece:	48 85 c0             	test   %rax,%rax
   40ed1:	0f 84 4d 01 00 00    	je     41024 <exception+0x3a4>
   40ed7:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   40edc:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   40ee0:	0f 84 3e 01 00 00    	je     41024 <exception+0x3a4>
                int free_page_number = get_free_page_number();
   40ee6:	b8 00 00 00 00       	mov    $0x0,%eax
   40eeb:	e8 13 f5 ff ff       	callq  40403 <get_free_page_number>
   40ef0:	89 45 d0             	mov    %eax,-0x30(%rbp)
                if (free_page_number == -1) {
   40ef3:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%rbp)
   40ef7:	75 38                	jne    40f31 <exception+0x2b1>
                    free_process_pages(child_pid, child_pt);
   40ef9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40efd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f00:	48 89 d6             	mov    %rdx,%rsi
   40f03:	89 c7                	mov    %eax,%edi
   40f05:	e8 21 fd ff ff       	callq  40c2b <free_process_pages>
                    free_pt(child_pt);
   40f0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40f0e:	48 89 c7             	mov    %rax,%rdi
   40f11:	e8 85 f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40f16:	48 8b 05 e3 e0 00 00 	mov    0xe0e3(%rip),%rax        # 4f000 <current>
   40f1d:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f24:	ff 
                    fail = 1;
   40f25:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40f2c:	e9 73 01 00 00       	jmpq   410a4 <exception+0x424>
                }

                uintptr_t addr = PAGEADDRESS(free_page_number);
   40f31:	8b 45 d0             	mov    -0x30(%rbp),%eax
   40f34:	48 98                	cltq   
   40f36:	48 c1 e0 0c          	shl    $0xc,%rax
   40f3a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
                int assign_status = assign_physical_page(addr, child_pid);
   40f3e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f41:	0f be d0             	movsbl %al,%edx
   40f44:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f48:	89 d6                	mov    %edx,%esi
   40f4a:	48 89 c7             	mov    %rax,%rdi
   40f4d:	e8 ec fa ff ff       	callq  40a3e <assign_physical_page>
   40f52:	89 45 c4             	mov    %eax,-0x3c(%rbp)
                if (assign_status == -1) {
   40f55:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
   40f59:	75 44                	jne    40f9f <exception+0x31f>
                    free_page(addr);
   40f5b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f5f:	48 89 c7             	mov    %rax,%rdi
   40f62:	e8 00 f2 ff ff       	callq  40167 <free_page>
                    free_process_pages(child_pid, child_pt);
   40f67:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40f6b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f6e:	48 89 d6             	mov    %rdx,%rsi
   40f71:	89 c7                	mov    %eax,%edi
   40f73:	e8 b3 fc ff ff       	callq  40c2b <free_process_pages>
                    free_pt(child_pt);
   40f78:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40f7c:	48 89 c7             	mov    %rax,%rdi
   40f7f:	e8 17 f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40f84:	48 8b 05 75 e0 00 00 	mov    0xe075(%rip),%rax        # 4f000 <current>
   40f8b:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f92:	ff 
                    fail = 1;
   40f93:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40f9a:	e9 05 01 00 00       	jmpq   410a4 <exception+0x424>
                }
                memcpy((void *) addr, (void *) map_.pa, PAGESIZE);
   40f9f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   40fa6:	48 89 c1             	mov    %rax,%rcx
   40fa9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40fad:	ba 00 10 00 00       	mov    $0x1000,%edx
   40fb2:	48 89 ce             	mov    %rcx,%rsi
   40fb5:	48 89 c7             	mov    %rax,%rdi
   40fb8:	e8 d5 2b 00 00       	callq  43b92 <memcpy>
                int map_status = virtual_memory_map(child_pt, va, addr, PAGESIZE, map_.perm);
   40fbd:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   40fc3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40fc7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40fcb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40fcf:	41 89 c8             	mov    %ecx,%r8d
   40fd2:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40fd7:	48 89 c7             	mov    %rax,%rdi
   40fda:	e8 91 22 00 00       	callq  43270 <virtual_memory_map>
   40fdf:	89 45 c0             	mov    %eax,-0x40(%rbp)
                if (map_status == -1) {
   40fe2:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%rbp)
   40fe6:	0f 85 a1 00 00 00    	jne    4108d <exception+0x40d>
                    free_process_pages(child_pid, child_pt);
   40fec:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40ff0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40ff3:	48 89 d6             	mov    %rdx,%rsi
   40ff6:	89 c7                	mov    %eax,%edi
   40ff8:	e8 2e fc ff ff       	callq  40c2b <free_process_pages>
                    free_pt(child_pt);
   40ffd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41001:	48 89 c7             	mov    %rax,%rdi
   41004:	e8 92 f1 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   41009:	48 8b 05 f0 df 00 00 	mov    0xdff0(%rip),%rax        # 4f000 <current>
   41010:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41017:	ff 
                    fail = 1;
   41018:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   4101f:	e9 80 00 00 00       	jmpq   410a4 <exception+0x424>
                }
            } 
            else {
                int map_status = virtual_memory_map(child_pt, va, map_.pa, PAGESIZE, map_.perm);
   41024:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   4102a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   41031:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   41035:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41039:	41 89 c8             	mov    %ecx,%r8d
   4103c:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41041:	48 89 c7             	mov    %rax,%rdi
   41044:	e8 27 22 00 00       	callq  43270 <virtual_memory_map>
   41049:	89 45 bc             	mov    %eax,-0x44(%rbp)
                if (map_status == -1) {
   4104c:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%rbp)
   41050:	75 3c                	jne    4108e <exception+0x40e>
                    free_process_pages(child_pid, child_pt);
   41052:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   41056:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41059:	48 89 d6             	mov    %rdx,%rsi
   4105c:	89 c7                	mov    %eax,%edi
   4105e:	e8 c8 fb ff ff       	callq  40c2b <free_process_pages>
                    free_pt(child_pt);
   41063:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41067:	48 89 c7             	mov    %rax,%rdi
   4106a:	e8 2c f1 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1;
   4106f:	48 8b 05 8a df 00 00 	mov    0xdf8a(%rip),%rax        # 4f000 <current>
   41076:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4107d:	ff 
                    fail = 1; 
   4107e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   41085:	eb 1d                	jmp    410a4 <exception+0x424>
            if (map_.pn == -1) continue;
   41087:	90                   	nop
   41088:	eb 04                	jmp    4108e <exception+0x40e>
                continue;
   4108a:	90                   	nop
   4108b:	eb 01                	jmp    4108e <exception+0x40e>
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) {
   4108d:	90                   	nop
        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4108e:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   41095:	00 
   41096:	48 81 7d f0 ff ff 2f 	cmpq   $0x2fffff,-0x10(%rbp)
   4109d:	00 
   4109e:	0f 86 33 fd ff ff    	jbe    40dd7 <exception+0x157>
                }
            }
        }

        if (!fail) {
   410a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   410a8:	0f 85 38 05 00 00    	jne    415e6 <exception+0x966>
            processes[child_pid].p_pid = child_pid;
   410ae:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410b1:	48 63 d0             	movslq %eax,%rdx
   410b4:	48 89 d0             	mov    %rdx,%rax
   410b7:	48 c1 e0 03          	shl    $0x3,%rax
   410bb:	48 29 d0             	sub    %rdx,%rax
   410be:	48 c1 e0 05          	shl    $0x5,%rax
   410c2:	48 8d 90 20 f0 04 00 	lea    0x4f020(%rax),%rdx
   410c9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410cc:	89 02                	mov    %eax,(%rdx)
            processes[child_pid].p_registers = processes[current->p_pid].p_registers;
   410ce:	48 8b 05 2b df 00 00 	mov    0xdf2b(%rip),%rax        # 4f000 <current>
   410d5:	8b 08                	mov    (%rax),%ecx
   410d7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410da:	48 63 d0             	movslq %eax,%rdx
   410dd:	48 89 d0             	mov    %rdx,%rax
   410e0:	48 c1 e0 03          	shl    $0x3,%rax
   410e4:	48 29 d0             	sub    %rdx,%rax
   410e7:	48 c1 e0 05          	shl    $0x5,%rax
   410eb:	48 8d b0 20 f0 04 00 	lea    0x4f020(%rax),%rsi
   410f2:	48 63 d1             	movslq %ecx,%rdx
   410f5:	48 89 d0             	mov    %rdx,%rax
   410f8:	48 c1 e0 03          	shl    $0x3,%rax
   410fc:	48 29 d0             	sub    %rdx,%rax
   410ff:	48 c1 e0 05          	shl    $0x5,%rax
   41103:	48 8d 90 20 f0 04 00 	lea    0x4f020(%rax),%rdx
   4110a:	48 8d 46 08          	lea    0x8(%rsi),%rax
   4110e:	48 83 c2 08          	add    $0x8,%rdx
   41112:	b9 18 00 00 00       	mov    $0x18,%ecx
   41117:	48 89 c7             	mov    %rax,%rdi
   4111a:	48 89 d6             	mov    %rdx,%rsi
   4111d:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
            processes[child_pid].p_registers.reg_rax = 0;
   41120:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41123:	48 63 d0             	movslq %eax,%rdx
   41126:	48 89 d0             	mov    %rdx,%rax
   41129:	48 c1 e0 03          	shl    $0x3,%rax
   4112d:	48 29 d0             	sub    %rdx,%rax
   41130:	48 c1 e0 05          	shl    $0x5,%rax
   41134:	48 05 28 f0 04 00    	add    $0x4f028,%rax
   4113a:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
            processes[child_pid].p_state = processes[current->p_pid].p_state;
   41141:	48 8b 05 b8 de 00 00 	mov    0xdeb8(%rip),%rax        # 4f000 <current>
   41148:	8b 00                	mov    (%rax),%eax
   4114a:	48 63 d0             	movslq %eax,%rdx
   4114d:	48 89 d0             	mov    %rdx,%rax
   41150:	48 c1 e0 03          	shl    $0x3,%rax
   41154:	48 29 d0             	sub    %rdx,%rax
   41157:	48 c1 e0 05          	shl    $0x5,%rax
   4115b:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41161:	8b 10                	mov    (%rax),%edx
   41163:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41166:	48 63 c8             	movslq %eax,%rcx
   41169:	48 89 c8             	mov    %rcx,%rax
   4116c:	48 c1 e0 03          	shl    $0x3,%rax
   41170:	48 29 c8             	sub    %rcx,%rax
   41173:	48 c1 e0 05          	shl    $0x5,%rax
   41177:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   4117d:	89 10                	mov    %edx,(%rax)
            processes[child_pid].display_status = processes[current->p_pid].display_status;
   4117f:	48 8b 05 7a de 00 00 	mov    0xde7a(%rip),%rax        # 4f000 <current>
   41186:	8b 00                	mov    (%rax),%eax
   41188:	48 63 d0             	movslq %eax,%rdx
   4118b:	48 89 d0             	mov    %rdx,%rax
   4118e:	48 c1 e0 03          	shl    $0x3,%rax
   41192:	48 29 d0             	sub    %rdx,%rax
   41195:	48 c1 e0 05          	shl    $0x5,%rax
   41199:	48 05 f8 f0 04 00    	add    $0x4f0f8,%rax
   4119f:	0f b6 10             	movzbl (%rax),%edx
   411a2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   411a5:	48 63 c8             	movslq %eax,%rcx
   411a8:	48 89 c8             	mov    %rcx,%rax
   411ab:	48 c1 e0 03          	shl    $0x3,%rax
   411af:	48 29 c8             	sub    %rcx,%rax
   411b2:	48 c1 e0 05          	shl    $0x5,%rax
   411b6:	48 05 f8 f0 04 00    	add    $0x4f0f8,%rax
   411bc:	88 10                	mov    %dl,(%rax)
            processes[child_pid].p_pagetable = child_pt;
   411be:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   411c1:	48 63 d0             	movslq %eax,%rdx
   411c4:	48 89 d0             	mov    %rdx,%rax
   411c7:	48 c1 e0 03          	shl    $0x3,%rax
   411cb:	48 29 d0             	sub    %rdx,%rax
   411ce:	48 c1 e0 05          	shl    $0x5,%rax
   411d2:	48 8d 90 f0 f0 04 00 	lea    0x4f0f0(%rax),%rdx
   411d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   411dd:	48 89 02             	mov    %rax,(%rdx)
            processes[current->p_pid].p_registers.reg_rax = child_pid;
   411e0:	48 8b 05 19 de 00 00 	mov    0xde19(%rip),%rax        # 4f000 <current>
   411e7:	8b 00                	mov    (%rax),%eax
   411e9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   411ec:	48 63 d2             	movslq %edx,%rdx
   411ef:	48 63 c8             	movslq %eax,%rcx
   411f2:	48 89 c8             	mov    %rcx,%rax
   411f5:	48 c1 e0 03          	shl    $0x3,%rax
   411f9:	48 29 c8             	sub    %rcx,%rax
   411fc:	48 c1 e0 05          	shl    $0x5,%rax
   41200:	48 05 28 f0 04 00    	add    $0x4f028,%rax
   41206:	48 89 10             	mov    %rdx,(%rax)
        }

        break;
   41209:	e9 d8 03 00 00       	jmpq   415e6 <exception+0x966>
    case INT_SYS_EXIT:
        vamapping map__;
        for (uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4120e:	48 c7 45 e8 00 00 10 	movq   $0x100000,-0x18(%rbp)
   41215:	00 
   41216:	e9 8f 00 00 00       	jmpq   412aa <exception+0x62a>
            map__ = virtual_memory_lookup(current->p_pagetable, va);
   4121b:	48 8b 05 de dd 00 00 	mov    0xddde(%rip),%rax        # 4f000 <current>
   41222:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41229:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
   41230:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   41234:	48 89 ce             	mov    %rcx,%rsi
   41237:	48 89 c7             	mov    %rax,%rdi
   4123a:	e8 02 24 00 00       	callq  43641 <virtual_memory_lookup>
            if (map__.pn == -1) continue;
   4123f:	8b 85 40 ff ff ff    	mov    -0xc0(%rbp),%eax
   41245:	83 f8 ff             	cmp    $0xffffffff,%eax
   41248:	74 57                	je     412a1 <exception+0x621>
            pageinfo[PAGENUMBER(map__.pa)].refcount--;
   4124a:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   41251:	48 c1 e8 0c          	shr    $0xc,%rax
   41255:	89 c2                	mov    %eax,%edx
   41257:	48 63 c2             	movslq %edx,%rax
   4125a:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41261:	00 
   41262:	83 e8 01             	sub    $0x1,%eax
   41265:	89 c1                	mov    %eax,%ecx
   41267:	48 63 c2             	movslq %edx,%rax
   4126a:	88 8c 00 41 fe 04 00 	mov    %cl,0x4fe41(%rax,%rax,1)
            if (pageinfo[PAGENUMBER(map__.pa)].refcount == 0) {
   41271:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   41278:	48 c1 e8 0c          	shr    $0xc,%rax
   4127c:	48 98                	cltq   
   4127e:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41285:	00 
   41286:	84 c0                	test   %al,%al
   41288:	75 18                	jne    412a2 <exception+0x622>
                pageinfo[PAGENUMBER(map__.pa)].owner = PO_FREE;
   4128a:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   41291:	48 c1 e8 0c          	shr    $0xc,%rax
   41295:	48 98                	cltq   
   41297:	c6 84 00 40 fe 04 00 	movb   $0x0,0x4fe40(%rax,%rax,1)
   4129e:	00 
   4129f:	eb 01                	jmp    412a2 <exception+0x622>
            if (map__.pn == -1) continue;
   412a1:	90                   	nop
        for (uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   412a2:	48 81 45 e8 00 10 00 	addq   $0x1000,-0x18(%rbp)
   412a9:	00 
   412aa:	48 81 7d e8 ff ff 2f 	cmpq   $0x2fffff,-0x18(%rbp)
   412b1:	00 
   412b2:	0f 86 63 ff ff ff    	jbe    4121b <exception+0x59b>
            }
            
        }
        free_pt(current->p_pagetable);
   412b8:	48 8b 05 41 dd 00 00 	mov    0xdd41(%rip),%rax        # 4f000 <current>
   412bf:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   412c6:	48 89 c7             	mov    %rax,%rdi
   412c9:	e8 cd ee ff ff       	callq  4019b <free_pt>
        current->p_state = P_FREE;
   412ce:	48 8b 05 2b dd 00 00 	mov    0xdd2b(%rip),%rax        # 4f000 <current>
   412d5:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   412dc:	00 00 00 
        break;
   412df:	e9 03 03 00 00       	jmpq   415e7 <exception+0x967>
    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
        char msg[160];
        uintptr_t addr = current->p_registers.reg_rdi;
   412e4:	48 8b 05 15 dd 00 00 	mov    0xdd15(%rip),%rax        # 4f000 <current>
   412eb:	48 8b 40 38          	mov    0x38(%rax),%rax
   412ef:	48 89 45 90          	mov    %rax,-0x70(%rbp)
        if((void *)addr == NULL)
   412f3:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
   412f8:	75 0f                	jne    41309 <exception+0x689>
            panic(NULL);
   412fa:	bf 00 00 00 00       	mov    $0x0,%edi
   412ff:	b8 00 00 00 00       	mov    $0x0,%eax
   41304:	e8 88 1b 00 00       	callq  42e91 <panic>
        vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   41309:	48 8b 05 f0 dc 00 00 	mov    0xdcf0(%rip),%rax        # 4f000 <current>
   41310:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41317:	48 8d 85 28 ff ff ff 	lea    -0xd8(%rbp),%rax
   4131e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
   41322:	48 89 ce             	mov    %rcx,%rsi
   41325:	48 89 c7             	mov    %rax,%rdi
   41328:	e8 14 23 00 00       	callq  43641 <virtual_memory_lookup>
        memcpy(msg, (void *)map.pa, 160);
   4132d:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
   41334:	48 89 c1             	mov    %rax,%rcx
   41337:	48 8d 85 88 fe ff ff 	lea    -0x178(%rbp),%rax
   4133e:	ba a0 00 00 00       	mov    $0xa0,%edx
   41343:	48 89 ce             	mov    %rcx,%rsi
   41346:	48 89 c7             	mov    %rax,%rdi
   41349:	e8 44 28 00 00       	callq  43b92 <memcpy>
        panic(msg);
   4134e:	48 8d 85 88 fe ff ff 	lea    -0x178(%rbp),%rax
   41355:	48 89 c7             	mov    %rax,%rdi
   41358:	b8 00 00 00 00       	mov    $0x0,%eax
   4135d:	e8 2f 1b 00 00       	callq  42e91 <panic>
        }
        panic(NULL);
        break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   41362:	48 8b 05 97 dc 00 00 	mov    0xdc97(%rip),%rax        # 4f000 <current>
   41369:	8b 10                	mov    (%rax),%edx
   4136b:	48 8b 05 8e dc 00 00 	mov    0xdc8e(%rip),%rax        # 4f000 <current>
   41372:	48 63 d2             	movslq %edx,%rdx
   41375:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   41379:	e9 69 02 00 00       	jmpq   415e7 <exception+0x967>

    case INT_SYS_YIELD:
        schedule();
   4137e:	e8 8d 02 00 00       	callq  41610 <schedule>
        break;                  /* will not be reached */
   41383:	e9 5f 02 00 00       	jmpq   415e7 <exception+0x967>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   41388:	48 8b 05 71 dc 00 00 	mov    0xdc71(%rip),%rax        # 4f000 <current>
   4138f:	48 8b 40 38          	mov    0x38(%rax),%rax
   41393:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
        int pn = get_free_page_number();
   41397:	b8 00 00 00 00       	mov    $0x0,%eax
   4139c:	e8 62 f0 ff ff       	callq  40403 <get_free_page_number>
   413a1:	89 45 ac             	mov    %eax,-0x54(%rbp)
        if (pn == -1) {
   413a4:	83 7d ac ff          	cmpl   $0xffffffff,-0x54(%rbp)
   413a8:	75 2d                	jne    413d7 <exception+0x757>
            console_printf(CPOS(24, 0), 0x0C00, "Out of physical memory :(\n");
   413aa:	ba 49 45 04 00       	mov    $0x44549,%edx
   413af:	be 00 0c 00 00       	mov    $0xc00,%esi
   413b4:	bf 80 07 00 00       	mov    $0x780,%edi
   413b9:	b8 00 00 00 00       	mov    $0x0,%eax
   413be:	e8 6d 30 00 00       	callq  44430 <console_printf>
            current->p_registers.reg_rax = -1; break;
   413c3:	48 8b 05 36 dc 00 00 	mov    0xdc36(%rip),%rax        # 4f000 <current>
   413ca:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   413d1:	ff 
   413d2:	e9 10 02 00 00       	jmpq   415e7 <exception+0x967>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   413d7:	8b 45 ac             	mov    -0x54(%rbp),%eax
   413da:	48 98                	cltq   
   413dc:	48 c1 e0 0c          	shl    $0xc,%rax
   413e0:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
        if (addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   413e4:	48 81 7d b0 ff ff 0f 	cmpq   $0xfffff,-0x50(%rbp)
   413eb:	00 
   413ec:	76 18                	jbe    41406 <exception+0x786>
   413ee:	48 81 7d b0 ff ff 2f 	cmpq   $0x2fffff,-0x50(%rbp)
   413f5:	00 
   413f6:	77 0e                	ja     41406 <exception+0x786>
   413f8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   413fc:	25 ff 0f 00 00       	and    $0xfff,%eax
   41401:	48 85 c0             	test   %rax,%rax
   41404:	74 14                	je     4141a <exception+0x79a>
            current->p_registers.reg_rax = -1; break;
   41406:	48 8b 05 f3 db 00 00 	mov    0xdbf3(%rip),%rax        # 4f000 <current>
   4140d:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41414:	ff 
   41415:	e9 cd 01 00 00       	jmpq   415e7 <exception+0x967>
        }
        
        int r = assign_physical_page(pa, current->p_pid);
   4141a:	48 8b 05 df db 00 00 	mov    0xdbdf(%rip),%rax        # 4f000 <current>
   41421:	8b 00                	mov    (%rax),%eax
   41423:	0f be d0             	movsbl %al,%edx
   41426:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4142a:	89 d6                	mov    %edx,%esi
   4142c:	48 89 c7             	mov    %rax,%rdi
   4142f:	e8 0a f6 ff ff       	callq  40a3e <assign_physical_page>
   41434:	89 45 9c             	mov    %eax,-0x64(%rbp)
        if (r >= 0) {
   41437:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   4143b:	78 2b                	js     41468 <exception+0x7e8>
            virtual_memory_map(current->p_pagetable, addr, pa,
   4143d:	48 8b 05 bc db 00 00 	mov    0xdbbc(%rip),%rax        # 4f000 <current>
   41444:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   4144b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   4144f:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
   41453:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   41459:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4145e:	48 89 c7             	mov    %rax,%rdi
   41461:	e8 0a 1e 00 00       	callq  43270 <virtual_memory_map>
   41466:	eb 0c                	jmp    41474 <exception+0x7f4>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        } else free_page(pa);
   41468:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4146c:	48 89 c7             	mov    %rax,%rdi
   4146f:	e8 f3 ec ff ff       	callq  40167 <free_page>
        current->p_registers.reg_rax = r;
   41474:	48 8b 05 85 db 00 00 	mov    0xdb85(%rip),%rax        # 4f000 <current>
   4147b:	8b 55 9c             	mov    -0x64(%rbp),%edx
   4147e:	48 63 d2             	movslq %edx,%rdx
   41481:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   41485:	e9 5d 01 00 00       	jmpq   415e7 <exception+0x967>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   4148a:	48 8b 05 6f db 00 00 	mov    0xdb6f(%rip),%rax        # 4f000 <current>
   41491:	48 89 c7             	mov    %rax,%rdi
   41494:	e8 19 f6 ff ff       	callq  40ab2 <syscall_mapping>
            break;
   41499:	e9 49 01 00 00       	jmpq   415e7 <exception+0x967>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   4149e:	48 8b 05 5b db 00 00 	mov    0xdb5b(%rip),%rax        # 4f000 <current>
   414a5:	48 89 c7             	mov    %rax,%rdi
   414a8:	e8 ce f6 ff ff       	callq  40b7b <syscall_mem_tog>
        break;
   414ad:	e9 35 01 00 00       	jmpq   415e7 <exception+0x967>
    }

    case INT_TIMER:
        ++ticks;
   414b2:	8b 05 68 e9 00 00    	mov    0xe968(%rip),%eax        # 4fe20 <ticks>
   414b8:	83 c0 01             	add    $0x1,%eax
   414bb:	89 05 5f e9 00 00    	mov    %eax,0xe95f(%rip)        # 4fe20 <ticks>
        schedule();
   414c1:	e8 4a 01 00 00       	callq  41610 <schedule>
        break;                  /* will not be reached */
   414c6:	e9 1c 01 00 00       	jmpq   415e7 <exception+0x967>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   414cb:	0f 20 d0             	mov    %cr2,%rax
   414ce:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    return val;
   414d5:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   414dc:	48 89 45 88          	mov    %rax,-0x78(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   414e0:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   414e7:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   414ee:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   414f1:	48 85 c0             	test   %rax,%rax
   414f4:	74 07                	je     414fd <exception+0x87d>
   414f6:	b8 64 45 04 00       	mov    $0x44564,%eax
   414fb:	eb 05                	jmp    41502 <exception+0x882>
   414fd:	b8 6a 45 04 00       	mov    $0x4456a,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   41502:	48 89 45 80          	mov    %rax,-0x80(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   41506:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   4150d:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41514:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   41517:	48 85 c0             	test   %rax,%rax
   4151a:	74 07                	je     41523 <exception+0x8a3>
   4151c:	b8 6f 45 04 00       	mov    $0x4456f,%eax
   41521:	eb 05                	jmp    41528 <exception+0x8a8>
   41523:	b8 82 45 04 00       	mov    $0x44582,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   41528:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   4152f:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   41536:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   4153d:	83 e0 04             	and    $0x4,%eax
   41540:	48 85 c0             	test   %rax,%rax
   41543:	75 32                	jne    41577 <exception+0x8f7>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   41545:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   4154c:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   41553:	48 8b 8d 78 ff ff ff 	mov    -0x88(%rbp),%rcx
   4155a:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
   4155e:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   41562:	49 89 f0             	mov    %rsi,%r8
   41565:	48 89 c6             	mov    %rax,%rsi
   41568:	bf 90 45 04 00       	mov    $0x44590,%edi
   4156d:	b8 00 00 00 00       	mov    $0x0,%eax
   41572:	e8 1a 19 00 00       	callq  42e91 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   41577:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   4157e:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   41585:	48 8b 05 74 da 00 00 	mov    0xda74(%rip),%rax        # 4f000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   4158c:	8b 00                	mov    (%rax),%eax
   4158e:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
   41592:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   41596:	52                   	push   %rdx
   41597:	ff b5 78 ff ff ff    	pushq  -0x88(%rbp)
   4159d:	49 89 f1             	mov    %rsi,%r9
   415a0:	49 89 c8             	mov    %rcx,%r8
   415a3:	89 c1                	mov    %eax,%ecx
   415a5:	ba c0 45 04 00       	mov    $0x445c0,%edx
   415aa:	be 00 0c 00 00       	mov    $0xc00,%esi
   415af:	bf 80 07 00 00       	mov    $0x780,%edi
   415b4:	b8 00 00 00 00       	mov    $0x0,%eax
   415b9:	e8 72 2e 00 00       	callq  44430 <console_printf>
   415be:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   415c2:	48 8b 05 37 da 00 00 	mov    0xda37(%rip),%rax        # 4f000 <current>
   415c9:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   415d0:	00 00 00 
        break;
   415d3:	eb 12                	jmp    415e7 <exception+0x967>
    }

    default:
        default_exception(current);
   415d5:	48 8b 05 24 da 00 00 	mov    0xda24(%rip),%rax        # 4f000 <current>
   415dc:	48 89 c7             	mov    %rax,%rdi
   415df:	e8 bd 19 00 00       	callq  42fa1 <default_exception>
        break;                  /* will not be reached */
   415e4:	eb 01                	jmp    415e7 <exception+0x967>
        break;
   415e6:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   415e7:	48 8b 05 12 da 00 00 	mov    0xda12(%rip),%rax        # 4f000 <current>
   415ee:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   415f4:	83 f8 01             	cmp    $0x1,%eax
   415f7:	75 0f                	jne    41608 <exception+0x988>
        run(current);
   415f9:	48 8b 05 00 da 00 00 	mov    0xda00(%rip),%rax        # 4f000 <current>
   41600:	48 89 c7             	mov    %rax,%rdi
   41603:	e8 7a 00 00 00       	callq  41682 <run>
    } else {
        schedule();
   41608:	e8 03 00 00 00       	callq  41610 <schedule>
    }
}
   4160d:	90                   	nop
   4160e:	c9                   	leaveq 
   4160f:	c3                   	retq   

0000000000041610 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   41610:	55                   	push   %rbp
   41611:	48 89 e5             	mov    %rsp,%rbp
   41614:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   41618:	48 8b 05 e1 d9 00 00 	mov    0xd9e1(%rip),%rax        # 4f000 <current>
   4161f:	8b 00                	mov    (%rax),%eax
   41621:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   41624:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41627:	83 c0 01             	add    $0x1,%eax
   4162a:	99                   	cltd   
   4162b:	c1 ea 1c             	shr    $0x1c,%edx
   4162e:	01 d0                	add    %edx,%eax
   41630:	83 e0 0f             	and    $0xf,%eax
   41633:	29 d0                	sub    %edx,%eax
   41635:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   41638:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4163b:	48 63 d0             	movslq %eax,%rdx
   4163e:	48 89 d0             	mov    %rdx,%rax
   41641:	48 c1 e0 03          	shl    $0x3,%rax
   41645:	48 29 d0             	sub    %rdx,%rax
   41648:	48 c1 e0 05          	shl    $0x5,%rax
   4164c:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41652:	8b 00                	mov    (%rax),%eax
   41654:	83 f8 01             	cmp    $0x1,%eax
   41657:	75 22                	jne    4167b <schedule+0x6b>
            run(&processes[pid]);
   41659:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4165c:	48 63 d0             	movslq %eax,%rdx
   4165f:	48 89 d0             	mov    %rdx,%rax
   41662:	48 c1 e0 03          	shl    $0x3,%rax
   41666:	48 29 d0             	sub    %rdx,%rax
   41669:	48 c1 e0 05          	shl    $0x5,%rax
   4166d:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   41673:	48 89 c7             	mov    %rax,%rdi
   41676:	e8 07 00 00 00       	callq  41682 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   4167b:	e8 d0 16 00 00       	callq  42d50 <check_keyboard>
        pid = (pid + 1) % NPROC;
   41680:	eb a2                	jmp    41624 <schedule+0x14>

0000000000041682 <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   41682:	55                   	push   %rbp
   41683:	48 89 e5             	mov    %rsp,%rbp
   41686:	48 83 ec 10          	sub    $0x10,%rsp
   4168a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   4168e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41692:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   41698:	83 f8 01             	cmp    $0x1,%eax
   4169b:	74 14                	je     416b1 <run+0x2f>
   4169d:	ba 48 47 04 00       	mov    $0x44748,%edx
   416a2:	be 61 02 00 00       	mov    $0x261,%esi
   416a7:	bf 40 45 04 00       	mov    $0x44540,%edi
   416ac:	e8 c0 18 00 00       	callq  42f71 <assert_fail>
    current = p;
   416b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416b5:	48 89 05 44 d9 00 00 	mov    %rax,0xd944(%rip)        # 4f000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   416bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416c0:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   416c7:	48 89 c7             	mov    %rax,%rdi
   416ca:	e8 70 1a 00 00       	callq  4313f <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   416cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416d3:	48 83 c0 08          	add    $0x8,%rax
   416d7:	48 89 c7             	mov    %rax,%rdi
   416da:	e8 e4 e9 ff ff       	callq  400c3 <exception_return>

00000000000416df <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   416df:	55                   	push   %rbp
   416e0:	48 89 e5             	mov    %rsp,%rbp
   416e3:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   416e7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   416ee:	00 
   416ef:	e9 81 00 00 00       	jmpq   41775 <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   416f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416f8:	48 89 c7             	mov    %rax,%rdi
   416fb:	e8 ef 0e 00 00       	callq  425ef <physical_memory_isreserved>
   41700:	85 c0                	test   %eax,%eax
   41702:	74 09                	je     4170d <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   41704:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   4170b:	eb 2f                	jmp    4173c <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   4170d:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   41714:	00 
   41715:	76 0b                	jbe    41722 <pageinfo_init+0x43>
   41717:	b8 08 80 05 00       	mov    $0x58008,%eax
   4171c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41720:	72 0a                	jb     4172c <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   41722:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   41729:	00 
   4172a:	75 09                	jne    41735 <pageinfo_init+0x56>
            owner = PO_KERNEL;
   4172c:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   41733:	eb 07                	jmp    4173c <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   41735:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   4173c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41740:	48 c1 e8 0c          	shr    $0xc,%rax
   41744:	89 c1                	mov    %eax,%ecx
   41746:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41749:	89 c2                	mov    %eax,%edx
   4174b:	48 63 c1             	movslq %ecx,%rax
   4174e:	88 94 00 40 fe 04 00 	mov    %dl,0x4fe40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   41755:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41759:	0f 95 c2             	setne  %dl
   4175c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41760:	48 c1 e8 0c          	shr    $0xc,%rax
   41764:	48 98                	cltq   
   41766:	88 94 00 41 fe 04 00 	mov    %dl,0x4fe41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   4176d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41774:	00 
   41775:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4177c:	00 
   4177d:	0f 86 71 ff ff ff    	jbe    416f4 <pageinfo_init+0x15>
    }
}
   41783:	90                   	nop
   41784:	90                   	nop
   41785:	c9                   	leaveq 
   41786:	c3                   	retq   

0000000000041787 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   41787:	55                   	push   %rbp
   41788:	48 89 e5             	mov    %rsp,%rbp
   4178b:	48 83 ec 50          	sub    $0x50,%rsp
   4178f:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   41793:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41797:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4179d:	48 89 c2             	mov    %rax,%rdx
   417a0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   417a4:	48 39 c2             	cmp    %rax,%rdx
   417a7:	74 14                	je     417bd <check_page_table_mappings+0x36>
   417a9:	ba 68 47 04 00       	mov    $0x44768,%edx
   417ae:	be 8b 02 00 00       	mov    $0x28b,%esi
   417b3:	bf 40 45 04 00       	mov    $0x44540,%edi
   417b8:	e8 b4 17 00 00       	callq  42f71 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   417bd:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   417c4:	00 
   417c5:	e9 9a 00 00 00       	jmpq   41864 <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   417ca:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   417ce:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   417d2:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   417d6:	48 89 ce             	mov    %rcx,%rsi
   417d9:	48 89 c7             	mov    %rax,%rdi
   417dc:	e8 60 1e 00 00       	callq  43641 <virtual_memory_lookup>
        if (vam.pa != va) {
   417e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   417e5:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   417e9:	74 27                	je     41812 <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   417eb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   417ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417f3:	49 89 d0             	mov    %rdx,%r8
   417f6:	48 89 c1             	mov    %rax,%rcx
   417f9:	ba 87 47 04 00       	mov    $0x44787,%edx
   417fe:	be 00 c0 00 00       	mov    $0xc000,%esi
   41803:	bf e0 06 00 00       	mov    $0x6e0,%edi
   41808:	b8 00 00 00 00       	mov    $0x0,%eax
   4180d:	e8 1e 2c 00 00       	callq  44430 <console_printf>
        }
        assert(vam.pa == va);
   41812:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41816:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4181a:	74 14                	je     41830 <check_page_table_mappings+0xa9>
   4181c:	ba 91 47 04 00       	mov    $0x44791,%edx
   41821:	be 94 02 00 00       	mov    $0x294,%esi
   41826:	bf 40 45 04 00       	mov    $0x44540,%edi
   4182b:	e8 41 17 00 00       	callq  42f71 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   41830:	b8 00 60 04 00       	mov    $0x46000,%eax
   41835:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41839:	72 21                	jb     4185c <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   4183b:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4183e:	48 98                	cltq   
   41840:	83 e0 02             	and    $0x2,%eax
   41843:	48 85 c0             	test   %rax,%rax
   41846:	75 14                	jne    4185c <check_page_table_mappings+0xd5>
   41848:	ba 9e 47 04 00       	mov    $0x4479e,%edx
   4184d:	be 96 02 00 00       	mov    $0x296,%esi
   41852:	bf 40 45 04 00       	mov    $0x44540,%edi
   41857:	e8 15 17 00 00       	callq  42f71 <assert_fail>
         va += PAGESIZE) {
   4185c:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41863:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   41864:	b8 08 80 05 00       	mov    $0x58008,%eax
   41869:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4186d:	0f 82 57 ff ff ff    	jb     417ca <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   41873:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   4187a:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   4187b:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   4187f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   41883:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41887:	48 89 ce             	mov    %rcx,%rsi
   4188a:	48 89 c7             	mov    %rax,%rdi
   4188d:	e8 af 1d 00 00       	callq  43641 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   41892:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41896:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   4189a:	74 14                	je     418b0 <check_page_table_mappings+0x129>
   4189c:	ba af 47 04 00       	mov    $0x447af,%edx
   418a1:	be 9d 02 00 00       	mov    $0x29d,%esi
   418a6:	bf 40 45 04 00       	mov    $0x44540,%edi
   418ab:	e8 c1 16 00 00       	callq  42f71 <assert_fail>
    assert(vam.perm & PTE_W);
   418b0:	8b 45 e8             	mov    -0x18(%rbp),%eax
   418b3:	48 98                	cltq   
   418b5:	83 e0 02             	and    $0x2,%eax
   418b8:	48 85 c0             	test   %rax,%rax
   418bb:	75 14                	jne    418d1 <check_page_table_mappings+0x14a>
   418bd:	ba 9e 47 04 00       	mov    $0x4479e,%edx
   418c2:	be 9e 02 00 00       	mov    $0x29e,%esi
   418c7:	bf 40 45 04 00       	mov    $0x44540,%edi
   418cc:	e8 a0 16 00 00       	callq  42f71 <assert_fail>
}
   418d1:	90                   	nop
   418d2:	c9                   	leaveq 
   418d3:	c3                   	retq   

00000000000418d4 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   418d4:	55                   	push   %rbp
   418d5:	48 89 e5             	mov    %rsp,%rbp
   418d8:	48 83 ec 20          	sub    $0x20,%rsp
   418dc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   418e0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   418e3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   418e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   418e9:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   418f0:	48 8b 05 09 07 01 00 	mov    0x10709(%rip),%rax        # 52000 <kernel_pagetable>
   418f7:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   418fb:	75 67                	jne    41964 <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   418fd:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41904:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   4190b:	eb 51                	jmp    4195e <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   4190d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41910:	48 63 d0             	movslq %eax,%rdx
   41913:	48 89 d0             	mov    %rdx,%rax
   41916:	48 c1 e0 03          	shl    $0x3,%rax
   4191a:	48 29 d0             	sub    %rdx,%rax
   4191d:	48 c1 e0 05          	shl    $0x5,%rax
   41921:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41927:	8b 00                	mov    (%rax),%eax
   41929:	85 c0                	test   %eax,%eax
   4192b:	74 2d                	je     4195a <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   4192d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41930:	48 63 d0             	movslq %eax,%rdx
   41933:	48 89 d0             	mov    %rdx,%rax
   41936:	48 c1 e0 03          	shl    $0x3,%rax
   4193a:	48 29 d0             	sub    %rdx,%rax
   4193d:	48 c1 e0 05          	shl    $0x5,%rax
   41941:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41947:	48 8b 10             	mov    (%rax),%rdx
   4194a:	48 8b 05 af 06 01 00 	mov    0x106af(%rip),%rax        # 52000 <kernel_pagetable>
   41951:	48 39 c2             	cmp    %rax,%rdx
   41954:	75 04                	jne    4195a <check_page_table_ownership+0x86>
                ++expected_refcount;
   41956:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   4195a:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4195e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   41962:	7e a9                	jle    4190d <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   41964:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41967:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4196a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4196e:	be 00 00 00 00       	mov    $0x0,%esi
   41973:	48 89 c7             	mov    %rax,%rdi
   41976:	e8 03 00 00 00       	callq  4197e <check_page_table_ownership_level>
}
   4197b:	90                   	nop
   4197c:	c9                   	leaveq 
   4197d:	c3                   	retq   

000000000004197e <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   4197e:	55                   	push   %rbp
   4197f:	48 89 e5             	mov    %rsp,%rbp
   41982:	48 83 ec 30          	sub    $0x30,%rsp
   41986:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4198a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   4198d:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41990:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41997:	48 c1 e8 0c          	shr    $0xc,%rax
   4199b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   419a0:	7e 14                	jle    419b6 <check_page_table_ownership_level+0x38>
   419a2:	ba c0 47 04 00       	mov    $0x447c0,%edx
   419a7:	be bb 02 00 00       	mov    $0x2bb,%esi
   419ac:	bf 40 45 04 00       	mov    $0x44540,%edi
   419b1:	e8 bb 15 00 00       	callq  42f71 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   419b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   419ba:	48 c1 e8 0c          	shr    $0xc,%rax
   419be:	48 98                	cltq   
   419c0:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   419c7:	00 
   419c8:	0f be c0             	movsbl %al,%eax
   419cb:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   419ce:	74 14                	je     419e4 <check_page_table_ownership_level+0x66>
   419d0:	ba d8 47 04 00       	mov    $0x447d8,%edx
   419d5:	be bc 02 00 00       	mov    $0x2bc,%esi
   419da:	bf 40 45 04 00       	mov    $0x44540,%edi
   419df:	e8 8d 15 00 00       	callq  42f71 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   419e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   419e8:	48 c1 e8 0c          	shr    $0xc,%rax
   419ec:	48 98                	cltq   
   419ee:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   419f5:	00 
   419f6:	0f be c0             	movsbl %al,%eax
   419f9:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   419fc:	74 14                	je     41a12 <check_page_table_ownership_level+0x94>
   419fe:	ba 00 48 04 00       	mov    $0x44800,%edx
   41a03:	be bd 02 00 00       	mov    $0x2bd,%esi
   41a08:	bf 40 45 04 00       	mov    $0x44540,%edi
   41a0d:	e8 5f 15 00 00       	callq  42f71 <assert_fail>
    if (level < 3) {
   41a12:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41a16:	7f 5b                	jg     41a73 <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41a18:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41a1f:	eb 49                	jmp    41a6a <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   41a21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41a25:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41a28:	48 63 d2             	movslq %edx,%rdx
   41a2b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41a2f:	48 85 c0             	test   %rax,%rax
   41a32:	74 32                	je     41a66 <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   41a34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41a38:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41a3b:	48 63 d2             	movslq %edx,%rdx
   41a3e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41a42:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   41a48:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   41a4c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41a4f:	8d 70 01             	lea    0x1(%rax),%esi
   41a52:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41a55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41a59:	b9 01 00 00 00       	mov    $0x1,%ecx
   41a5e:	48 89 c7             	mov    %rax,%rdi
   41a61:	e8 18 ff ff ff       	callq  4197e <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41a66:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41a6a:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41a71:	7e ae                	jle    41a21 <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   41a73:	90                   	nop
   41a74:	c9                   	leaveq 
   41a75:	c3                   	retq   

0000000000041a76 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41a76:	55                   	push   %rbp
   41a77:	48 89 e5             	mov    %rsp,%rbp
   41a7a:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   41a7e:	8b 05 64 d6 00 00    	mov    0xd664(%rip),%eax        # 4f0e8 <processes+0xc8>
   41a84:	85 c0                	test   %eax,%eax
   41a86:	74 14                	je     41a9c <check_virtual_memory+0x26>
   41a88:	ba 30 48 04 00       	mov    $0x44830,%edx
   41a8d:	be d0 02 00 00       	mov    $0x2d0,%esi
   41a92:	bf 40 45 04 00       	mov    $0x44540,%edi
   41a97:	e8 d5 14 00 00       	callq  42f71 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41a9c:	48 8b 05 5d 05 01 00 	mov    0x1055d(%rip),%rax        # 52000 <kernel_pagetable>
   41aa3:	48 89 c7             	mov    %rax,%rdi
   41aa6:	e8 dc fc ff ff       	callq  41787 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41aab:	48 8b 05 4e 05 01 00 	mov    0x1054e(%rip),%rax        # 52000 <kernel_pagetable>
   41ab2:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41ab7:	48 89 c7             	mov    %rax,%rdi
   41aba:	e8 15 fe ff ff       	callq  418d4 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   41abf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41ac6:	e9 9c 00 00 00       	jmpq   41b67 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   41acb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ace:	48 63 d0             	movslq %eax,%rdx
   41ad1:	48 89 d0             	mov    %rdx,%rax
   41ad4:	48 c1 e0 03          	shl    $0x3,%rax
   41ad8:	48 29 d0             	sub    %rdx,%rax
   41adb:	48 c1 e0 05          	shl    $0x5,%rax
   41adf:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41ae5:	8b 00                	mov    (%rax),%eax
   41ae7:	85 c0                	test   %eax,%eax
   41ae9:	74 78                	je     41b63 <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   41aeb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41aee:	48 63 d0             	movslq %eax,%rdx
   41af1:	48 89 d0             	mov    %rdx,%rax
   41af4:	48 c1 e0 03          	shl    $0x3,%rax
   41af8:	48 29 d0             	sub    %rdx,%rax
   41afb:	48 c1 e0 05          	shl    $0x5,%rax
   41aff:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41b05:	48 8b 10             	mov    (%rax),%rdx
   41b08:	48 8b 05 f1 04 01 00 	mov    0x104f1(%rip),%rax        # 52000 <kernel_pagetable>
   41b0f:	48 39 c2             	cmp    %rax,%rdx
   41b12:	74 4f                	je     41b63 <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   41b14:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41b17:	48 63 d0             	movslq %eax,%rdx
   41b1a:	48 89 d0             	mov    %rdx,%rax
   41b1d:	48 c1 e0 03          	shl    $0x3,%rax
   41b21:	48 29 d0             	sub    %rdx,%rax
   41b24:	48 c1 e0 05          	shl    $0x5,%rax
   41b28:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41b2e:	48 8b 00             	mov    (%rax),%rax
   41b31:	48 89 c7             	mov    %rax,%rdi
   41b34:	e8 4e fc ff ff       	callq  41787 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41b39:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41b3c:	48 63 d0             	movslq %eax,%rdx
   41b3f:	48 89 d0             	mov    %rdx,%rax
   41b42:	48 c1 e0 03          	shl    $0x3,%rax
   41b46:	48 29 d0             	sub    %rdx,%rax
   41b49:	48 c1 e0 05          	shl    $0x5,%rax
   41b4d:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41b53:	48 8b 00             	mov    (%rax),%rax
   41b56:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41b59:	89 d6                	mov    %edx,%esi
   41b5b:	48 89 c7             	mov    %rax,%rdi
   41b5e:	e8 71 fd ff ff       	callq  418d4 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41b63:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41b67:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41b6b:	0f 8e 5a ff ff ff    	jle    41acb <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41b71:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41b78:	eb 67                	jmp    41be1 <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   41b7a:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b7d:	48 98                	cltq   
   41b7f:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41b86:	00 
   41b87:	84 c0                	test   %al,%al
   41b89:	7e 52                	jle    41bdd <check_virtual_memory+0x167>
   41b8b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b8e:	48 98                	cltq   
   41b90:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41b97:	00 
   41b98:	84 c0                	test   %al,%al
   41b9a:	78 41                	js     41bdd <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   41b9c:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b9f:	48 98                	cltq   
   41ba1:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41ba8:	00 
   41ba9:	0f be c0             	movsbl %al,%eax
   41bac:	48 63 d0             	movslq %eax,%rdx
   41baf:	48 89 d0             	mov    %rdx,%rax
   41bb2:	48 c1 e0 03          	shl    $0x3,%rax
   41bb6:	48 29 d0             	sub    %rdx,%rax
   41bb9:	48 c1 e0 05          	shl    $0x5,%rax
   41bbd:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41bc3:	8b 00                	mov    (%rax),%eax
   41bc5:	85 c0                	test   %eax,%eax
   41bc7:	75 14                	jne    41bdd <check_virtual_memory+0x167>
   41bc9:	ba 50 48 04 00       	mov    $0x44850,%edx
   41bce:	be e7 02 00 00       	mov    $0x2e7,%esi
   41bd3:	bf 40 45 04 00       	mov    $0x44540,%edi
   41bd8:	e8 94 13 00 00       	callq  42f71 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41bdd:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41be1:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41be8:	7e 90                	jle    41b7a <check_virtual_memory+0x104>
        }
    }
}
   41bea:	90                   	nop
   41beb:	90                   	nop
   41bec:	c9                   	leaveq 
   41bed:	c3                   	retq   

0000000000041bee <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   41bee:	55                   	push   %rbp
   41bef:	48 89 e5             	mov    %rsp,%rbp
   41bf2:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41bf6:	ba a6 48 04 00       	mov    $0x448a6,%edx
   41bfb:	be 00 0f 00 00       	mov    $0xf00,%esi
   41c00:	bf 20 00 00 00       	mov    $0x20,%edi
   41c05:	b8 00 00 00 00       	mov    $0x0,%eax
   41c0a:	e8 21 28 00 00       	callq  44430 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41c0f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41c16:	e9 f4 00 00 00       	jmpq   41d0f <memshow_physical+0x121>
        if (pn % 64 == 0) {
   41c1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c1e:	83 e0 3f             	and    $0x3f,%eax
   41c21:	85 c0                	test   %eax,%eax
   41c23:	75 3e                	jne    41c63 <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41c25:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c28:	c1 e0 0c             	shl    $0xc,%eax
   41c2b:	89 c2                	mov    %eax,%edx
   41c2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c30:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41c33:	85 c0                	test   %eax,%eax
   41c35:	0f 48 c1             	cmovs  %ecx,%eax
   41c38:	c1 f8 06             	sar    $0x6,%eax
   41c3b:	8d 48 01             	lea    0x1(%rax),%ecx
   41c3e:	89 c8                	mov    %ecx,%eax
   41c40:	c1 e0 02             	shl    $0x2,%eax
   41c43:	01 c8                	add    %ecx,%eax
   41c45:	c1 e0 04             	shl    $0x4,%eax
   41c48:	83 c0 03             	add    $0x3,%eax
   41c4b:	89 d1                	mov    %edx,%ecx
   41c4d:	ba b6 48 04 00       	mov    $0x448b6,%edx
   41c52:	be 00 0f 00 00       	mov    $0xf00,%esi
   41c57:	89 c7                	mov    %eax,%edi
   41c59:	b8 00 00 00 00       	mov    $0x0,%eax
   41c5e:	e8 cd 27 00 00       	callq  44430 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41c63:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c66:	48 98                	cltq   
   41c68:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41c6f:	00 
   41c70:	0f be c0             	movsbl %al,%eax
   41c73:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   41c76:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c79:	48 98                	cltq   
   41c7b:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41c82:	00 
   41c83:	84 c0                	test   %al,%al
   41c85:	75 07                	jne    41c8e <memshow_physical+0xa0>
            owner = PO_FREE;
   41c87:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41c8e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41c91:	83 c0 02             	add    $0x2,%eax
   41c94:	48 98                	cltq   
   41c96:	0f b7 84 00 80 48 04 	movzwl 0x44880(%rax,%rax,1),%eax
   41c9d:	00 
   41c9e:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   41ca2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ca5:	48 98                	cltq   
   41ca7:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41cae:	00 
   41caf:	3c 01                	cmp    $0x1,%al
   41cb1:	7e 1a                	jle    41ccd <memshow_physical+0xdf>
   41cb3:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41cb8:	48 c1 e8 0c          	shr    $0xc,%rax
   41cbc:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   41cbf:	74 0c                	je     41ccd <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   41cc1:	b8 53 00 00 00       	mov    $0x53,%eax
   41cc6:	80 cc 0f             	or     $0xf,%ah
   41cc9:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
        color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41ccd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41cd0:	8d 50 3f             	lea    0x3f(%rax),%edx
   41cd3:	85 c0                	test   %eax,%eax
   41cd5:	0f 48 c2             	cmovs  %edx,%eax
   41cd8:	c1 f8 06             	sar    $0x6,%eax
   41cdb:	8d 50 01             	lea    0x1(%rax),%edx
   41cde:	89 d0                	mov    %edx,%eax
   41ce0:	c1 e0 02             	shl    $0x2,%eax
   41ce3:	01 d0                	add    %edx,%eax
   41ce5:	c1 e0 04             	shl    $0x4,%eax
   41ce8:	89 c1                	mov    %eax,%ecx
   41cea:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ced:	99                   	cltd   
   41cee:	c1 ea 1a             	shr    $0x1a,%edx
   41cf1:	01 d0                	add    %edx,%eax
   41cf3:	83 e0 3f             	and    $0x3f,%eax
   41cf6:	29 d0                	sub    %edx,%eax
   41cf8:	83 c0 0c             	add    $0xc,%eax
   41cfb:	01 c8                	add    %ecx,%eax
   41cfd:	48 98                	cltq   
   41cff:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   41d03:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   41d0a:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41d0b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41d0f:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41d16:	0f 8e ff fe ff ff    	jle    41c1b <memshow_physical+0x2d>
    }
}
   41d1c:	90                   	nop
   41d1d:	90                   	nop
   41d1e:	c9                   	leaveq 
   41d1f:	c3                   	retq   

0000000000041d20 <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   41d20:	55                   	push   %rbp
   41d21:	48 89 e5             	mov    %rsp,%rbp
   41d24:	48 83 ec 40          	sub    $0x40,%rsp
   41d28:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   41d2c:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   41d30:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41d34:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41d3a:	48 89 c2             	mov    %rax,%rdx
   41d3d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41d41:	48 39 c2             	cmp    %rax,%rdx
   41d44:	74 14                	je     41d5a <memshow_virtual+0x3a>
   41d46:	ba c0 48 04 00       	mov    $0x448c0,%edx
   41d4b:	be 18 03 00 00       	mov    $0x318,%esi
   41d50:	bf 40 45 04 00       	mov    $0x44540,%edi
   41d55:	e8 17 12 00 00       	callq  42f71 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41d5a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41d5e:	48 89 c1             	mov    %rax,%rcx
   41d61:	ba ed 48 04 00       	mov    $0x448ed,%edx
   41d66:	be 00 0f 00 00       	mov    $0xf00,%esi
   41d6b:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41d70:	b8 00 00 00 00       	mov    $0x0,%eax
   41d75:	e8 b6 26 00 00       	callq  44430 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41d7a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41d81:	00 
   41d82:	e9 80 01 00 00       	jmpq   41f07 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41d87:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   41d8b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41d8f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41d93:	48 89 ce             	mov    %rcx,%rsi
   41d96:	48 89 c7             	mov    %rax,%rdi
   41d99:	e8 a3 18 00 00       	callq  43641 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   41d9e:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41da1:	85 c0                	test   %eax,%eax
   41da3:	79 0b                	jns    41db0 <memshow_virtual+0x90>
            color = ' ';
   41da5:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   41dab:	e9 d7 00 00 00       	jmpq   41e87 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41db0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41db4:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41dba:	76 14                	jbe    41dd0 <memshow_virtual+0xb0>
   41dbc:	ba 0a 49 04 00       	mov    $0x4490a,%edx
   41dc1:	be 21 03 00 00       	mov    $0x321,%esi
   41dc6:	bf 40 45 04 00       	mov    $0x44540,%edi
   41dcb:	e8 a1 11 00 00       	callq  42f71 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41dd0:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41dd3:	48 98                	cltq   
   41dd5:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41ddc:	00 
   41ddd:	0f be c0             	movsbl %al,%eax
   41de0:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41de3:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41de6:	48 98                	cltq   
   41de8:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41def:	00 
   41df0:	84 c0                	test   %al,%al
   41df2:	75 07                	jne    41dfb <memshow_virtual+0xdb>
                owner = PO_FREE;
   41df4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41dfb:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41dfe:	83 c0 02             	add    $0x2,%eax
   41e01:	48 98                	cltq   
   41e03:	0f b7 84 00 80 48 04 	movzwl 0x44880(%rax,%rax,1),%eax
   41e0a:	00 
   41e0b:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   41e0f:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41e12:	48 98                	cltq   
   41e14:	83 e0 04             	and    $0x4,%eax
   41e17:	48 85 c0             	test   %rax,%rax
   41e1a:	74 27                	je     41e43 <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41e1c:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e20:	c1 e0 04             	shl    $0x4,%eax
   41e23:	66 25 00 f0          	and    $0xf000,%ax
   41e27:	89 c2                	mov    %eax,%edx
   41e29:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e2d:	c1 f8 04             	sar    $0x4,%eax
   41e30:	66 25 00 0f          	and    $0xf00,%ax
   41e34:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   41e36:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e3a:	0f b6 c0             	movzbl %al,%eax
   41e3d:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41e3f:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   41e43:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41e46:	48 98                	cltq   
   41e48:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41e4f:	00 
   41e50:	3c 01                	cmp    $0x1,%al
   41e52:	7e 33                	jle    41e87 <memshow_virtual+0x167>
   41e54:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41e59:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41e5d:	74 28                	je     41e87 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41e5f:	b8 53 00 00 00       	mov    $0x53,%eax
   41e64:	89 c2                	mov    %eax,%edx
   41e66:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e6a:	66 25 00 f0          	and    $0xf000,%ax
   41e6e:	09 d0                	or     %edx,%eax
   41e70:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41e74:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41e77:	48 98                	cltq   
   41e79:	83 e0 04             	and    $0x4,%eax
   41e7c:	48 85 c0             	test   %rax,%rax
   41e7f:	75 06                	jne    41e87 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41e81:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
        color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41e87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e8b:	48 c1 e8 0c          	shr    $0xc,%rax
   41e8f:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41e92:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e95:	83 e0 3f             	and    $0x3f,%eax
   41e98:	85 c0                	test   %eax,%eax
   41e9a:	75 34                	jne    41ed0 <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   41e9c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e9f:	c1 e8 06             	shr    $0x6,%eax
   41ea2:	89 c2                	mov    %eax,%edx
   41ea4:	89 d0                	mov    %edx,%eax
   41ea6:	c1 e0 02             	shl    $0x2,%eax
   41ea9:	01 d0                	add    %edx,%eax
   41eab:	c1 e0 04             	shl    $0x4,%eax
   41eae:	05 73 03 00 00       	add    $0x373,%eax
   41eb3:	89 c7                	mov    %eax,%edi
   41eb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41eb9:	48 89 c1             	mov    %rax,%rcx
   41ebc:	ba b6 48 04 00       	mov    $0x448b6,%edx
   41ec1:	be 00 0f 00 00       	mov    $0xf00,%esi
   41ec6:	b8 00 00 00 00       	mov    $0x0,%eax
   41ecb:	e8 60 25 00 00       	callq  44430 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41ed0:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ed3:	c1 e8 06             	shr    $0x6,%eax
   41ed6:	89 c2                	mov    %eax,%edx
   41ed8:	89 d0                	mov    %edx,%eax
   41eda:	c1 e0 02             	shl    $0x2,%eax
   41edd:	01 d0                	add    %edx,%eax
   41edf:	c1 e0 04             	shl    $0x4,%eax
   41ee2:	89 c2                	mov    %eax,%edx
   41ee4:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ee7:	83 e0 3f             	and    $0x3f,%eax
   41eea:	01 d0                	add    %edx,%eax
   41eec:	05 7c 03 00 00       	add    $0x37c,%eax
   41ef1:	89 c2                	mov    %eax,%edx
   41ef3:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41ef7:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   41efe:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41eff:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41f06:	00 
   41f07:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41f0e:	00 
   41f0f:	0f 86 72 fe ff ff    	jbe    41d87 <memshow_virtual+0x67>
    }
}
   41f15:	90                   	nop
   41f16:	90                   	nop
   41f17:	c9                   	leaveq 
   41f18:	c3                   	retq   

0000000000041f19 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41f19:	55                   	push   %rbp
   41f1a:	48 89 e5             	mov    %rsp,%rbp
   41f1d:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41f21:	8b 05 19 e3 00 00    	mov    0xe319(%rip),%eax        # 50240 <last_ticks.1>
   41f27:	85 c0                	test   %eax,%eax
   41f29:	74 13                	je     41f3e <memshow_virtual_animate+0x25>
   41f2b:	8b 05 ef de 00 00    	mov    0xdeef(%rip),%eax        # 4fe20 <ticks>
   41f31:	8b 15 09 e3 00 00    	mov    0xe309(%rip),%edx        # 50240 <last_ticks.1>
   41f37:	29 d0                	sub    %edx,%eax
   41f39:	83 f8 31             	cmp    $0x31,%eax
   41f3c:	76 2c                	jbe    41f6a <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   41f3e:	8b 05 dc de 00 00    	mov    0xdedc(%rip),%eax        # 4fe20 <ticks>
   41f44:	89 05 f6 e2 00 00    	mov    %eax,0xe2f6(%rip)        # 50240 <last_ticks.1>
        ++showing;
   41f4a:	8b 05 b4 40 00 00    	mov    0x40b4(%rip),%eax        # 46004 <showing.0>
   41f50:	83 c0 01             	add    $0x1,%eax
   41f53:	89 05 ab 40 00 00    	mov    %eax,0x40ab(%rip)        # 46004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   41f59:	eb 0f                	jmp    41f6a <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   41f5b:	8b 05 a3 40 00 00    	mov    0x40a3(%rip),%eax        # 46004 <showing.0>
   41f61:	83 c0 01             	add    $0x1,%eax
   41f64:	89 05 9a 40 00 00    	mov    %eax,0x409a(%rip)        # 46004 <showing.0>
    while (showing <= 2*NPROC
   41f6a:	8b 05 94 40 00 00    	mov    0x4094(%rip),%eax        # 46004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   41f70:	83 f8 20             	cmp    $0x20,%eax
   41f73:	7f 2e                	jg     41fa3 <memshow_virtual_animate+0x8a>
   41f75:	8b 05 89 40 00 00    	mov    0x4089(%rip),%eax        # 46004 <showing.0>
   41f7b:	99                   	cltd   
   41f7c:	c1 ea 1c             	shr    $0x1c,%edx
   41f7f:	01 d0                	add    %edx,%eax
   41f81:	83 e0 0f             	and    $0xf,%eax
   41f84:	29 d0                	sub    %edx,%eax
   41f86:	48 63 d0             	movslq %eax,%rdx
   41f89:	48 89 d0             	mov    %rdx,%rax
   41f8c:	48 c1 e0 03          	shl    $0x3,%rax
   41f90:	48 29 d0             	sub    %rdx,%rax
   41f93:	48 c1 e0 05          	shl    $0x5,%rax
   41f97:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41f9d:	8b 00                	mov    (%rax),%eax
   41f9f:	85 c0                	test   %eax,%eax
   41fa1:	74 b8                	je     41f5b <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41fa3:	8b 05 5b 40 00 00    	mov    0x405b(%rip),%eax        # 46004 <showing.0>
   41fa9:	99                   	cltd   
   41faa:	c1 ea 1c             	shr    $0x1c,%edx
   41fad:	01 d0                	add    %edx,%eax
   41faf:	83 e0 0f             	and    $0xf,%eax
   41fb2:	29 d0                	sub    %edx,%eax
   41fb4:	89 05 4a 40 00 00    	mov    %eax,0x404a(%rip)        # 46004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41fba:	8b 05 44 40 00 00    	mov    0x4044(%rip),%eax        # 46004 <showing.0>
   41fc0:	48 63 d0             	movslq %eax,%rdx
   41fc3:	48 89 d0             	mov    %rdx,%rax
   41fc6:	48 c1 e0 03          	shl    $0x3,%rax
   41fca:	48 29 d0             	sub    %rdx,%rax
   41fcd:	48 c1 e0 05          	shl    $0x5,%rax
   41fd1:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41fd7:	8b 00                	mov    (%rax),%eax
   41fd9:	85 c0                	test   %eax,%eax
   41fdb:	74 52                	je     4202f <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41fdd:	8b 15 21 40 00 00    	mov    0x4021(%rip),%edx        # 46004 <showing.0>
   41fe3:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41fe7:	89 d1                	mov    %edx,%ecx
   41fe9:	ba 24 49 04 00       	mov    $0x44924,%edx
   41fee:	be 04 00 00 00       	mov    $0x4,%esi
   41ff3:	48 89 c7             	mov    %rax,%rdi
   41ff6:	b8 00 00 00 00       	mov    $0x0,%eax
   41ffb:	e8 ae 24 00 00       	callq  444ae <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   42000:	8b 05 fe 3f 00 00    	mov    0x3ffe(%rip),%eax        # 46004 <showing.0>
   42006:	48 63 d0             	movslq %eax,%rdx
   42009:	48 89 d0             	mov    %rdx,%rax
   4200c:	48 c1 e0 03          	shl    $0x3,%rax
   42010:	48 29 d0             	sub    %rdx,%rax
   42013:	48 c1 e0 05          	shl    $0x5,%rax
   42017:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   4201d:	48 8b 00             	mov    (%rax),%rax
   42020:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   42024:	48 89 d6             	mov    %rdx,%rsi
   42027:	48 89 c7             	mov    %rax,%rdi
   4202a:	e8 f1 fc ff ff       	callq  41d20 <memshow_virtual>
    }
}
   4202f:	90                   	nop
   42030:	c9                   	leaveq 
   42031:	c3                   	retq   

0000000000042032 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   42032:	55                   	push   %rbp
   42033:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   42036:	e8 53 01 00 00       	callq  4218e <segments_init>
    interrupt_init();
   4203b:	e8 d4 03 00 00       	callq  42414 <interrupt_init>
    virtual_memory_init();
   42040:	e8 e7 0f 00 00       	callq  4302c <virtual_memory_init>
}
   42045:	90                   	nop
   42046:	5d                   	pop    %rbp
   42047:	c3                   	retq   

0000000000042048 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   42048:	55                   	push   %rbp
   42049:	48 89 e5             	mov    %rsp,%rbp
   4204c:	48 83 ec 18          	sub    $0x18,%rsp
   42050:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42054:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42058:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   4205b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4205e:	48 98                	cltq   
   42060:	48 c1 e0 2d          	shl    $0x2d,%rax
   42064:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   42068:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   4206f:	90 00 00 
   42072:	48 09 c2             	or     %rax,%rdx
    *segment = type
   42075:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42079:	48 89 10             	mov    %rdx,(%rax)
}
   4207c:	90                   	nop
   4207d:	c9                   	leaveq 
   4207e:	c3                   	retq   

000000000004207f <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   4207f:	55                   	push   %rbp
   42080:	48 89 e5             	mov    %rsp,%rbp
   42083:	48 83 ec 28          	sub    $0x28,%rsp
   42087:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4208b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4208f:	89 55 ec             	mov    %edx,-0x14(%rbp)
   42092:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   42096:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   4209a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4209e:	48 c1 e0 10          	shl    $0x10,%rax
   420a2:	48 89 c2             	mov    %rax,%rdx
   420a5:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   420ac:	00 00 00 
   420af:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   420b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   420b6:	48 c1 e0 20          	shl    $0x20,%rax
   420ba:	48 89 c1             	mov    %rax,%rcx
   420bd:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   420c4:	00 00 ff 
   420c7:	48 21 c8             	and    %rcx,%rax
   420ca:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   420cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   420d1:	48 83 e8 01          	sub    $0x1,%rax
   420d5:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   420d8:	48 09 d0             	or     %rdx,%rax
        | type
   420db:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   420df:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   420e2:	8b 45 ec             	mov    -0x14(%rbp),%eax
   420e5:	48 98                	cltq   
   420e7:	48 c1 e0 2d          	shl    $0x2d,%rax
   420eb:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   420ee:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   420f5:	80 00 00 
   420f8:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   420fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420ff:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   42102:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42106:	48 83 c0 08          	add    $0x8,%rax
   4210a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4210e:	48 c1 ea 20          	shr    $0x20,%rdx
   42112:	48 89 10             	mov    %rdx,(%rax)
}
   42115:	90                   	nop
   42116:	c9                   	leaveq 
   42117:	c3                   	retq   

0000000000042118 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   42118:	55                   	push   %rbp
   42119:	48 89 e5             	mov    %rsp,%rbp
   4211c:	48 83 ec 20          	sub    $0x20,%rsp
   42120:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42124:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42128:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4212b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4212f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42133:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   42136:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   4213a:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   4213d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42140:	48 98                	cltq   
   42142:	48 c1 e0 2d          	shl    $0x2d,%rax
   42146:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   42149:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4214d:	48 c1 e0 20          	shl    $0x20,%rax
   42151:	48 89 c1             	mov    %rax,%rcx
   42154:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   4215b:	00 ff ff 
   4215e:	48 21 c8             	and    %rcx,%rax
   42161:	48 09 c2             	or     %rax,%rdx
   42164:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   4216b:	80 00 00 
   4216e:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   42171:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42175:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   42178:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4217c:	48 c1 e8 20          	shr    $0x20,%rax
   42180:	48 89 c2             	mov    %rax,%rdx
   42183:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42187:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   4218b:	90                   	nop
   4218c:	c9                   	leaveq 
   4218d:	c3                   	retq   

000000000004218e <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   4218e:	55                   	push   %rbp
   4218f:	48 89 e5             	mov    %rsp,%rbp
   42192:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   42196:	48 c7 05 bf e0 00 00 	movq   $0x0,0xe0bf(%rip)        # 50260 <segments>
   4219d:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   421a1:	ba 00 00 00 00       	mov    $0x0,%edx
   421a6:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   421ad:	08 20 00 
   421b0:	48 89 c6             	mov    %rax,%rsi
   421b3:	bf 68 02 05 00       	mov    $0x50268,%edi
   421b8:	e8 8b fe ff ff       	callq  42048 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   421bd:	ba 03 00 00 00       	mov    $0x3,%edx
   421c2:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   421c9:	08 20 00 
   421cc:	48 89 c6             	mov    %rax,%rsi
   421cf:	bf 70 02 05 00       	mov    $0x50270,%edi
   421d4:	e8 6f fe ff ff       	callq  42048 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   421d9:	ba 00 00 00 00       	mov    $0x0,%edx
   421de:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   421e5:	02 00 00 
   421e8:	48 89 c6             	mov    %rax,%rsi
   421eb:	bf 78 02 05 00       	mov    $0x50278,%edi
   421f0:	e8 53 fe ff ff       	callq  42048 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   421f5:	ba 03 00 00 00       	mov    $0x3,%edx
   421fa:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   42201:	02 00 00 
   42204:	48 89 c6             	mov    %rax,%rsi
   42207:	bf 80 02 05 00       	mov    $0x50280,%edi
   4220c:	e8 37 fe ff ff       	callq  42048 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   42211:	b8 a0 12 05 00       	mov    $0x512a0,%eax
   42216:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   4221c:	48 89 c1             	mov    %rax,%rcx
   4221f:	ba 00 00 00 00       	mov    $0x0,%edx
   42224:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   4222b:	09 00 00 
   4222e:	48 89 c6             	mov    %rax,%rsi
   42231:	bf 88 02 05 00       	mov    $0x50288,%edi
   42236:	e8 44 fe ff ff       	callq  4207f <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   4223b:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   42241:	b8 60 02 05 00       	mov    $0x50260,%eax
   42246:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   4224a:	ba 60 00 00 00       	mov    $0x60,%edx
   4224f:	be 00 00 00 00       	mov    $0x0,%esi
   42254:	bf a0 12 05 00       	mov    $0x512a0,%edi
   42259:	e8 9d 19 00 00       	callq  43bfb <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   4225e:	48 c7 05 3b f0 00 00 	movq   $0x80000,0xf03b(%rip)        # 512a4 <kernel_task_descriptor+0x4>
   42265:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   42269:	ba 00 10 00 00       	mov    $0x1000,%edx
   4226e:	be 00 00 00 00       	mov    $0x0,%esi
   42273:	bf a0 02 05 00       	mov    $0x502a0,%edi
   42278:	e8 7e 19 00 00       	callq  43bfb <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   4227d:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   42284:	eb 30                	jmp    422b6 <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   42286:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   4228b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4228e:	48 c1 e0 04          	shl    $0x4,%rax
   42292:	48 05 a0 02 05 00    	add    $0x502a0,%rax
   42298:	48 89 d1             	mov    %rdx,%rcx
   4229b:	ba 00 00 00 00       	mov    $0x0,%edx
   422a0:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   422a7:	0e 00 00 
   422aa:	48 89 c7             	mov    %rax,%rdi
   422ad:	e8 66 fe ff ff       	callq  42118 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   422b2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   422b6:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   422bd:	76 c7                	jbe    42286 <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   422bf:	b8 36 00 04 00       	mov    $0x40036,%eax
   422c4:	48 89 c1             	mov    %rax,%rcx
   422c7:	ba 00 00 00 00       	mov    $0x0,%edx
   422cc:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   422d3:	0e 00 00 
   422d6:	48 89 c6             	mov    %rax,%rsi
   422d9:	bf a0 04 05 00       	mov    $0x504a0,%edi
   422de:	e8 35 fe ff ff       	callq  42118 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   422e3:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   422e8:	48 89 c1             	mov    %rax,%rcx
   422eb:	ba 00 00 00 00       	mov    $0x0,%edx
   422f0:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   422f7:	0e 00 00 
   422fa:	48 89 c6             	mov    %rax,%rsi
   422fd:	bf 70 03 05 00       	mov    $0x50370,%edi
   42302:	e8 11 fe ff ff       	callq  42118 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   42307:	b8 32 00 04 00       	mov    $0x40032,%eax
   4230c:	48 89 c1             	mov    %rax,%rcx
   4230f:	ba 00 00 00 00       	mov    $0x0,%edx
   42314:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   4231b:	0e 00 00 
   4231e:	48 89 c6             	mov    %rax,%rsi
   42321:	bf 80 03 05 00       	mov    $0x50380,%edi
   42326:	e8 ed fd ff ff       	callq  42118 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   4232b:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   42332:	eb 3e                	jmp    42372 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   42334:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42337:	83 e8 30             	sub    $0x30,%eax
   4233a:	89 c0                	mov    %eax,%eax
   4233c:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   42343:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   42344:	48 89 c2             	mov    %rax,%rdx
   42347:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4234a:	48 c1 e0 04          	shl    $0x4,%rax
   4234e:	48 05 a0 02 05 00    	add    $0x502a0,%rax
   42354:	48 89 d1             	mov    %rdx,%rcx
   42357:	ba 03 00 00 00       	mov    $0x3,%edx
   4235c:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   42363:	0e 00 00 
   42366:	48 89 c7             	mov    %rax,%rdi
   42369:	e8 aa fd ff ff       	callq  42118 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   4236e:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42372:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   42376:	76 bc                	jbe    42334 <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   42378:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   4237e:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   42383:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   42387:	b8 28 00 00 00       	mov    $0x28,%eax
   4238c:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   42390:	0f 00 d8             	ltr    %ax
   42393:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   42397:	0f 20 c0             	mov    %cr0,%rax
   4239a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   4239e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   423a2:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   423a5:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   423ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
   423af:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   423b2:	8b 45 f0             	mov    -0x10(%rbp),%eax
   423b5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   423b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   423bd:	0f 22 c0             	mov    %rax,%cr0
}
   423c0:	90                   	nop
    lcr0(cr0);
}
   423c1:	90                   	nop
   423c2:	c9                   	leaveq 
   423c3:	c3                   	retq   

00000000000423c4 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   423c4:	55                   	push   %rbp
   423c5:	48 89 e5             	mov    %rsp,%rbp
   423c8:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   423cc:	0f b7 05 2d ef 00 00 	movzwl 0xef2d(%rip),%eax        # 51300 <interrupts_enabled>
   423d3:	f7 d0                	not    %eax
   423d5:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   423d9:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   423dd:	0f b6 c0             	movzbl %al,%eax
   423e0:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   423e7:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   423ea:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   423ee:	8b 55 f0             	mov    -0x10(%rbp),%edx
   423f1:	ee                   	out    %al,(%dx)
}
   423f2:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   423f3:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   423f7:	66 c1 e8 08          	shr    $0x8,%ax
   423fb:	0f b6 c0             	movzbl %al,%eax
   423fe:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   42405:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42408:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4240c:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4240f:	ee                   	out    %al,(%dx)
}
   42410:	90                   	nop
}
   42411:	90                   	nop
   42412:	c9                   	leaveq 
   42413:	c3                   	retq   

0000000000042414 <interrupt_init>:

void interrupt_init(void) {
   42414:	55                   	push   %rbp
   42415:	48 89 e5             	mov    %rsp,%rbp
   42418:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   4241c:	66 c7 05 db ee 00 00 	movw   $0x0,0xeedb(%rip)        # 51300 <interrupts_enabled>
   42423:	00 00 
    interrupt_mask();
   42425:	e8 9a ff ff ff       	callq  423c4 <interrupt_mask>
   4242a:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   42431:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42435:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   42439:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   4243c:	ee                   	out    %al,(%dx)
}
   4243d:	90                   	nop
   4243e:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   42445:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42449:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   4244d:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42450:	ee                   	out    %al,(%dx)
}
   42451:	90                   	nop
   42452:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   42459:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4245d:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   42461:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   42464:	ee                   	out    %al,(%dx)
}
   42465:	90                   	nop
   42466:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   4246d:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42471:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   42475:	8b 55 bc             	mov    -0x44(%rbp),%edx
   42478:	ee                   	out    %al,(%dx)
}
   42479:	90                   	nop
   4247a:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   42481:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42485:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   42489:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   4248c:	ee                   	out    %al,(%dx)
}
   4248d:	90                   	nop
   4248e:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   42495:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42499:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   4249d:	8b 55 cc             	mov    -0x34(%rbp),%edx
   424a0:	ee                   	out    %al,(%dx)
}
   424a1:	90                   	nop
   424a2:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   424a9:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424ad:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   424b1:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   424b4:	ee                   	out    %al,(%dx)
}
   424b5:	90                   	nop
   424b6:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   424bd:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424c1:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   424c5:	8b 55 dc             	mov    -0x24(%rbp),%edx
   424c8:	ee                   	out    %al,(%dx)
}
   424c9:	90                   	nop
   424ca:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   424d1:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424d5:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   424d9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   424dc:	ee                   	out    %al,(%dx)
}
   424dd:	90                   	nop
   424de:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   424e5:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424e9:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   424ed:	8b 55 ec             	mov    -0x14(%rbp),%edx
   424f0:	ee                   	out    %al,(%dx)
}
   424f1:	90                   	nop
   424f2:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   424f9:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424fd:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42501:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42504:	ee                   	out    %al,(%dx)
}
   42505:	90                   	nop
   42506:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   4250d:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42511:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42515:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42518:	ee                   	out    %al,(%dx)
}
   42519:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   4251a:	e8 a5 fe ff ff       	callq  423c4 <interrupt_mask>
}
   4251f:	90                   	nop
   42520:	c9                   	leaveq 
   42521:	c3                   	retq   

0000000000042522 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   42522:	55                   	push   %rbp
   42523:	48 89 e5             	mov    %rsp,%rbp
   42526:	48 83 ec 28          	sub    $0x28,%rsp
   4252a:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   4252d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42531:	0f 8e 9f 00 00 00    	jle    425d6 <timer_init+0xb4>
   42537:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   4253e:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42542:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42546:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42549:	ee                   	out    %al,(%dx)
}
   4254a:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   4254b:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4254e:	89 c2                	mov    %eax,%edx
   42550:	c1 ea 1f             	shr    $0x1f,%edx
   42553:	01 d0                	add    %edx,%eax
   42555:	d1 f8                	sar    %eax
   42557:	05 de 34 12 00       	add    $0x1234de,%eax
   4255c:	99                   	cltd   
   4255d:	f7 7d dc             	idivl  -0x24(%rbp)
   42560:	89 c2                	mov    %eax,%edx
   42562:	89 d0                	mov    %edx,%eax
   42564:	c1 f8 1f             	sar    $0x1f,%eax
   42567:	c1 e8 18             	shr    $0x18,%eax
   4256a:	89 c1                	mov    %eax,%ecx
   4256c:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   4256f:	0f b6 c0             	movzbl %al,%eax
   42572:	29 c8                	sub    %ecx,%eax
   42574:	0f b6 c0             	movzbl %al,%eax
   42577:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   4257e:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42581:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42585:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42588:	ee                   	out    %al,(%dx)
}
   42589:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   4258a:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4258d:	89 c2                	mov    %eax,%edx
   4258f:	c1 ea 1f             	shr    $0x1f,%edx
   42592:	01 d0                	add    %edx,%eax
   42594:	d1 f8                	sar    %eax
   42596:	05 de 34 12 00       	add    $0x1234de,%eax
   4259b:	99                   	cltd   
   4259c:	f7 7d dc             	idivl  -0x24(%rbp)
   4259f:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   425a5:	85 c0                	test   %eax,%eax
   425a7:	0f 48 c2             	cmovs  %edx,%eax
   425aa:	c1 f8 08             	sar    $0x8,%eax
   425ad:	0f b6 c0             	movzbl %al,%eax
   425b0:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   425b7:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425ba:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   425be:	8b 55 fc             	mov    -0x4(%rbp),%edx
   425c1:	ee                   	out    %al,(%dx)
}
   425c2:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   425c3:	0f b7 05 36 ed 00 00 	movzwl 0xed36(%rip),%eax        # 51300 <interrupts_enabled>
   425ca:	83 c8 01             	or     $0x1,%eax
   425cd:	66 89 05 2c ed 00 00 	mov    %ax,0xed2c(%rip)        # 51300 <interrupts_enabled>
   425d4:	eb 11                	jmp    425e7 <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   425d6:	0f b7 05 23 ed 00 00 	movzwl 0xed23(%rip),%eax        # 51300 <interrupts_enabled>
   425dd:	83 e0 fe             	and    $0xfffffffe,%eax
   425e0:	66 89 05 19 ed 00 00 	mov    %ax,0xed19(%rip)        # 51300 <interrupts_enabled>
    }
    interrupt_mask();
   425e7:	e8 d8 fd ff ff       	callq  423c4 <interrupt_mask>
}
   425ec:	90                   	nop
   425ed:	c9                   	leaveq 
   425ee:	c3                   	retq   

00000000000425ef <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   425ef:	55                   	push   %rbp
   425f0:	48 89 e5             	mov    %rsp,%rbp
   425f3:	48 83 ec 08          	sub    $0x8,%rsp
   425f7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   425fb:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   42600:	74 14                	je     42616 <physical_memory_isreserved+0x27>
   42602:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42609:	00 
   4260a:	76 11                	jbe    4261d <physical_memory_isreserved+0x2e>
   4260c:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   42613:	00 
   42614:	77 07                	ja     4261d <physical_memory_isreserved+0x2e>
   42616:	b8 01 00 00 00       	mov    $0x1,%eax
   4261b:	eb 05                	jmp    42622 <physical_memory_isreserved+0x33>
   4261d:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42622:	c9                   	leaveq 
   42623:	c3                   	retq   

0000000000042624 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   42624:	55                   	push   %rbp
   42625:	48 89 e5             	mov    %rsp,%rbp
   42628:	48 83 ec 10          	sub    $0x10,%rsp
   4262c:	89 7d fc             	mov    %edi,-0x4(%rbp)
   4262f:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42632:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   42635:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42638:	c1 e0 10             	shl    $0x10,%eax
   4263b:	89 c2                	mov    %eax,%edx
   4263d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42640:	c1 e0 0b             	shl    $0xb,%eax
   42643:	09 c2                	or     %eax,%edx
   42645:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42648:	c1 e0 08             	shl    $0x8,%eax
   4264b:	09 d0                	or     %edx,%eax
}
   4264d:	c9                   	leaveq 
   4264e:	c3                   	retq   

000000000004264f <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   4264f:	55                   	push   %rbp
   42650:	48 89 e5             	mov    %rsp,%rbp
   42653:	48 83 ec 18          	sub    $0x18,%rsp
   42657:	89 7d ec             	mov    %edi,-0x14(%rbp)
   4265a:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   4265d:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42660:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42663:	09 d0                	or     %edx,%eax
   42665:	0d 00 00 00 80       	or     $0x80000000,%eax
   4266a:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   42671:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   42674:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42677:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4267a:	ef                   	out    %eax,(%dx)
}
   4267b:	90                   	nop
   4267c:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   42683:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42686:	89 c2                	mov    %eax,%edx
   42688:	ed                   	in     (%dx),%eax
   42689:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   4268c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   4268f:	c9                   	leaveq 
   42690:	c3                   	retq   

0000000000042691 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   42691:	55                   	push   %rbp
   42692:	48 89 e5             	mov    %rsp,%rbp
   42695:	48 83 ec 28          	sub    $0x28,%rsp
   42699:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4269c:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   4269f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   426a6:	eb 73                	jmp    4271b <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   426a8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   426af:	eb 60                	jmp    42711 <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   426b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   426b8:	eb 4a                	jmp    42704 <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   426ba:	8b 55 f4             	mov    -0xc(%rbp),%edx
   426bd:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   426c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   426c3:	89 ce                	mov    %ecx,%esi
   426c5:	89 c7                	mov    %eax,%edi
   426c7:	e8 58 ff ff ff       	callq  42624 <pci_make_configaddr>
   426cc:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   426cf:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426d2:	be 00 00 00 00       	mov    $0x0,%esi
   426d7:	89 c7                	mov    %eax,%edi
   426d9:	e8 71 ff ff ff       	callq  4264f <pci_config_readl>
   426de:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   426e1:	8b 45 d8             	mov    -0x28(%rbp),%eax
   426e4:	c1 e0 10             	shl    $0x10,%eax
   426e7:	0b 45 dc             	or     -0x24(%rbp),%eax
   426ea:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   426ed:	75 05                	jne    426f4 <pci_find_device+0x63>
                    return configaddr;
   426ef:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426f2:	eb 35                	jmp    42729 <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   426f4:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   426f8:	75 06                	jne    42700 <pci_find_device+0x6f>
   426fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   426fe:	74 0c                	je     4270c <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   42700:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42704:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   42708:	75 b0                	jne    426ba <pci_find_device+0x29>
   4270a:	eb 01                	jmp    4270d <pci_find_device+0x7c>
                    break;
   4270c:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   4270d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42711:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   42715:	75 9a                	jne    426b1 <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   42717:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4271b:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   42722:	75 84                	jne    426a8 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   42724:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42729:	c9                   	leaveq 
   4272a:	c3                   	retq   

000000000004272b <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   4272b:	55                   	push   %rbp
   4272c:	48 89 e5             	mov    %rsp,%rbp
   4272f:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   42733:	be 13 71 00 00       	mov    $0x7113,%esi
   42738:	bf 86 80 00 00       	mov    $0x8086,%edi
   4273d:	e8 4f ff ff ff       	callq  42691 <pci_find_device>
   42742:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42745:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   42749:	78 30                	js     4277b <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   4274b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4274e:	be 40 00 00 00       	mov    $0x40,%esi
   42753:	89 c7                	mov    %eax,%edi
   42755:	e8 f5 fe ff ff       	callq  4264f <pci_config_readl>
   4275a:	25 c0 ff 00 00       	and    $0xffc0,%eax
   4275f:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42762:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42765:	83 c0 04             	add    $0x4,%eax
   42768:	89 45 f4             	mov    %eax,-0xc(%rbp)
   4276b:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42771:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42775:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42778:	66 ef                	out    %ax,(%dx)
}
   4277a:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4277b:	ba 40 49 04 00       	mov    $0x44940,%edx
   42780:	be 00 c0 00 00       	mov    $0xc000,%esi
   42785:	bf 80 07 00 00       	mov    $0x780,%edi
   4278a:	b8 00 00 00 00       	mov    $0x0,%eax
   4278f:	e8 9c 1c 00 00       	callq  44430 <console_printf>
 spinloop: goto spinloop;
   42794:	eb fe                	jmp    42794 <poweroff+0x69>

0000000000042796 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   42796:	55                   	push   %rbp
   42797:	48 89 e5             	mov    %rsp,%rbp
   4279a:	48 83 ec 10          	sub    $0x10,%rsp
   4279e:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   427a5:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427a9:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   427ad:	8b 55 fc             	mov    -0x4(%rbp),%edx
   427b0:	ee                   	out    %al,(%dx)
}
   427b1:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   427b2:	eb fe                	jmp    427b2 <reboot+0x1c>

00000000000427b4 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   427b4:	55                   	push   %rbp
   427b5:	48 89 e5             	mov    %rsp,%rbp
   427b8:	48 83 ec 10          	sub    $0x10,%rsp
   427bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   427c0:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   427c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427c7:	48 83 c0 08          	add    $0x8,%rax
   427cb:	ba c0 00 00 00       	mov    $0xc0,%edx
   427d0:	be 00 00 00 00       	mov    $0x0,%esi
   427d5:	48 89 c7             	mov    %rax,%rdi
   427d8:	e8 1e 14 00 00       	callq  43bfb <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   427dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427e1:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   427e8:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   427ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427ee:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   427f5:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   427f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427fd:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   42804:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42808:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4280c:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   42813:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   42815:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42819:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42820:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42824:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42827:	83 e0 01             	and    $0x1,%eax
   4282a:	85 c0                	test   %eax,%eax
   4282c:	74 1c                	je     4284a <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   4282e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42832:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42839:	80 cc 30             	or     $0x30,%ah
   4283c:	48 89 c2             	mov    %rax,%rdx
   4283f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42843:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   4284a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4284d:	83 e0 02             	and    $0x2,%eax
   42850:	85 c0                	test   %eax,%eax
   42852:	74 1c                	je     42870 <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42854:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42858:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   4285f:	80 e4 fd             	and    $0xfd,%ah
   42862:	48 89 c2             	mov    %rax,%rdx
   42865:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42869:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42870:	90                   	nop
   42871:	c9                   	leaveq 
   42872:	c3                   	retq   

0000000000042873 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   42873:	55                   	push   %rbp
   42874:	48 89 e5             	mov    %rsp,%rbp
   42877:	48 83 ec 28          	sub    $0x28,%rsp
   4287b:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4287e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42882:	78 09                	js     4288d <console_show_cursor+0x1a>
   42884:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   4288b:	7e 07                	jle    42894 <console_show_cursor+0x21>
        cpos = 0;
   4288d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42894:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   4289b:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4289f:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   428a3:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   428a6:	ee                   	out    %al,(%dx)
}
   428a7:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   428a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428ab:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   428b1:	85 c0                	test   %eax,%eax
   428b3:	0f 48 c2             	cmovs  %edx,%eax
   428b6:	c1 f8 08             	sar    $0x8,%eax
   428b9:	0f b6 c0             	movzbl %al,%eax
   428bc:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   428c3:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428c6:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   428ca:	8b 55 ec             	mov    -0x14(%rbp),%edx
   428cd:	ee                   	out    %al,(%dx)
}
   428ce:	90                   	nop
   428cf:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   428d6:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428da:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   428de:	8b 55 f4             	mov    -0xc(%rbp),%edx
   428e1:	ee                   	out    %al,(%dx)
}
   428e2:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   428e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428e6:	99                   	cltd   
   428e7:	c1 ea 18             	shr    $0x18,%edx
   428ea:	01 d0                	add    %edx,%eax
   428ec:	0f b6 c0             	movzbl %al,%eax
   428ef:	29 d0                	sub    %edx,%eax
   428f1:	0f b6 c0             	movzbl %al,%eax
   428f4:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   428fb:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428fe:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42902:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42905:	ee                   	out    %al,(%dx)
}
   42906:	90                   	nop
}
   42907:	90                   	nop
   42908:	c9                   	leaveq 
   42909:	c3                   	retq   

000000000004290a <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   4290a:	55                   	push   %rbp
   4290b:	48 89 e5             	mov    %rsp,%rbp
   4290e:	48 83 ec 20          	sub    $0x20,%rsp
   42912:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42919:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4291c:	89 c2                	mov    %eax,%edx
   4291e:	ec                   	in     (%dx),%al
   4291f:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42922:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42926:	0f b6 c0             	movzbl %al,%eax
   42929:	83 e0 01             	and    $0x1,%eax
   4292c:	85 c0                	test   %eax,%eax
   4292e:	75 0a                	jne    4293a <keyboard_readc+0x30>
        return -1;
   42930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42935:	e9 e7 01 00 00       	jmpq   42b21 <keyboard_readc+0x217>
   4293a:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42941:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42944:	89 c2                	mov    %eax,%edx
   42946:	ec                   	in     (%dx),%al
   42947:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   4294a:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   4294e:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42951:	0f b6 05 aa e9 00 00 	movzbl 0xe9aa(%rip),%eax        # 51302 <last_escape.2>
   42958:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   4295b:	c6 05 a0 e9 00 00 00 	movb   $0x0,0xe9a0(%rip)        # 51302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42962:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42966:	75 11                	jne    42979 <keyboard_readc+0x6f>
        last_escape = 0x80;
   42968:	c6 05 93 e9 00 00 80 	movb   $0x80,0xe993(%rip)        # 51302 <last_escape.2>
        return 0;
   4296f:	b8 00 00 00 00       	mov    $0x0,%eax
   42974:	e9 a8 01 00 00       	jmpq   42b21 <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42979:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4297d:	84 c0                	test   %al,%al
   4297f:	79 60                	jns    429e1 <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   42981:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42985:	83 e0 7f             	and    $0x7f,%eax
   42988:	89 c2                	mov    %eax,%edx
   4298a:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   4298e:	09 d0                	or     %edx,%eax
   42990:	48 98                	cltq   
   42992:	0f b6 80 60 49 04 00 	movzbl 0x44960(%rax),%eax
   42999:	0f b6 c0             	movzbl %al,%eax
   4299c:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   4299f:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   429a6:	7e 2f                	jle    429d7 <keyboard_readc+0xcd>
   429a8:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   429af:	7f 26                	jg     429d7 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   429b1:	8b 45 f4             	mov    -0xc(%rbp),%eax
   429b4:	2d fa 00 00 00       	sub    $0xfa,%eax
   429b9:	ba 01 00 00 00       	mov    $0x1,%edx
   429be:	89 c1                	mov    %eax,%ecx
   429c0:	d3 e2                	shl    %cl,%edx
   429c2:	89 d0                	mov    %edx,%eax
   429c4:	f7 d0                	not    %eax
   429c6:	89 c2                	mov    %eax,%edx
   429c8:	0f b6 05 34 e9 00 00 	movzbl 0xe934(%rip),%eax        # 51303 <modifiers.1>
   429cf:	21 d0                	and    %edx,%eax
   429d1:	88 05 2c e9 00 00    	mov    %al,0xe92c(%rip)        # 51303 <modifiers.1>
        }
        return 0;
   429d7:	b8 00 00 00 00       	mov    $0x0,%eax
   429dc:	e9 40 01 00 00       	jmpq   42b21 <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   429e1:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   429e5:	0a 45 fa             	or     -0x6(%rbp),%al
   429e8:	0f b6 c0             	movzbl %al,%eax
   429eb:	48 98                	cltq   
   429ed:	0f b6 80 60 49 04 00 	movzbl 0x44960(%rax),%eax
   429f4:	0f b6 c0             	movzbl %al,%eax
   429f7:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   429fa:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   429fe:	7e 57                	jle    42a57 <keyboard_readc+0x14d>
   42a00:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   42a04:	7f 51                	jg     42a57 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   42a06:	0f b6 05 f6 e8 00 00 	movzbl 0xe8f6(%rip),%eax        # 51303 <modifiers.1>
   42a0d:	0f b6 c0             	movzbl %al,%eax
   42a10:	83 e0 02             	and    $0x2,%eax
   42a13:	85 c0                	test   %eax,%eax
   42a15:	74 09                	je     42a20 <keyboard_readc+0x116>
            ch -= 0x60;
   42a17:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42a1b:	e9 fd 00 00 00       	jmpq   42b1d <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42a20:	0f b6 05 dc e8 00 00 	movzbl 0xe8dc(%rip),%eax        # 51303 <modifiers.1>
   42a27:	0f b6 c0             	movzbl %al,%eax
   42a2a:	83 e0 01             	and    $0x1,%eax
   42a2d:	85 c0                	test   %eax,%eax
   42a2f:	0f 94 c2             	sete   %dl
   42a32:	0f b6 05 ca e8 00 00 	movzbl 0xe8ca(%rip),%eax        # 51303 <modifiers.1>
   42a39:	0f b6 c0             	movzbl %al,%eax
   42a3c:	83 e0 08             	and    $0x8,%eax
   42a3f:	85 c0                	test   %eax,%eax
   42a41:	0f 94 c0             	sete   %al
   42a44:	31 d0                	xor    %edx,%eax
   42a46:	84 c0                	test   %al,%al
   42a48:	0f 84 cf 00 00 00    	je     42b1d <keyboard_readc+0x213>
            ch -= 0x20;
   42a4e:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42a52:	e9 c6 00 00 00       	jmpq   42b1d <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42a57:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42a5e:	7e 30                	jle    42a90 <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42a60:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a63:	2d fa 00 00 00       	sub    $0xfa,%eax
   42a68:	ba 01 00 00 00       	mov    $0x1,%edx
   42a6d:	89 c1                	mov    %eax,%ecx
   42a6f:	d3 e2                	shl    %cl,%edx
   42a71:	89 d0                	mov    %edx,%eax
   42a73:	89 c2                	mov    %eax,%edx
   42a75:	0f b6 05 87 e8 00 00 	movzbl 0xe887(%rip),%eax        # 51303 <modifiers.1>
   42a7c:	31 d0                	xor    %edx,%eax
   42a7e:	88 05 7f e8 00 00    	mov    %al,0xe87f(%rip)        # 51303 <modifiers.1>
        ch = 0;
   42a84:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42a8b:	e9 8e 00 00 00       	jmpq   42b1e <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   42a90:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42a97:	7e 2d                	jle    42ac6 <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42a99:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a9c:	2d fa 00 00 00       	sub    $0xfa,%eax
   42aa1:	ba 01 00 00 00       	mov    $0x1,%edx
   42aa6:	89 c1                	mov    %eax,%ecx
   42aa8:	d3 e2                	shl    %cl,%edx
   42aaa:	89 d0                	mov    %edx,%eax
   42aac:	89 c2                	mov    %eax,%edx
   42aae:	0f b6 05 4e e8 00 00 	movzbl 0xe84e(%rip),%eax        # 51303 <modifiers.1>
   42ab5:	09 d0                	or     %edx,%eax
   42ab7:	88 05 46 e8 00 00    	mov    %al,0xe846(%rip)        # 51303 <modifiers.1>
        ch = 0;
   42abd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42ac4:	eb 58                	jmp    42b1e <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42ac6:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42aca:	7e 31                	jle    42afd <keyboard_readc+0x1f3>
   42acc:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   42ad3:	7f 28                	jg     42afd <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42ad5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ad8:	8d 50 80             	lea    -0x80(%rax),%edx
   42adb:	0f b6 05 21 e8 00 00 	movzbl 0xe821(%rip),%eax        # 51303 <modifiers.1>
   42ae2:	0f b6 c0             	movzbl %al,%eax
   42ae5:	83 e0 03             	and    $0x3,%eax
   42ae8:	48 98                	cltq   
   42aea:	48 63 d2             	movslq %edx,%rdx
   42aed:	0f b6 84 90 60 4a 04 	movzbl 0x44a60(%rax,%rdx,4),%eax
   42af4:	00 
   42af5:	0f b6 c0             	movzbl %al,%eax
   42af8:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42afb:	eb 21                	jmp    42b1e <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42afd:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42b01:	7f 1b                	jg     42b1e <keyboard_readc+0x214>
   42b03:	0f b6 05 f9 e7 00 00 	movzbl 0xe7f9(%rip),%eax        # 51303 <modifiers.1>
   42b0a:	0f b6 c0             	movzbl %al,%eax
   42b0d:	83 e0 02             	and    $0x2,%eax
   42b10:	85 c0                	test   %eax,%eax
   42b12:	74 0a                	je     42b1e <keyboard_readc+0x214>
        ch = 0;
   42b14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42b1b:	eb 01                	jmp    42b1e <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   42b1d:	90                   	nop
    }

    return ch;
   42b1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42b21:	c9                   	leaveq 
   42b22:	c3                   	retq   

0000000000042b23 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   42b23:	55                   	push   %rbp
   42b24:	48 89 e5             	mov    %rsp,%rbp
   42b27:	48 83 ec 20          	sub    $0x20,%rsp
   42b2b:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42b32:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42b35:	89 c2                	mov    %eax,%edx
   42b37:	ec                   	in     (%dx),%al
   42b38:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42b3b:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42b42:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42b45:	89 c2                	mov    %eax,%edx
   42b47:	ec                   	in     (%dx),%al
   42b48:	88 45 eb             	mov    %al,-0x15(%rbp)
   42b4b:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42b52:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42b55:	89 c2                	mov    %eax,%edx
   42b57:	ec                   	in     (%dx),%al
   42b58:	88 45 f3             	mov    %al,-0xd(%rbp)
   42b5b:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42b62:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42b65:	89 c2                	mov    %eax,%edx
   42b67:	ec                   	in     (%dx),%al
   42b68:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42b6b:	90                   	nop
   42b6c:	c9                   	leaveq 
   42b6d:	c3                   	retq   

0000000000042b6e <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42b6e:	55                   	push   %rbp
   42b6f:	48 89 e5             	mov    %rsp,%rbp
   42b72:	48 83 ec 40          	sub    $0x40,%rsp
   42b76:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42b7a:	89 f0                	mov    %esi,%eax
   42b7c:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42b7f:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42b82:	8b 05 7c e7 00 00    	mov    0xe77c(%rip),%eax        # 51304 <initialized.0>
   42b88:	85 c0                	test   %eax,%eax
   42b8a:	75 1e                	jne    42baa <parallel_port_putc+0x3c>
   42b8c:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42b93:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42b97:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42b9b:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42b9e:	ee                   	out    %al,(%dx)
}
   42b9f:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   42ba0:	c7 05 5a e7 00 00 01 	movl   $0x1,0xe75a(%rip)        # 51304 <initialized.0>
   42ba7:	00 00 00 
    }

    for (int i = 0;
   42baa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42bb1:	eb 09                	jmp    42bbc <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42bb3:	e8 6b ff ff ff       	callq  42b23 <delay>
         ++i) {
   42bb8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42bbc:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42bc3:	7f 18                	jg     42bdd <parallel_port_putc+0x6f>
   42bc5:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42bcc:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42bcf:	89 c2                	mov    %eax,%edx
   42bd1:	ec                   	in     (%dx),%al
   42bd2:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42bd5:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42bd9:	84 c0                	test   %al,%al
   42bdb:	79 d6                	jns    42bb3 <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   42bdd:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   42be1:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42be8:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42beb:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   42bef:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42bf2:	ee                   	out    %al,(%dx)
}
   42bf3:	90                   	nop
   42bf4:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42bfb:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42bff:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42c03:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42c06:	ee                   	out    %al,(%dx)
}
   42c07:	90                   	nop
   42c08:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   42c0f:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c13:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42c17:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42c1a:	ee                   	out    %al,(%dx)
}
   42c1b:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   42c1c:	90                   	nop
   42c1d:	c9                   	leaveq 
   42c1e:	c3                   	retq   

0000000000042c1f <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   42c1f:	55                   	push   %rbp
   42c20:	48 89 e5             	mov    %rsp,%rbp
   42c23:	48 83 ec 20          	sub    $0x20,%rsp
   42c27:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42c2b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42c2f:	48 c7 45 f8 6e 2b 04 	movq   $0x42b6e,-0x8(%rbp)
   42c36:	00 
    printer_vprintf(&p, 0, format, val);
   42c37:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42c3b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42c3f:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42c43:	be 00 00 00 00       	mov    $0x0,%esi
   42c48:	48 89 c7             	mov    %rax,%rdi
   42c4b:	e8 bc 10 00 00       	callq  43d0c <printer_vprintf>
}
   42c50:	90                   	nop
   42c51:	c9                   	leaveq 
   42c52:	c3                   	retq   

0000000000042c53 <log_printf>:

void log_printf(const char* format, ...) {
   42c53:	55                   	push   %rbp
   42c54:	48 89 e5             	mov    %rsp,%rbp
   42c57:	48 83 ec 60          	sub    $0x60,%rsp
   42c5b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42c5f:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42c63:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42c67:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42c6b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42c6f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42c73:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42c7a:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42c7e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42c82:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42c86:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42c8a:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   42c8e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42c92:	48 89 d6             	mov    %rdx,%rsi
   42c95:	48 89 c7             	mov    %rax,%rdi
   42c98:	e8 82 ff ff ff       	callq  42c1f <log_vprintf>
    va_end(val);
}
   42c9d:	90                   	nop
   42c9e:	c9                   	leaveq 
   42c9f:	c3                   	retq   

0000000000042ca0 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42ca0:	55                   	push   %rbp
   42ca1:	48 89 e5             	mov    %rsp,%rbp
   42ca4:	48 83 ec 40          	sub    $0x40,%rsp
   42ca8:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42cab:	89 75 d8             	mov    %esi,-0x28(%rbp)
   42cae:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   42cb2:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42cb6:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   42cba:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   42cbe:	48 8b 0a             	mov    (%rdx),%rcx
   42cc1:	48 89 08             	mov    %rcx,(%rax)
   42cc4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42cc8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   42ccc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   42cd0:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42cd4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42cd8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42cdc:	48 89 d6             	mov    %rdx,%rsi
   42cdf:	48 89 c7             	mov    %rax,%rdi
   42ce2:	e8 38 ff ff ff       	callq  42c1f <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42ce7:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42ceb:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42cef:	8b 75 d8             	mov    -0x28(%rbp),%esi
   42cf2:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42cf5:	89 c7                	mov    %eax,%edi
   42cf7:	e8 ef 16 00 00       	callq  443eb <console_vprintf>
}
   42cfc:	c9                   	leaveq 
   42cfd:	c3                   	retq   

0000000000042cfe <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   42cfe:	55                   	push   %rbp
   42cff:	48 89 e5             	mov    %rsp,%rbp
   42d02:	48 83 ec 60          	sub    $0x60,%rsp
   42d06:	89 7d ac             	mov    %edi,-0x54(%rbp)
   42d09:	89 75 a8             	mov    %esi,-0x58(%rbp)
   42d0c:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   42d10:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42d14:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42d18:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42d1c:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42d23:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42d27:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42d2b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42d2f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42d33:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42d37:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   42d3b:	8b 75 a8             	mov    -0x58(%rbp),%esi
   42d3e:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d41:	89 c7                	mov    %eax,%edi
   42d43:	e8 58 ff ff ff       	callq  42ca0 <error_vprintf>
   42d48:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   42d4b:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   42d4e:	c9                   	leaveq 
   42d4f:	c3                   	retq   

0000000000042d50 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42d50:	55                   	push   %rbp
   42d51:	48 89 e5             	mov    %rsp,%rbp
   42d54:	53                   	push   %rbx
   42d55:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   42d59:	e8 ac fb ff ff       	callq  4290a <keyboard_readc>
   42d5e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42d61:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42d65:	74 1c                	je     42d83 <check_keyboard+0x33>
   42d67:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   42d6b:	74 16                	je     42d83 <check_keyboard+0x33>
   42d6d:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42d71:	74 10                	je     42d83 <check_keyboard+0x33>
   42d73:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42d77:	74 0a                	je     42d83 <check_keyboard+0x33>
   42d79:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42d7d:	0f 85 e9 00 00 00    	jne    42e6c <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42d83:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   42d8a:	00 
        memset(pt, 0, PAGESIZE * 3);
   42d8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42d8f:	ba 00 30 00 00       	mov    $0x3000,%edx
   42d94:	be 00 00 00 00       	mov    $0x0,%esi
   42d99:	48 89 c7             	mov    %rax,%rdi
   42d9c:	e8 5a 0e 00 00       	callq  43bfb <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42da1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42da5:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   42dac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42db0:	48 05 00 10 00 00    	add    $0x1000,%rax
   42db6:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   42dbd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42dc1:	48 05 00 20 00 00    	add    $0x2000,%rax
   42dc7:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   42dce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42dd2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42dd6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42dda:	0f 22 d8             	mov    %rax,%cr3
}
   42ddd:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   42dde:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42de5:	48 c7 45 e8 b8 4a 04 	movq   $0x44ab8,-0x18(%rbp)
   42dec:	00 
        if (c == 'a') {
   42ded:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42df1:	75 0a                	jne    42dfd <check_keyboard+0xad>
            argument = "allocator";
   42df3:	48 c7 45 e8 bd 4a 04 	movq   $0x44abd,-0x18(%rbp)
   42dfa:	00 
   42dfb:	eb 2e                	jmp    42e2b <check_keyboard+0xdb>
        } else if (c == 'e') {
   42dfd:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42e01:	75 0a                	jne    42e0d <check_keyboard+0xbd>
            argument = "forkexit";
   42e03:	48 c7 45 e8 c7 4a 04 	movq   $0x44ac7,-0x18(%rbp)
   42e0a:	00 
   42e0b:	eb 1e                	jmp    42e2b <check_keyboard+0xdb>
        }
        else if (c == 't'){
   42e0d:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42e11:	75 0a                	jne    42e1d <check_keyboard+0xcd>
            argument = "test";
   42e13:	48 c7 45 e8 d0 4a 04 	movq   $0x44ad0,-0x18(%rbp)
   42e1a:	00 
   42e1b:	eb 0e                	jmp    42e2b <check_keyboard+0xdb>
        }
        else if(c == '2'){
   42e1d:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42e21:	75 08                	jne    42e2b <check_keyboard+0xdb>
            argument = "test2";
   42e23:	48 c7 45 e8 d5 4a 04 	movq   $0x44ad5,-0x18(%rbp)
   42e2a:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   42e2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e2f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   42e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42e38:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   42e3c:	76 14                	jbe    42e52 <check_keyboard+0x102>
   42e3e:	ba db 4a 04 00       	mov    $0x44adb,%edx
   42e43:	be 5c 02 00 00       	mov    $0x25c,%esi
   42e48:	bf f7 4a 04 00       	mov    $0x44af7,%edi
   42e4d:	e8 1f 01 00 00       	callq  42f71 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42e52:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42e56:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42e59:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   42e5d:	48 89 c3             	mov    %rax,%rbx
   42e60:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42e65:	e9 96 d1 ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42e6a:	eb 11                	jmp    42e7d <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   42e6c:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   42e70:	74 06                	je     42e78 <check_keyboard+0x128>
   42e72:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42e76:	75 05                	jne    42e7d <check_keyboard+0x12d>
        poweroff();
   42e78:	e8 ae f8 ff ff       	callq  4272b <poweroff>
    }
    return c;
   42e7d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   42e80:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42e84:	c9                   	leaveq 
   42e85:	c3                   	retq   

0000000000042e86 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42e86:	55                   	push   %rbp
   42e87:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   42e8a:	e8 c1 fe ff ff       	callq  42d50 <check_keyboard>
   42e8f:	eb f9                	jmp    42e8a <fail+0x4>

0000000000042e91 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42e91:	55                   	push   %rbp
   42e92:	48 89 e5             	mov    %rsp,%rbp
   42e95:	48 83 ec 60          	sub    $0x60,%rsp
   42e99:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42e9d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42ea1:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42ea5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42ea9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42ead:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42eb1:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42eb8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42ebc:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42ec0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42ec4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42ec8:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   42ecd:	0f 84 80 00 00 00    	je     42f53 <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42ed3:	ba 04 4b 04 00       	mov    $0x44b04,%edx
   42ed8:	be 00 c0 00 00       	mov    $0xc000,%esi
   42edd:	bf 30 07 00 00       	mov    $0x730,%edi
   42ee2:	b8 00 00 00 00       	mov    $0x0,%eax
   42ee7:	e8 12 fe ff ff       	callq  42cfe <error_printf>
   42eec:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   42eef:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42ef3:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42ef7:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42efa:	be 00 c0 00 00       	mov    $0xc000,%esi
   42eff:	89 c7                	mov    %eax,%edi
   42f01:	e8 9a fd ff ff       	callq  42ca0 <error_vprintf>
   42f06:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42f09:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   42f0c:	48 63 c1             	movslq %ecx,%rax
   42f0f:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42f16:	48 c1 e8 20          	shr    $0x20,%rax
   42f1a:	c1 f8 05             	sar    $0x5,%eax
   42f1d:	89 ce                	mov    %ecx,%esi
   42f1f:	c1 fe 1f             	sar    $0x1f,%esi
   42f22:	29 f0                	sub    %esi,%eax
   42f24:	89 c2                	mov    %eax,%edx
   42f26:	89 d0                	mov    %edx,%eax
   42f28:	c1 e0 02             	shl    $0x2,%eax
   42f2b:	01 d0                	add    %edx,%eax
   42f2d:	c1 e0 04             	shl    $0x4,%eax
   42f30:	29 c1                	sub    %eax,%ecx
   42f32:	89 ca                	mov    %ecx,%edx
   42f34:	85 d2                	test   %edx,%edx
   42f36:	74 34                	je     42f6c <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   42f38:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42f3b:	ba 0c 4b 04 00       	mov    $0x44b0c,%edx
   42f40:	be 00 c0 00 00       	mov    $0xc000,%esi
   42f45:	89 c7                	mov    %eax,%edi
   42f47:	b8 00 00 00 00       	mov    $0x0,%eax
   42f4c:	e8 ad fd ff ff       	callq  42cfe <error_printf>
   42f51:	eb 19                	jmp    42f6c <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42f53:	ba 0e 4b 04 00       	mov    $0x44b0e,%edx
   42f58:	be 00 c0 00 00       	mov    $0xc000,%esi
   42f5d:	bf 30 07 00 00       	mov    $0x730,%edi
   42f62:	b8 00 00 00 00       	mov    $0x0,%eax
   42f67:	e8 92 fd ff ff       	callq  42cfe <error_printf>
    }

    va_end(val);
    fail();
   42f6c:	e8 15 ff ff ff       	callq  42e86 <fail>

0000000000042f71 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42f71:	55                   	push   %rbp
   42f72:	48 89 e5             	mov    %rsp,%rbp
   42f75:	48 83 ec 20          	sub    $0x20,%rsp
   42f79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42f7d:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42f80:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42f84:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42f88:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42f8b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42f8f:	48 89 c6             	mov    %rax,%rsi
   42f92:	bf 14 4b 04 00       	mov    $0x44b14,%edi
   42f97:	b8 00 00 00 00       	mov    $0x0,%eax
   42f9c:	e8 f0 fe ff ff       	callq  42e91 <panic>

0000000000042fa1 <default_exception>:
}

void default_exception(proc* p){
   42fa1:	55                   	push   %rbp
   42fa2:	48 89 e5             	mov    %rsp,%rbp
   42fa5:	48 83 ec 20          	sub    $0x20,%rsp
   42fa9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   42fad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42fb1:	48 83 c0 08          	add    $0x8,%rax
   42fb5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42fb9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42fbd:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42fc4:	48 89 c6             	mov    %rax,%rsi
   42fc7:	bf 32 4b 04 00       	mov    $0x44b32,%edi
   42fcc:	b8 00 00 00 00       	mov    $0x0,%eax
   42fd1:	e8 bb fe ff ff       	callq  42e91 <panic>

0000000000042fd6 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42fd6:	55                   	push   %rbp
   42fd7:	48 89 e5             	mov    %rsp,%rbp
   42fda:	48 83 ec 10          	sub    $0x10,%rsp
   42fde:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42fe2:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42fe5:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42fe9:	78 06                	js     42ff1 <pageindex+0x1b>
   42feb:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   42fef:	7e 14                	jle    43005 <pageindex+0x2f>
   42ff1:	ba 50 4b 04 00       	mov    $0x44b50,%edx
   42ff6:	be 1e 00 00 00       	mov    $0x1e,%esi
   42ffb:	bf 69 4b 04 00       	mov    $0x44b69,%edi
   43000:	e8 6c ff ff ff       	callq  42f71 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   43005:	b8 03 00 00 00       	mov    $0x3,%eax
   4300a:	2b 45 f4             	sub    -0xc(%rbp),%eax
   4300d:	89 c2                	mov    %eax,%edx
   4300f:	89 d0                	mov    %edx,%eax
   43011:	c1 e0 03             	shl    $0x3,%eax
   43014:	01 d0                	add    %edx,%eax
   43016:	83 c0 0c             	add    $0xc,%eax
   43019:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4301d:	89 c1                	mov    %eax,%ecx
   4301f:	48 d3 ea             	shr    %cl,%rdx
   43022:	48 89 d0             	mov    %rdx,%rax
   43025:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   4302a:	c9                   	leaveq 
   4302b:	c3                   	retq   

000000000004302c <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   4302c:	55                   	push   %rbp
   4302d:	48 89 e5             	mov    %rsp,%rbp
   43030:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   43034:	48 c7 05 c1 ef 00 00 	movq   $0x53000,0xefc1(%rip)        # 52000 <kernel_pagetable>
   4303b:	00 30 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   4303f:	ba 00 50 00 00       	mov    $0x5000,%edx
   43044:	be 00 00 00 00       	mov    $0x0,%esi
   43049:	bf 00 30 05 00       	mov    $0x53000,%edi
   4304e:	e8 a8 0b 00 00       	callq  43bfb <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   43053:	b8 00 40 05 00       	mov    $0x54000,%eax
   43058:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   4305c:	48 89 05 9d ff 00 00 	mov    %rax,0xff9d(%rip)        # 53000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   43063:	b8 00 50 05 00       	mov    $0x55000,%eax
   43068:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   4306c:	48 89 05 8d 0f 01 00 	mov    %rax,0x10f8d(%rip)        # 54000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   43073:	b8 00 60 05 00       	mov    $0x56000,%eax
   43078:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   4307c:	48 89 05 7d 1f 01 00 	mov    %rax,0x11f7d(%rip)        # 55000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   43083:	b8 00 70 05 00       	mov    $0x57000,%eax
   43088:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   4308c:	48 89 05 75 1f 01 00 	mov    %rax,0x11f75(%rip)        # 55008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   43093:	48 8b 05 66 ef 00 00 	mov    0xef66(%rip),%rax        # 52000 <kernel_pagetable>
   4309a:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   430a0:	b9 00 00 20 00       	mov    $0x200000,%ecx
   430a5:	ba 00 00 00 00       	mov    $0x0,%edx
   430aa:	be 00 00 00 00       	mov    $0x0,%esi
   430af:	48 89 c7             	mov    %rax,%rdi
   430b2:	e8 b9 01 00 00       	callq  43270 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   430b7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   430be:	00 
   430bf:	eb 62                	jmp    43123 <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   430c1:	48 8b 0d 38 ef 00 00 	mov    0xef38(%rip),%rcx        # 52000 <kernel_pagetable>
   430c8:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   430cc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   430d0:	48 89 ce             	mov    %rcx,%rsi
   430d3:	48 89 c7             	mov    %rax,%rdi
   430d6:	e8 66 05 00 00       	callq  43641 <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   430db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430df:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   430e3:	74 14                	je     430f9 <virtual_memory_init+0xcd>
   430e5:	ba 72 4b 04 00       	mov    $0x44b72,%edx
   430ea:	be 2d 00 00 00       	mov    $0x2d,%esi
   430ef:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   430f4:	e8 78 fe ff ff       	callq  42f71 <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   430f9:	8b 45 f0             	mov    -0x10(%rbp),%eax
   430fc:	48 98                	cltq   
   430fe:	83 e0 03             	and    $0x3,%eax
   43101:	48 83 f8 03          	cmp    $0x3,%rax
   43105:	74 14                	je     4311b <virtual_memory_init+0xef>
   43107:	ba 88 4b 04 00       	mov    $0x44b88,%edx
   4310c:	be 2e 00 00 00       	mov    $0x2e,%esi
   43111:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43116:	e8 56 fe ff ff       	callq  42f71 <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   4311b:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43122:	00 
   43123:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4312a:	00 
   4312b:	76 94                	jbe    430c1 <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   4312d:	48 8b 05 cc ee 00 00 	mov    0xeecc(%rip),%rax        # 52000 <kernel_pagetable>
   43134:	48 89 c7             	mov    %rax,%rdi
   43137:	e8 03 00 00 00       	callq  4313f <set_pagetable>
}
   4313c:	90                   	nop
   4313d:	c9                   	leaveq 
   4313e:	c3                   	retq   

000000000004313f <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   4313f:	55                   	push   %rbp
   43140:	48 89 e5             	mov    %rsp,%rbp
   43143:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43147:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   4314b:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   4314f:	25 ff 0f 00 00       	and    $0xfff,%eax
   43154:	48 85 c0             	test   %rax,%rax
   43157:	74 14                	je     4316d <set_pagetable+0x2e>
   43159:	ba b5 4b 04 00       	mov    $0x44bb5,%edx
   4315e:	be 3d 00 00 00       	mov    $0x3d,%esi
   43163:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43168:	e8 04 fe ff ff       	callq  42f71 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   4316d:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   43172:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   43176:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   4317a:	48 89 ce             	mov    %rcx,%rsi
   4317d:	48 89 c7             	mov    %rax,%rdi
   43180:	e8 bc 04 00 00       	callq  43641 <virtual_memory_lookup>
   43185:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43189:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   4318e:	48 39 d0             	cmp    %rdx,%rax
   43191:	74 14                	je     431a7 <set_pagetable+0x68>
   43193:	ba d0 4b 04 00       	mov    $0x44bd0,%edx
   43198:	be 3f 00 00 00       	mov    $0x3f,%esi
   4319d:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   431a2:	e8 ca fd ff ff       	callq  42f71 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   431a7:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   431ab:	48 8b 0d 4e ee 00 00 	mov    0xee4e(%rip),%rcx        # 52000 <kernel_pagetable>
   431b2:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   431b6:	48 89 ce             	mov    %rcx,%rsi
   431b9:	48 89 c7             	mov    %rax,%rdi
   431bc:	e8 80 04 00 00       	callq  43641 <virtual_memory_lookup>
   431c1:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   431c5:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   431c9:	48 39 c2             	cmp    %rax,%rdx
   431cc:	74 14                	je     431e2 <set_pagetable+0xa3>
   431ce:	ba 38 4c 04 00       	mov    $0x44c38,%edx
   431d3:	be 41 00 00 00       	mov    $0x41,%esi
   431d8:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   431dd:	e8 8f fd ff ff       	callq  42f71 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   431e2:	48 8b 05 17 ee 00 00 	mov    0xee17(%rip),%rax        # 52000 <kernel_pagetable>
   431e9:	48 89 c2             	mov    %rax,%rdx
   431ec:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   431f0:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   431f4:	48 89 ce             	mov    %rcx,%rsi
   431f7:	48 89 c7             	mov    %rax,%rdi
   431fa:	e8 42 04 00 00       	callq  43641 <virtual_memory_lookup>
   431ff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43203:	48 8b 15 f6 ed 00 00 	mov    0xedf6(%rip),%rdx        # 52000 <kernel_pagetable>
   4320a:	48 39 d0             	cmp    %rdx,%rax
   4320d:	74 14                	je     43223 <set_pagetable+0xe4>
   4320f:	ba 98 4c 04 00       	mov    $0x44c98,%edx
   43214:	be 43 00 00 00       	mov    $0x43,%esi
   43219:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   4321e:	e8 4e fd ff ff       	callq  42f71 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   43223:	ba 70 32 04 00       	mov    $0x43270,%edx
   43228:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   4322c:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43230:	48 89 ce             	mov    %rcx,%rsi
   43233:	48 89 c7             	mov    %rax,%rdi
   43236:	e8 06 04 00 00       	callq  43641 <virtual_memory_lookup>
   4323b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4323f:	ba 70 32 04 00       	mov    $0x43270,%edx
   43244:	48 39 d0             	cmp    %rdx,%rax
   43247:	74 14                	je     4325d <set_pagetable+0x11e>
   43249:	ba 00 4d 04 00       	mov    $0x44d00,%edx
   4324e:	be 45 00 00 00       	mov    $0x45,%esi
   43253:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43258:	e8 14 fd ff ff       	callq  42f71 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   4325d:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43261:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   43265:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43269:	0f 22 d8             	mov    %rax,%cr3
}
   4326c:	90                   	nop
}
   4326d:	90                   	nop
   4326e:	c9                   	leaveq 
   4326f:	c3                   	retq   

0000000000043270 <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   43270:	55                   	push   %rbp
   43271:	48 89 e5             	mov    %rsp,%rbp
   43274:	53                   	push   %rbx
   43275:	48 83 ec 58          	sub    $0x58,%rsp
   43279:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4327d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   43281:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   43285:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   43289:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   4328d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43291:	25 ff 0f 00 00       	and    $0xfff,%eax
   43296:	48 85 c0             	test   %rax,%rax
   43299:	74 14                	je     432af <virtual_memory_map+0x3f>
   4329b:	ba 66 4d 04 00       	mov    $0x44d66,%edx
   432a0:	be 63 00 00 00       	mov    $0x63,%esi
   432a5:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   432aa:	e8 c2 fc ff ff       	callq  42f71 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   432af:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432b3:	25 ff 0f 00 00       	and    $0xfff,%eax
   432b8:	48 85 c0             	test   %rax,%rax
   432bb:	74 14                	je     432d1 <virtual_memory_map+0x61>
   432bd:	ba 79 4d 04 00       	mov    $0x44d79,%edx
   432c2:	be 64 00 00 00       	mov    $0x64,%esi
   432c7:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   432cc:	e8 a0 fc ff ff       	callq  42f71 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   432d1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   432d5:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432d9:	48 01 d0             	add    %rdx,%rax
   432dc:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   432e0:	76 24                	jbe    43306 <virtual_memory_map+0x96>
   432e2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   432e6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432ea:	48 01 d0             	add    %rdx,%rax
   432ed:	48 85 c0             	test   %rax,%rax
   432f0:	74 14                	je     43306 <virtual_memory_map+0x96>
   432f2:	ba 8c 4d 04 00       	mov    $0x44d8c,%edx
   432f7:	be 65 00 00 00       	mov    $0x65,%esi
   432fc:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43301:	e8 6b fc ff ff       	callq  42f71 <assert_fail>
    if (perm & PTE_P) {
   43306:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43309:	48 98                	cltq   
   4330b:	83 e0 01             	and    $0x1,%eax
   4330e:	48 85 c0             	test   %rax,%rax
   43311:	74 6e                	je     43381 <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   43313:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43317:	25 ff 0f 00 00       	and    $0xfff,%eax
   4331c:	48 85 c0             	test   %rax,%rax
   4331f:	74 14                	je     43335 <virtual_memory_map+0xc5>
   43321:	ba aa 4d 04 00       	mov    $0x44daa,%edx
   43326:	be 67 00 00 00       	mov    $0x67,%esi
   4332b:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43330:	e8 3c fc ff ff       	callq  42f71 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   43335:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43339:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4333d:	48 01 d0             	add    %rdx,%rax
   43340:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   43344:	76 14                	jbe    4335a <virtual_memory_map+0xea>
   43346:	ba bd 4d 04 00       	mov    $0x44dbd,%edx
   4334b:	be 68 00 00 00       	mov    $0x68,%esi
   43350:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   43355:	e8 17 fc ff ff       	callq  42f71 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   4335a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   4335e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43362:	48 01 d0             	add    %rdx,%rax
   43365:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   4336b:	76 14                	jbe    43381 <virtual_memory_map+0x111>
   4336d:	ba cb 4d 04 00       	mov    $0x44dcb,%edx
   43372:	be 69 00 00 00       	mov    $0x69,%esi
   43377:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   4337c:	e8 f0 fb ff ff       	callq  42f71 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   43381:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   43385:	78 09                	js     43390 <virtual_memory_map+0x120>
   43387:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   4338e:	7e 14                	jle    433a4 <virtual_memory_map+0x134>
   43390:	ba e7 4d 04 00       	mov    $0x44de7,%edx
   43395:	be 6b 00 00 00       	mov    $0x6b,%esi
   4339a:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   4339f:	e8 cd fb ff ff       	callq  42f71 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   433a4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   433a8:	25 ff 0f 00 00       	and    $0xfff,%eax
   433ad:	48 85 c0             	test   %rax,%rax
   433b0:	74 14                	je     433c6 <virtual_memory_map+0x156>
   433b2:	ba 08 4e 04 00       	mov    $0x44e08,%edx
   433b7:	be 6c 00 00 00       	mov    $0x6c,%esi
   433bc:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   433c1:	e8 ab fb ff ff       	callq  42f71 <assert_fail>

    int last_index123 = -1;
   433c6:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   433cd:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   433d4:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   433d5:	e9 e1 00 00 00       	jmpq   434bb <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   433da:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   433de:	48 c1 e8 15          	shr    $0x15,%rax
   433e2:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   433e5:	8b 45 dc             	mov    -0x24(%rbp),%eax
   433e8:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   433eb:	74 20                	je     4340d <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   433ed:	8b 55 ac             	mov    -0x54(%rbp),%edx
   433f0:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   433f4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   433f8:	48 89 ce             	mov    %rcx,%rsi
   433fb:	48 89 c7             	mov    %rax,%rdi
   433fe:	e8 ce 00 00 00       	callq  434d1 <lookup_l4pagetable>
   43403:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   43407:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4340a:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   4340d:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43410:	48 98                	cltq   
   43412:	83 e0 01             	and    $0x1,%eax
   43415:	48 85 c0             	test   %rax,%rax
   43418:	74 34                	je     4344e <virtual_memory_map+0x1de>
   4341a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4341f:	74 2d                	je     4344e <virtual_memory_map+0x1de>
            // TODO
            // map `pa` at appropriate entry with permissions `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   43421:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43424:	48 63 d8             	movslq %eax,%rbx
   43427:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4342b:	be 03 00 00 00       	mov    $0x3,%esi
   43430:	48 89 c7             	mov    %rax,%rdi
   43433:	e8 9e fb ff ff       	callq  42fd6 <pageindex>
   43438:	89 c2                	mov    %eax,%edx
   4343a:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   4343e:	48 89 d9             	mov    %rbx,%rcx
   43441:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43445:	48 63 d2             	movslq %edx,%rdx
   43448:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   4344c:	eb 55                	jmp    434a3 <virtual_memory_map+0x233>
        } else if (l4pagetable) { // if page is NOT marked present
   4344e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43453:	74 26                	je     4347b <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   43455:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43459:	be 03 00 00 00       	mov    $0x3,%esi
   4345e:	48 89 c7             	mov    %rax,%rdi
   43461:	e8 70 fb ff ff       	callq  42fd6 <pageindex>
   43466:	89 c2                	mov    %eax,%edx
   43468:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4346b:	48 63 c8             	movslq %eax,%rcx
   4346e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43472:	48 63 d2             	movslq %edx,%rdx
   43475:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43479:	eb 28                	jmp    434a3 <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   4347b:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4347e:	48 98                	cltq   
   43480:	83 e0 01             	and    $0x1,%eax
   43483:	48 85 c0             	test   %rax,%rax
   43486:	74 1b                	je     434a3 <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   43488:	be 84 00 00 00       	mov    $0x84,%esi
   4348d:	bf 30 4e 04 00       	mov    $0x44e30,%edi
   43492:	b8 00 00 00 00       	mov    $0x0,%eax
   43497:	e8 b7 f7 ff ff       	callq  42c53 <log_printf>
            return -1;
   4349c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   434a1:	eb 28                	jmp    434cb <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   434a3:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   434aa:	00 
   434ab:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   434b2:	00 
   434b3:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   434ba:	00 
   434bb:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   434c0:	0f 85 14 ff ff ff    	jne    433da <virtual_memory_map+0x16a>
        }
    }
    return 0;
   434c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
   434cb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   434cf:	c9                   	leaveq 
   434d0:	c3                   	retq   

00000000000434d1 <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   434d1:	55                   	push   %rbp
   434d2:	48 89 e5             	mov    %rsp,%rbp
   434d5:	48 83 ec 40          	sub    $0x40,%rsp
   434d9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   434dd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   434e1:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   434e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   434e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   434ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   434f3:	e9 39 01 00 00       	jmpq   43631 <lookup_l4pagetable+0x160>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   434f8:	8b 55 f4             	mov    -0xc(%rbp),%edx
   434fb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   434ff:	89 d6                	mov    %edx,%esi
   43501:	48 89 c7             	mov    %rax,%rdi
   43504:	e8 cd fa ff ff       	callq  42fd6 <pageindex>
   43509:	89 c2                	mov    %eax,%edx
   4350b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4350f:	48 63 d2             	movslq %edx,%rdx
   43512:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   43516:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   4351a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4351e:	83 e0 01             	and    $0x1,%eax
   43521:	48 85 c0             	test   %rax,%rax
   43524:	75 63                	jne    43589 <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   43526:	8b 45 f4             	mov    -0xc(%rbp),%eax
   43529:	8d 48 02             	lea    0x2(%rax),%ecx
   4352c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43530:	25 ff 0f 00 00       	and    $0xfff,%eax
   43535:	48 89 c2             	mov    %rax,%rdx
   43538:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4353c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43542:	48 89 c6             	mov    %rax,%rsi
   43545:	bf 70 4e 04 00       	mov    $0x44e70,%edi
   4354a:	b8 00 00 00 00       	mov    $0x0,%eax
   4354f:	e8 ff f6 ff ff       	callq  42c53 <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   43554:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43557:	48 98                	cltq   
   43559:	83 e0 01             	and    $0x1,%eax
   4355c:	48 85 c0             	test   %rax,%rax
   4355f:	75 0a                	jne    4356b <lookup_l4pagetable+0x9a>
                return NULL;
   43561:	b8 00 00 00 00       	mov    $0x0,%eax
   43566:	e9 d4 00 00 00       	jmpq   4363f <lookup_l4pagetable+0x16e>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   4356b:	be a7 00 00 00       	mov    $0xa7,%esi
   43570:	bf d8 4e 04 00       	mov    $0x44ed8,%edi
   43575:	b8 00 00 00 00       	mov    $0x0,%eax
   4357a:	e8 d4 f6 ff ff       	callq  42c53 <log_printf>
            return NULL;
   4357f:	b8 00 00 00 00       	mov    $0x0,%eax
   43584:	e9 b6 00 00 00       	jmpq   4363f <lookup_l4pagetable+0x16e>
        }

        // sanity-check page entry and permissions
        log_printf("PE: %d\n", pe);
   43589:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4358d:	48 89 c6             	mov    %rax,%rsi
   43590:	bf 12 4f 04 00       	mov    $0x44f12,%edi
   43595:	b8 00 00 00 00       	mov    $0x0,%eax
   4359a:	e8 b4 f6 ff ff       	callq  42c53 <log_printf>
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   4359f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435a3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   435a9:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   435af:	76 14                	jbe    435c5 <lookup_l4pagetable+0xf4>
   435b1:	ba 20 4f 04 00       	mov    $0x44f20,%edx
   435b6:	be ad 00 00 00       	mov    $0xad,%esi
   435bb:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   435c0:	e8 ac f9 ff ff       	callq  42f71 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   435c5:	8b 45 cc             	mov    -0x34(%rbp),%eax
   435c8:	48 98                	cltq   
   435ca:	83 e0 02             	and    $0x2,%eax
   435cd:	48 85 c0             	test   %rax,%rax
   435d0:	74 20                	je     435f2 <lookup_l4pagetable+0x121>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   435d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435d6:	83 e0 02             	and    $0x2,%eax
   435d9:	48 85 c0             	test   %rax,%rax
   435dc:	75 14                	jne    435f2 <lookup_l4pagetable+0x121>
   435de:	ba 40 4f 04 00       	mov    $0x44f40,%edx
   435e3:	be af 00 00 00       	mov    $0xaf,%esi
   435e8:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   435ed:	e8 7f f9 ff ff       	callq  42f71 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   435f2:	8b 45 cc             	mov    -0x34(%rbp),%eax
   435f5:	48 98                	cltq   
   435f7:	83 e0 04             	and    $0x4,%eax
   435fa:	48 85 c0             	test   %rax,%rax
   435fd:	74 20                	je     4361f <lookup_l4pagetable+0x14e>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   435ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43603:	83 e0 04             	and    $0x4,%eax
   43606:	48 85 c0             	test   %rax,%rax
   43609:	75 14                	jne    4361f <lookup_l4pagetable+0x14e>
   4360b:	ba 4b 4f 04 00       	mov    $0x44f4b,%edx
   43610:	be b2 00 00 00       	mov    $0xb2,%esi
   43615:	bf 82 4b 04 00       	mov    $0x44b82,%edi
   4361a:	e8 52 f9 ff ff       	callq  42f71 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   4361f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43623:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43629:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   4362d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   43631:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   43635:	0f 8e bd fe ff ff    	jle    434f8 <lookup_l4pagetable+0x27>
    }
    return pt;
   4363b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   4363f:	c9                   	leaveq 
   43640:	c3                   	retq   

0000000000043641 <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   43641:	55                   	push   %rbp
   43642:	48 89 e5             	mov    %rsp,%rbp
   43645:	48 83 ec 50          	sub    $0x50,%rsp
   43649:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4364d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   43651:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   43655:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43659:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   4365d:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   43664:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   43665:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   4366c:	eb 41                	jmp    436af <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   4366e:	8b 55 ec             	mov    -0x14(%rbp),%edx
   43671:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43675:	89 d6                	mov    %edx,%esi
   43677:	48 89 c7             	mov    %rax,%rdi
   4367a:	e8 57 f9 ff ff       	callq  42fd6 <pageindex>
   4367f:	89 c2                	mov    %eax,%edx
   43681:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43685:	48 63 d2             	movslq %edx,%rdx
   43688:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   4368c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43690:	83 e0 06             	and    $0x6,%eax
   43693:	48 f7 d0             	not    %rax
   43696:	48 21 d0             	and    %rdx,%rax
   43699:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   4369d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436a1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   436a7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   436ab:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   436af:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   436b3:	7f 0c                	jg     436c1 <virtual_memory_lookup+0x80>
   436b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436b9:	83 e0 01             	and    $0x1,%eax
   436bc:	48 85 c0             	test   %rax,%rax
   436bf:	75 ad                	jne    4366e <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   436c1:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   436c8:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   436cf:	ff 
   436d0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   436d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436db:	83 e0 01             	and    $0x1,%eax
   436de:	48 85 c0             	test   %rax,%rax
   436e1:	74 34                	je     43717 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   436e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436e7:	48 c1 e8 0c          	shr    $0xc,%rax
   436eb:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   436ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436f2:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   436f8:	48 89 c2             	mov    %rax,%rdx
   436fb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   436ff:	25 ff 0f 00 00       	and    $0xfff,%eax
   43704:	48 09 d0             	or     %rdx,%rax
   43707:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   4370b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4370f:	25 ff 0f 00 00       	and    $0xfff,%eax
   43714:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   43717:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4371b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   4371f:	48 89 10             	mov    %rdx,(%rax)
   43722:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   43726:	48 89 50 08          	mov    %rdx,0x8(%rax)
   4372a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4372e:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   43732:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43736:	c9                   	leaveq 
   43737:	c3                   	retq   

0000000000043738 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43738:	55                   	push   %rbp
   43739:	48 89 e5             	mov    %rsp,%rbp
   4373c:	48 83 ec 40          	sub    $0x40,%rsp
   43740:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43744:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43747:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   4374b:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   43752:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43756:	78 08                	js     43760 <program_load+0x28>
   43758:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4375b:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   4375e:	7c 14                	jl     43774 <program_load+0x3c>
   43760:	ba 58 4f 04 00       	mov    $0x44f58,%edx
   43765:	be 37 00 00 00       	mov    $0x37,%esi
   4376a:	bf 88 4f 04 00       	mov    $0x44f88,%edi
   4376f:	e8 fd f7 ff ff       	callq  42f71 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   43774:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43777:	48 98                	cltq   
   43779:	48 c1 e0 04          	shl    $0x4,%rax
   4377d:	48 05 20 60 04 00    	add    $0x46020,%rax
   43783:	48 8b 00             	mov    (%rax),%rax
   43786:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   4378a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4378e:	8b 00                	mov    (%rax),%eax
   43790:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43795:	74 14                	je     437ab <program_load+0x73>
   43797:	ba 93 4f 04 00       	mov    $0x44f93,%edx
   4379c:	be 39 00 00 00       	mov    $0x39,%esi
   437a1:	bf 88 4f 04 00       	mov    $0x44f88,%edi
   437a6:	e8 c6 f7 ff ff       	callq  42f71 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   437ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437af:	48 8b 50 20          	mov    0x20(%rax),%rdx
   437b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437b7:	48 01 d0             	add    %rdx,%rax
   437ba:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   437be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   437c5:	e9 94 00 00 00       	jmpq   4385e <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   437ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
   437cd:	48 63 d0             	movslq %eax,%rdx
   437d0:	48 89 d0             	mov    %rdx,%rax
   437d3:	48 c1 e0 03          	shl    $0x3,%rax
   437d7:	48 29 d0             	sub    %rdx,%rax
   437da:	48 c1 e0 03          	shl    $0x3,%rax
   437de:	48 89 c2             	mov    %rax,%rdx
   437e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   437e5:	48 01 d0             	add    %rdx,%rax
   437e8:	8b 00                	mov    (%rax),%eax
   437ea:	83 f8 01             	cmp    $0x1,%eax
   437ed:	75 6b                	jne    4385a <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   437ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
   437f2:	48 63 d0             	movslq %eax,%rdx
   437f5:	48 89 d0             	mov    %rdx,%rax
   437f8:	48 c1 e0 03          	shl    $0x3,%rax
   437fc:	48 29 d0             	sub    %rdx,%rax
   437ff:	48 c1 e0 03          	shl    $0x3,%rax
   43803:	48 89 c2             	mov    %rax,%rdx
   43806:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4380a:	48 01 d0             	add    %rdx,%rax
   4380d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   43811:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43815:	48 01 d0             	add    %rdx,%rax
   43818:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   4381c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4381f:	48 63 d0             	movslq %eax,%rdx
   43822:	48 89 d0             	mov    %rdx,%rax
   43825:	48 c1 e0 03          	shl    $0x3,%rax
   43829:	48 29 d0             	sub    %rdx,%rax
   4382c:	48 c1 e0 03          	shl    $0x3,%rax
   43830:	48 89 c2             	mov    %rax,%rdx
   43833:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43837:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   4383b:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4383f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43843:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43847:	48 89 c7             	mov    %rax,%rdi
   4384a:	e8 3d 00 00 00       	callq  4388c <program_load_segment>
   4384f:	85 c0                	test   %eax,%eax
   43851:	79 07                	jns    4385a <program_load+0x122>
                return -1;
   43853:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43858:	eb 30                	jmp    4388a <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   4385a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4385e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43862:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43866:	0f b7 c0             	movzwl %ax,%eax
   43869:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   4386c:	0f 8c 58 ff ff ff    	jl     437ca <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   43872:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43876:	48 8b 50 18          	mov    0x18(%rax),%rdx
   4387a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4387e:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43885:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4388a:	c9                   	leaveq 
   4388b:	c3                   	retq   

000000000004388c <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   4388c:	55                   	push   %rbp
   4388d:	48 89 e5             	mov    %rsp,%rbp
   43890:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43894:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
   43898:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
   4389c:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   438a0:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   438a4:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438a8:	48 8b 40 10          	mov    0x10(%rax),%rax
   438ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   438b0:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438b4:	48 8b 50 20          	mov    0x20(%rax),%rdx
   438b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   438bc:	48 01 d0             	add    %rdx,%rax
   438bf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   438c3:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438c7:	48 8b 50 28          	mov    0x28(%rax),%rdx
   438cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   438cf:	48 01 d0             	add    %rdx,%rax
   438d2:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   438d6:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   438dd:	ff 

    int read_only = (ph->p_flags & ELF_PFLAG_WRITE) == 0;
   438de:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438e2:	8b 40 04             	mov    0x4(%rax),%eax
   438e5:	83 e0 02             	and    $0x2,%eax
   438e8:	85 c0                	test   %eax,%eax
   438ea:	0f 94 c0             	sete   %al
   438ed:	0f b6 c0             	movzbl %al,%eax
   438f0:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    int perm = read_only ? PTE_P | PTE_U : PTE_P | PTE_W | PTE_U;
   438f3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   438f7:	74 07                	je     43900 <program_load_segment+0x74>
   438f9:	b8 05 00 00 00       	mov    $0x5,%eax
   438fe:	eb 05                	jmp    43905 <program_load_segment+0x79>
   43900:	b8 07 00 00 00       	mov    $0x7,%eax
   43905:	89 45 d0             	mov    %eax,-0x30(%rbp)
    vamapping map;

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43908:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4390c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43910:	e9 10 01 00 00       	jmpq   43a25 <program_load_segment+0x199>
        int free_page_number = get_free_page_number();
   43915:	b8 00 00 00 00       	mov    $0x0,%eax
   4391a:	e8 e4 ca ff ff       	callq  40403 <get_free_page_number>
   4391f:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (free_page_number < 0) {
   43922:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
   43926:	79 4d                	jns    43975 <program_load_segment+0xe9>
            free_process_pages(p->p_pid, p->p_pagetable);
   43928:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4392c:	48 8b 90 d0 00 00 00 	mov    0xd0(%rax),%rdx
   43933:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43937:	8b 00                	mov    (%rax),%eax
   43939:	48 89 d6             	mov    %rdx,%rsi
   4393c:	89 c7                	mov    %eax,%edi
   4393e:	e8 e8 d2 ff ff       	callq  40c2b <free_process_pages>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43943:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43947:	8b 00                	mov    (%rax),%eax
   43949:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4394d:	49 89 d0             	mov    %rdx,%r8
   43950:	89 c1                	mov    %eax,%ecx
   43952:	ba b0 4f 04 00       	mov    $0x44fb0,%edx
   43957:	be 00 c0 00 00       	mov    $0xc000,%esi
   4395c:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43961:	b8 00 00 00 00       	mov    $0x0,%eax
   43966:	e8 c5 0a 00 00       	callq  44430 <console_printf>
            return -1;
   4396b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43970:	e9 7f 01 00 00       	jmpq   43af4 <program_load_segment+0x268>
        }

        uintptr_t new_addr = PAGEADDRESS(free_page_number);
   43975:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43978:	48 98                	cltq   
   4397a:	48 c1 e0 0c          	shl    $0xc,%rax
   4397e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        int assign_status = assign_physical_page(new_addr, p->p_pid);
   43982:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43986:	8b 00                	mov    (%rax),%eax
   43988:	0f be d0             	movsbl %al,%edx
   4398b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4398f:	89 d6                	mov    %edx,%esi
   43991:	48 89 c7             	mov    %rax,%rdi
   43994:	e8 a5 d0 ff ff       	callq  40a3e <assign_physical_page>
   43999:	89 45 bc             	mov    %eax,-0x44(%rbp)
        if (assign_status < 0) {
   4399c:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   439a0:	79 4d                	jns    439ef <program_load_segment+0x163>
            free_process_pages(p->p_pid, p->p_pagetable);
   439a2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439a6:	48 8b 90 d0 00 00 00 	mov    0xd0(%rax),%rdx
   439ad:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439b1:	8b 00                	mov    (%rax),%eax
   439b3:	48 89 d6             	mov    %rdx,%rsi
   439b6:	89 c7                	mov    %eax,%edi
   439b8:	e8 6e d2 ff ff       	callq  40c2b <free_process_pages>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   439bd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439c1:	8b 00                	mov    (%rax),%eax
   439c3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   439c7:	49 89 d0             	mov    %rdx,%r8
   439ca:	89 c1                	mov    %eax,%ecx
   439cc:	ba b0 4f 04 00       	mov    $0x44fb0,%edx
   439d1:	be 00 c0 00 00       	mov    $0xc000,%esi
   439d6:	bf e0 06 00 00       	mov    $0x6e0,%edi
   439db:	b8 00 00 00 00       	mov    $0x0,%eax
   439e0:	e8 4b 0a 00 00       	callq  44430 <console_printf>
            return -1;
   439e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   439ea:	e9 05 01 00 00       	jmpq   43af4 <program_load_segment+0x268>
        }

        virtual_memory_map(p->p_pagetable, addr, PAGEADDRESS(free_page_number), PAGESIZE, PTE_U | PTE_W | PTE_P);
   439ef:	8b 45 cc             	mov    -0x34(%rbp),%eax
   439f2:	48 98                	cltq   
   439f4:	48 c1 e0 0c          	shl    $0xc,%rax
   439f8:	48 89 c2             	mov    %rax,%rdx
   439fb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439ff:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43a06:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43a0a:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43a10:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43a15:	48 89 c7             	mov    %rax,%rdi
   43a18:	e8 53 f8 ff ff       	callq  43270 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43a1d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43a24:	00 
   43a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43a29:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43a2d:	0f 82 e2 fe ff ff    	jb     43915 <program_load_segment+0x89>
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   43a33:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43a37:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43a3e:	48 89 c7             	mov    %rax,%rdi
   43a41:	e8 f9 f6 ff ff       	callq  4313f <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   43a46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43a4a:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43a4e:	48 89 c2             	mov    %rax,%rdx
   43a51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a55:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43a59:	48 89 ce             	mov    %rcx,%rsi
   43a5c:	48 89 c7             	mov    %rax,%rdi
   43a5f:	e8 2e 01 00 00       	callq  43b92 <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   43a64:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43a68:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   43a6c:	48 89 c2             	mov    %rax,%rdx
   43a6f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43a73:	be 00 00 00 00       	mov    $0x0,%esi
   43a78:	48 89 c7             	mov    %rax,%rdi
   43a7b:	e8 7b 01 00 00       	callq  43bfb <memset>

    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43a80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a84:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43a88:	eb 4c                	jmp    43ad6 <program_load_segment+0x24a>
        map = virtual_memory_lookup(p->p_pagetable, addr);
   43a8a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43a8e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   43a95:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   43a99:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   43a9d:	48 89 ce             	mov    %rcx,%rsi
   43aa0:	48 89 c7             	mov    %rax,%rdi
   43aa3:	e8 99 fb ff ff       	callq  43641 <virtual_memory_lookup>
        virtual_memory_map(p->p_pagetable, addr, map.pa, PAGESIZE, perm);
   43aa8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   43aac:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43ab0:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43ab7:	8b 4d d0             	mov    -0x30(%rbp),%ecx
   43aba:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   43abe:	41 89 c8             	mov    %ecx,%r8d
   43ac1:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43ac6:	48 89 c7             	mov    %rax,%rdi
   43ac9:	e8 a2 f7 ff ff       	callq  43270 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43ace:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   43ad5:	00 
   43ad6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43ada:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43ade:	72 aa                	jb     43a8a <program_load_segment+0x1fe>
    }

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   43ae0:	48 8b 05 19 e5 00 00 	mov    0xe519(%rip),%rax        # 52000 <kernel_pagetable>
   43ae7:	48 89 c7             	mov    %rax,%rdi
   43aea:	e8 50 f6 ff ff       	callq  4313f <set_pagetable>
    return 0;
   43aef:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43af4:	c9                   	leaveq 
   43af5:	c3                   	retq   

0000000000043af6 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   43af6:	48 89 f9             	mov    %rdi,%rcx
   43af9:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43afb:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   43b02:	00 
   43b03:	72 08                	jb     43b0d <console_putc+0x17>
        cp->cursor = console;
   43b05:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   43b0c:	00 
    }
    if (c == '\n') {
   43b0d:	40 80 fe 0a          	cmp    $0xa,%sil
   43b11:	74 16                	je     43b29 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   43b13:	48 8b 41 08          	mov    0x8(%rcx),%rax
   43b17:	48 8d 50 02          	lea    0x2(%rax),%rdx
   43b1b:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   43b1f:	40 0f b6 f6          	movzbl %sil,%esi
   43b23:	09 fe                	or     %edi,%esi
   43b25:	66 89 30             	mov    %si,(%rax)
    }
}
   43b28:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   43b29:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   43b2d:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   43b34:	4c 89 c6             	mov    %r8,%rsi
   43b37:	48 d1 fe             	sar    %rsi
   43b3a:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43b41:	66 66 66 
   43b44:	48 89 f0             	mov    %rsi,%rax
   43b47:	48 f7 ea             	imul   %rdx
   43b4a:	48 c1 fa 05          	sar    $0x5,%rdx
   43b4e:	49 c1 f8 3f          	sar    $0x3f,%r8
   43b52:	4c 29 c2             	sub    %r8,%rdx
   43b55:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   43b59:	48 c1 e2 04          	shl    $0x4,%rdx
   43b5d:	89 f0                	mov    %esi,%eax
   43b5f:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   43b61:	83 cf 20             	or     $0x20,%edi
   43b64:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43b68:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   43b6c:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   43b70:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   43b73:	83 c0 01             	add    $0x1,%eax
   43b76:	83 f8 50             	cmp    $0x50,%eax
   43b79:	75 e9                	jne    43b64 <console_putc+0x6e>
   43b7b:	c3                   	retq   

0000000000043b7c <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43b7c:	48 8b 47 08          	mov    0x8(%rdi),%rax
   43b80:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   43b84:	73 0b                	jae    43b91 <string_putc+0x15>
        *sp->s++ = c;
   43b86:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43b8a:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   43b8e:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   43b91:	c3                   	retq   

0000000000043b92 <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   43b92:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43b95:	48 85 d2             	test   %rdx,%rdx
   43b98:	74 17                	je     43bb1 <memcpy+0x1f>
   43b9a:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   43b9f:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   43ba4:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43ba8:	48 83 c1 01          	add    $0x1,%rcx
   43bac:	48 39 d1             	cmp    %rdx,%rcx
   43baf:	75 ee                	jne    43b9f <memcpy+0xd>
}
   43bb1:	c3                   	retq   

0000000000043bb2 <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   43bb2:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   43bb5:	48 39 fe             	cmp    %rdi,%rsi
   43bb8:	72 1d                	jb     43bd7 <memmove+0x25>
        while (n-- > 0) {
   43bba:	b9 00 00 00 00       	mov    $0x0,%ecx
   43bbf:	48 85 d2             	test   %rdx,%rdx
   43bc2:	74 12                	je     43bd6 <memmove+0x24>
            *d++ = *s++;
   43bc4:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   43bc8:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43bcc:	48 83 c1 01          	add    $0x1,%rcx
   43bd0:	48 39 ca             	cmp    %rcx,%rdx
   43bd3:	75 ef                	jne    43bc4 <memmove+0x12>
}
   43bd5:	c3                   	retq   
   43bd6:	c3                   	retq   
    if (s < d && s + n > d) {
   43bd7:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   43bdb:	48 39 cf             	cmp    %rcx,%rdi
   43bde:	73 da                	jae    43bba <memmove+0x8>
        while (n-- > 0) {
   43be0:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   43be4:	48 85 d2             	test   %rdx,%rdx
   43be7:	74 ec                	je     43bd5 <memmove+0x23>
            *--d = *--s;
   43be9:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   43bed:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   43bf0:	48 83 e9 01          	sub    $0x1,%rcx
   43bf4:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43bf8:	75 ef                	jne    43be9 <memmove+0x37>
   43bfa:	c3                   	retq   

0000000000043bfb <memset>:
void* memset(void* v, int c, size_t n) {
   43bfb:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43bfe:	48 85 d2             	test   %rdx,%rdx
   43c01:	74 12                	je     43c15 <memset+0x1a>
   43c03:	48 01 fa             	add    %rdi,%rdx
   43c06:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   43c09:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43c0c:	48 83 c1 01          	add    $0x1,%rcx
   43c10:	48 39 ca             	cmp    %rcx,%rdx
   43c13:	75 f4                	jne    43c09 <memset+0xe>
}
   43c15:	c3                   	retq   

0000000000043c16 <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   43c16:	80 3f 00             	cmpb   $0x0,(%rdi)
   43c19:	74 10                	je     43c2b <strlen+0x15>
   43c1b:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43c20:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   43c24:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   43c28:	75 f6                	jne    43c20 <strlen+0xa>
   43c2a:	c3                   	retq   
   43c2b:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43c30:	c3                   	retq   

0000000000043c31 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   43c31:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43c34:	ba 00 00 00 00       	mov    $0x0,%edx
   43c39:	48 85 f6             	test   %rsi,%rsi
   43c3c:	74 11                	je     43c4f <strnlen+0x1e>
   43c3e:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   43c42:	74 0c                	je     43c50 <strnlen+0x1f>
        ++n;
   43c44:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43c48:	48 39 d0             	cmp    %rdx,%rax
   43c4b:	75 f1                	jne    43c3e <strnlen+0xd>
   43c4d:	eb 04                	jmp    43c53 <strnlen+0x22>
   43c4f:	c3                   	retq   
   43c50:	48 89 d0             	mov    %rdx,%rax
}
   43c53:	c3                   	retq   

0000000000043c54 <strcpy>:
char* strcpy(char* dst, const char* src) {
   43c54:	48 89 f8             	mov    %rdi,%rax
   43c57:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   43c5c:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   43c60:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   43c63:	48 83 c2 01          	add    $0x1,%rdx
   43c67:	84 c9                	test   %cl,%cl
   43c69:	75 f1                	jne    43c5c <strcpy+0x8>
}
   43c6b:	c3                   	retq   

0000000000043c6c <strcmp>:
    while (*a && *b && *a == *b) {
   43c6c:	0f b6 07             	movzbl (%rdi),%eax
   43c6f:	84 c0                	test   %al,%al
   43c71:	74 1a                	je     43c8d <strcmp+0x21>
   43c73:	0f b6 16             	movzbl (%rsi),%edx
   43c76:	38 c2                	cmp    %al,%dl
   43c78:	75 13                	jne    43c8d <strcmp+0x21>
   43c7a:	84 d2                	test   %dl,%dl
   43c7c:	74 0f                	je     43c8d <strcmp+0x21>
        ++a, ++b;
   43c7e:	48 83 c7 01          	add    $0x1,%rdi
   43c82:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   43c86:	0f b6 07             	movzbl (%rdi),%eax
   43c89:	84 c0                	test   %al,%al
   43c8b:	75 e6                	jne    43c73 <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   43c8d:	3a 06                	cmp    (%rsi),%al
   43c8f:	0f 97 c0             	seta   %al
   43c92:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   43c95:	83 d8 00             	sbb    $0x0,%eax
}
   43c98:	c3                   	retq   

0000000000043c99 <strchr>:
    while (*s && *s != (char) c) {
   43c99:	0f b6 07             	movzbl (%rdi),%eax
   43c9c:	84 c0                	test   %al,%al
   43c9e:	74 10                	je     43cb0 <strchr+0x17>
   43ca0:	40 38 f0             	cmp    %sil,%al
   43ca3:	74 18                	je     43cbd <strchr+0x24>
        ++s;
   43ca5:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   43ca9:	0f b6 07             	movzbl (%rdi),%eax
   43cac:	84 c0                	test   %al,%al
   43cae:	75 f0                	jne    43ca0 <strchr+0x7>
        return NULL;
   43cb0:	40 84 f6             	test   %sil,%sil
   43cb3:	b8 00 00 00 00       	mov    $0x0,%eax
   43cb8:	48 0f 44 c7          	cmove  %rdi,%rax
}
   43cbc:	c3                   	retq   
   43cbd:	48 89 f8             	mov    %rdi,%rax
   43cc0:	c3                   	retq   

0000000000043cc1 <rand>:
    if (!rand_seed_set) {
   43cc1:	83 3d 3c 43 01 00 00 	cmpl   $0x0,0x1433c(%rip)        # 58004 <rand_seed_set>
   43cc8:	74 1b                	je     43ce5 <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43cca:	69 05 2c 43 01 00 0d 	imul   $0x19660d,0x1432c(%rip),%eax        # 58000 <rand_seed>
   43cd1:	66 19 00 
   43cd4:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43cd9:	89 05 21 43 01 00    	mov    %eax,0x14321(%rip)        # 58000 <rand_seed>
    return rand_seed & RAND_MAX;
   43cdf:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   43ce4:	c3                   	retq   
    rand_seed = seed;
   43ce5:	c7 05 11 43 01 00 9e 	movl   $0x30d4879e,0x14311(%rip)        # 58000 <rand_seed>
   43cec:	87 d4 30 
    rand_seed_set = 1;
   43cef:	c7 05 0b 43 01 00 01 	movl   $0x1,0x1430b(%rip)        # 58004 <rand_seed_set>
   43cf6:	00 00 00 
}
   43cf9:	eb cf                	jmp    43cca <rand+0x9>

0000000000043cfb <srand>:
    rand_seed = seed;
   43cfb:	89 3d ff 42 01 00    	mov    %edi,0x142ff(%rip)        # 58000 <rand_seed>
    rand_seed_set = 1;
   43d01:	c7 05 f9 42 01 00 01 	movl   $0x1,0x142f9(%rip)        # 58004 <rand_seed_set>
   43d08:	00 00 00 
}
   43d0b:	c3                   	retq   

0000000000043d0c <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43d0c:	55                   	push   %rbp
   43d0d:	48 89 e5             	mov    %rsp,%rbp
   43d10:	41 57                	push   %r15
   43d12:	41 56                	push   %r14
   43d14:	41 55                	push   %r13
   43d16:	41 54                	push   %r12
   43d18:	53                   	push   %rbx
   43d19:	48 83 ec 58          	sub    $0x58,%rsp
   43d1d:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   43d21:	0f b6 02             	movzbl (%rdx),%eax
   43d24:	84 c0                	test   %al,%al
   43d26:	0f 84 b0 06 00 00    	je     443dc <printer_vprintf+0x6d0>
   43d2c:	49 89 fe             	mov    %rdi,%r14
   43d2f:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   43d32:	41 89 f7             	mov    %esi,%r15d
   43d35:	e9 a4 04 00 00       	jmpq   441de <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   43d3a:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   43d3f:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   43d45:	45 84 e4             	test   %r12b,%r12b
   43d48:	0f 84 82 06 00 00    	je     443d0 <printer_vprintf+0x6c4>
        int flags = 0;
   43d4e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   43d54:	41 0f be f4          	movsbl %r12b,%esi
   43d58:	bf f1 51 04 00       	mov    $0x451f1,%edi
   43d5d:	e8 37 ff ff ff       	callq  43c99 <strchr>
   43d62:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   43d65:	48 85 c0             	test   %rax,%rax
   43d68:	74 55                	je     43dbf <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   43d6a:	48 81 e9 f1 51 04 00 	sub    $0x451f1,%rcx
   43d71:	b8 01 00 00 00       	mov    $0x1,%eax
   43d76:	d3 e0                	shl    %cl,%eax
   43d78:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43d7b:	48 83 c3 01          	add    $0x1,%rbx
   43d7f:	44 0f b6 23          	movzbl (%rbx),%r12d
   43d83:	45 84 e4             	test   %r12b,%r12b
   43d86:	75 cc                	jne    43d54 <printer_vprintf+0x48>
   43d88:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   43d8c:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   43d92:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   43d99:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   43d9c:	0f 84 a9 00 00 00    	je     43e4b <printer_vprintf+0x13f>
        int length = 0;
   43da2:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   43da7:	0f b6 13             	movzbl (%rbx),%edx
   43daa:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43dad:	3c 37                	cmp    $0x37,%al
   43daf:	0f 87 c4 04 00 00    	ja     44279 <printer_vprintf+0x56d>
   43db5:	0f b6 c0             	movzbl %al,%eax
   43db8:	ff 24 c5 00 50 04 00 	jmpq   *0x45000(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   43dbf:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   43dc3:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   43dc8:	3c 08                	cmp    $0x8,%al
   43dca:	77 2f                	ja     43dfb <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43dcc:	0f b6 03             	movzbl (%rbx),%eax
   43dcf:	8d 50 d0             	lea    -0x30(%rax),%edx
   43dd2:	80 fa 09             	cmp    $0x9,%dl
   43dd5:	77 5e                	ja     43e35 <printer_vprintf+0x129>
   43dd7:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43ddd:	48 83 c3 01          	add    $0x1,%rbx
   43de1:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   43de6:	0f be c0             	movsbl %al,%eax
   43de9:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43dee:	0f b6 03             	movzbl (%rbx),%eax
   43df1:	8d 50 d0             	lea    -0x30(%rax),%edx
   43df4:	80 fa 09             	cmp    $0x9,%dl
   43df7:	76 e4                	jbe    43ddd <printer_vprintf+0xd1>
   43df9:	eb 97                	jmp    43d92 <printer_vprintf+0x86>
        } else if (*format == '*') {
   43dfb:	41 80 fc 2a          	cmp    $0x2a,%r12b
   43dff:	75 3f                	jne    43e40 <printer_vprintf+0x134>
            width = va_arg(val, int);
   43e01:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43e05:	8b 07                	mov    (%rdi),%eax
   43e07:	83 f8 2f             	cmp    $0x2f,%eax
   43e0a:	77 17                	ja     43e23 <printer_vprintf+0x117>
   43e0c:	89 c2                	mov    %eax,%edx
   43e0e:	48 03 57 10          	add    0x10(%rdi),%rdx
   43e12:	83 c0 08             	add    $0x8,%eax
   43e15:	89 07                	mov    %eax,(%rdi)
   43e17:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43e1a:	48 83 c3 01          	add    $0x1,%rbx
   43e1e:	e9 6f ff ff ff       	jmpq   43d92 <printer_vprintf+0x86>
            width = va_arg(val, int);
   43e23:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43e27:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43e2b:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43e2f:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43e33:	eb e2                	jmp    43e17 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43e35:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43e3b:	e9 52 ff ff ff       	jmpq   43d92 <printer_vprintf+0x86>
        int width = -1;
   43e40:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   43e46:	e9 47 ff ff ff       	jmpq   43d92 <printer_vprintf+0x86>
            ++format;
   43e4b:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   43e4f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   43e53:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43e56:	80 f9 09             	cmp    $0x9,%cl
   43e59:	76 13                	jbe    43e6e <printer_vprintf+0x162>
            } else if (*format == '*') {
   43e5b:	3c 2a                	cmp    $0x2a,%al
   43e5d:	74 33                	je     43e92 <printer_vprintf+0x186>
            ++format;
   43e5f:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   43e62:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   43e69:	e9 34 ff ff ff       	jmpq   43da2 <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43e6e:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   43e73:	48 83 c2 01          	add    $0x1,%rdx
   43e77:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43e7a:	0f be c0             	movsbl %al,%eax
   43e7d:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43e81:	0f b6 02             	movzbl (%rdx),%eax
   43e84:	8d 70 d0             	lea    -0x30(%rax),%esi
   43e87:	40 80 fe 09          	cmp    $0x9,%sil
   43e8b:	76 e6                	jbe    43e73 <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   43e8d:	48 89 d3             	mov    %rdx,%rbx
   43e90:	eb 1c                	jmp    43eae <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   43e92:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43e96:	8b 07                	mov    (%rdi),%eax
   43e98:	83 f8 2f             	cmp    $0x2f,%eax
   43e9b:	77 23                	ja     43ec0 <printer_vprintf+0x1b4>
   43e9d:	89 c2                	mov    %eax,%edx
   43e9f:	48 03 57 10          	add    0x10(%rdi),%rdx
   43ea3:	83 c0 08             	add    $0x8,%eax
   43ea6:	89 07                	mov    %eax,(%rdi)
   43ea8:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43eaa:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   43eae:	85 c9                	test   %ecx,%ecx
   43eb0:	b8 00 00 00 00       	mov    $0x0,%eax
   43eb5:	0f 49 c1             	cmovns %ecx,%eax
   43eb8:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43ebb:	e9 e2 fe ff ff       	jmpq   43da2 <printer_vprintf+0x96>
                precision = va_arg(val, int);
   43ec0:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ec4:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43ec8:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43ecc:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43ed0:	eb d6                	jmp    43ea8 <printer_vprintf+0x19c>
        switch (*format) {
   43ed2:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43ed7:	e9 f3 00 00 00       	jmpq   43fcf <printer_vprintf+0x2c3>
            ++format;
   43edc:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   43ee0:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   43ee5:	e9 bd fe ff ff       	jmpq   43da7 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43eea:	85 c9                	test   %ecx,%ecx
   43eec:	74 55                	je     43f43 <printer_vprintf+0x237>
   43eee:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43ef2:	8b 07                	mov    (%rdi),%eax
   43ef4:	83 f8 2f             	cmp    $0x2f,%eax
   43ef7:	77 38                	ja     43f31 <printer_vprintf+0x225>
   43ef9:	89 c2                	mov    %eax,%edx
   43efb:	48 03 57 10          	add    0x10(%rdi),%rdx
   43eff:	83 c0 08             	add    $0x8,%eax
   43f02:	89 07                	mov    %eax,(%rdi)
   43f04:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43f07:	48 89 d0             	mov    %rdx,%rax
   43f0a:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43f0e:	49 89 d0             	mov    %rdx,%r8
   43f11:	49 f7 d8             	neg    %r8
   43f14:	25 80 00 00 00       	and    $0x80,%eax
   43f19:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43f1d:	0b 45 a8             	or     -0x58(%rbp),%eax
   43f20:	83 c8 60             	or     $0x60,%eax
   43f23:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   43f26:	41 bc ef 4f 04 00    	mov    $0x44fef,%r12d
            break;
   43f2c:	e9 35 01 00 00       	jmpq   44066 <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43f31:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f35:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f39:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f3d:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f41:	eb c1                	jmp    43f04 <printer_vprintf+0x1f8>
   43f43:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f47:	8b 07                	mov    (%rdi),%eax
   43f49:	83 f8 2f             	cmp    $0x2f,%eax
   43f4c:	77 10                	ja     43f5e <printer_vprintf+0x252>
   43f4e:	89 c2                	mov    %eax,%edx
   43f50:	48 03 57 10          	add    0x10(%rdi),%rdx
   43f54:	83 c0 08             	add    $0x8,%eax
   43f57:	89 07                	mov    %eax,(%rdi)
   43f59:	48 63 12             	movslq (%rdx),%rdx
   43f5c:	eb a9                	jmp    43f07 <printer_vprintf+0x1fb>
   43f5e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f62:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43f66:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f6a:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43f6e:	eb e9                	jmp    43f59 <printer_vprintf+0x24d>
        int base = 10;
   43f70:	be 0a 00 00 00       	mov    $0xa,%esi
   43f75:	eb 58                	jmp    43fcf <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43f77:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f7b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f7f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f83:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f87:	eb 60                	jmp    43fe9 <printer_vprintf+0x2dd>
   43f89:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f8d:	8b 07                	mov    (%rdi),%eax
   43f8f:	83 f8 2f             	cmp    $0x2f,%eax
   43f92:	77 10                	ja     43fa4 <printer_vprintf+0x298>
   43f94:	89 c2                	mov    %eax,%edx
   43f96:	48 03 57 10          	add    0x10(%rdi),%rdx
   43f9a:	83 c0 08             	add    $0x8,%eax
   43f9d:	89 07                	mov    %eax,(%rdi)
   43f9f:	44 8b 02             	mov    (%rdx),%r8d
   43fa2:	eb 48                	jmp    43fec <printer_vprintf+0x2e0>
   43fa4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43fa8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43fac:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43fb0:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43fb4:	eb e9                	jmp    43f9f <printer_vprintf+0x293>
   43fb6:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43fb9:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   43fc0:	bf e0 51 04 00       	mov    $0x451e0,%edi
   43fc5:	e9 e2 02 00 00       	jmpq   442ac <printer_vprintf+0x5a0>
            base = 16;
   43fca:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43fcf:	85 c9                	test   %ecx,%ecx
   43fd1:	74 b6                	je     43f89 <printer_vprintf+0x27d>
   43fd3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43fd7:	8b 01                	mov    (%rcx),%eax
   43fd9:	83 f8 2f             	cmp    $0x2f,%eax
   43fdc:	77 99                	ja     43f77 <printer_vprintf+0x26b>
   43fde:	89 c2                	mov    %eax,%edx
   43fe0:	48 03 51 10          	add    0x10(%rcx),%rdx
   43fe4:	83 c0 08             	add    $0x8,%eax
   43fe7:	89 01                	mov    %eax,(%rcx)
   43fe9:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43fec:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   43ff0:	85 f6                	test   %esi,%esi
   43ff2:	79 c2                	jns    43fb6 <printer_vprintf+0x2aa>
        base = -base;
   43ff4:	41 89 f1             	mov    %esi,%r9d
   43ff7:	f7 de                	neg    %esi
   43ff9:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   44000:	bf c0 51 04 00       	mov    $0x451c0,%edi
   44005:	e9 a2 02 00 00       	jmpq   442ac <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   4400a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4400e:	8b 07                	mov    (%rdi),%eax
   44010:	83 f8 2f             	cmp    $0x2f,%eax
   44013:	77 1c                	ja     44031 <printer_vprintf+0x325>
   44015:	89 c2                	mov    %eax,%edx
   44017:	48 03 57 10          	add    0x10(%rdi),%rdx
   4401b:	83 c0 08             	add    $0x8,%eax
   4401e:	89 07                	mov    %eax,(%rdi)
   44020:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   44023:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   4402a:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   4402f:	eb c3                	jmp    43ff4 <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   44031:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44035:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44039:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4403d:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44041:	eb dd                	jmp    44020 <printer_vprintf+0x314>
            data = va_arg(val, char*);
   44043:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44047:	8b 01                	mov    (%rcx),%eax
   44049:	83 f8 2f             	cmp    $0x2f,%eax
   4404c:	0f 87 a5 01 00 00    	ja     441f7 <printer_vprintf+0x4eb>
   44052:	89 c2                	mov    %eax,%edx
   44054:	48 03 51 10          	add    0x10(%rcx),%rdx
   44058:	83 c0 08             	add    $0x8,%eax
   4405b:	89 01                	mov    %eax,(%rcx)
   4405d:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   44060:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   44066:	8b 45 a8             	mov    -0x58(%rbp),%eax
   44069:	83 e0 20             	and    $0x20,%eax
   4406c:	89 45 8c             	mov    %eax,-0x74(%rbp)
   4406f:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   44075:	0f 85 21 02 00 00    	jne    4429c <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   4407b:	8b 45 a8             	mov    -0x58(%rbp),%eax
   4407e:	89 45 88             	mov    %eax,-0x78(%rbp)
   44081:	83 e0 60             	and    $0x60,%eax
   44084:	83 f8 60             	cmp    $0x60,%eax
   44087:	0f 84 54 02 00 00    	je     442e1 <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   4408d:	8b 45 a8             	mov    -0x58(%rbp),%eax
   44090:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   44093:	48 c7 45 a0 ef 4f 04 	movq   $0x44fef,-0x60(%rbp)
   4409a:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   4409b:	83 f8 21             	cmp    $0x21,%eax
   4409e:	0f 84 79 02 00 00    	je     4431d <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   440a4:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   440a7:	89 f8                	mov    %edi,%eax
   440a9:	f7 d0                	not    %eax
   440ab:	c1 e8 1f             	shr    $0x1f,%eax
   440ae:	89 45 84             	mov    %eax,-0x7c(%rbp)
   440b1:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   440b5:	0f 85 9e 02 00 00    	jne    44359 <printer_vprintf+0x64d>
   440bb:	84 c0                	test   %al,%al
   440bd:	0f 84 96 02 00 00    	je     44359 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   440c3:	48 63 f7             	movslq %edi,%rsi
   440c6:	4c 89 e7             	mov    %r12,%rdi
   440c9:	e8 63 fb ff ff       	callq  43c31 <strnlen>
   440ce:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   440d1:	8b 45 88             	mov    -0x78(%rbp),%eax
   440d4:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   440d7:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   440de:	83 f8 22             	cmp    $0x22,%eax
   440e1:	0f 84 aa 02 00 00    	je     44391 <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   440e7:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   440eb:	e8 26 fb ff ff       	callq  43c16 <strlen>
   440f0:	8b 55 9c             	mov    -0x64(%rbp),%edx
   440f3:	03 55 98             	add    -0x68(%rbp),%edx
   440f6:	44 89 e9             	mov    %r13d,%ecx
   440f9:	29 d1                	sub    %edx,%ecx
   440fb:	29 c1                	sub    %eax,%ecx
   440fd:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   44100:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44103:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   44107:	75 2d                	jne    44136 <printer_vprintf+0x42a>
   44109:	85 c9                	test   %ecx,%ecx
   4410b:	7e 29                	jle    44136 <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   4410d:	44 89 fa             	mov    %r15d,%edx
   44110:	be 20 00 00 00       	mov    $0x20,%esi
   44115:	4c 89 f7             	mov    %r14,%rdi
   44118:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   4411b:	41 83 ed 01          	sub    $0x1,%r13d
   4411f:	45 85 ed             	test   %r13d,%r13d
   44122:	7f e9                	jg     4410d <printer_vprintf+0x401>
   44124:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   44127:	85 ff                	test   %edi,%edi
   44129:	b8 01 00 00 00       	mov    $0x1,%eax
   4412e:	0f 4f c7             	cmovg  %edi,%eax
   44131:	29 c7                	sub    %eax,%edi
   44133:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   44136:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   4413a:	0f b6 07             	movzbl (%rdi),%eax
   4413d:	84 c0                	test   %al,%al
   4413f:	74 22                	je     44163 <printer_vprintf+0x457>
   44141:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44145:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   44148:	0f b6 f0             	movzbl %al,%esi
   4414b:	44 89 fa             	mov    %r15d,%edx
   4414e:	4c 89 f7             	mov    %r14,%rdi
   44151:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   44154:	48 83 c3 01          	add    $0x1,%rbx
   44158:	0f b6 03             	movzbl (%rbx),%eax
   4415b:	84 c0                	test   %al,%al
   4415d:	75 e9                	jne    44148 <printer_vprintf+0x43c>
   4415f:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   44163:	8b 45 9c             	mov    -0x64(%rbp),%eax
   44166:	85 c0                	test   %eax,%eax
   44168:	7e 1d                	jle    44187 <printer_vprintf+0x47b>
   4416a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4416e:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   44170:	44 89 fa             	mov    %r15d,%edx
   44173:	be 30 00 00 00       	mov    $0x30,%esi
   44178:	4c 89 f7             	mov    %r14,%rdi
   4417b:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   4417e:	83 eb 01             	sub    $0x1,%ebx
   44181:	75 ed                	jne    44170 <printer_vprintf+0x464>
   44183:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   44187:	8b 45 98             	mov    -0x68(%rbp),%eax
   4418a:	85 c0                	test   %eax,%eax
   4418c:	7e 27                	jle    441b5 <printer_vprintf+0x4a9>
   4418e:	89 c0                	mov    %eax,%eax
   44190:	4c 01 e0             	add    %r12,%rax
   44193:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44197:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   4419a:	41 0f b6 34 24       	movzbl (%r12),%esi
   4419f:	44 89 fa             	mov    %r15d,%edx
   441a2:	4c 89 f7             	mov    %r14,%rdi
   441a5:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   441a8:	49 83 c4 01          	add    $0x1,%r12
   441ac:	49 39 dc             	cmp    %rbx,%r12
   441af:	75 e9                	jne    4419a <printer_vprintf+0x48e>
   441b1:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   441b5:	45 85 ed             	test   %r13d,%r13d
   441b8:	7e 14                	jle    441ce <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   441ba:	44 89 fa             	mov    %r15d,%edx
   441bd:	be 20 00 00 00       	mov    $0x20,%esi
   441c2:	4c 89 f7             	mov    %r14,%rdi
   441c5:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   441c8:	41 83 ed 01          	sub    $0x1,%r13d
   441cc:	75 ec                	jne    441ba <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   441ce:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   441d2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   441d6:	84 c0                	test   %al,%al
   441d8:	0f 84 fe 01 00 00    	je     443dc <printer_vprintf+0x6d0>
        if (*format != '%') {
   441de:	3c 25                	cmp    $0x25,%al
   441e0:	0f 84 54 fb ff ff    	je     43d3a <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   441e6:	0f b6 f0             	movzbl %al,%esi
   441e9:	44 89 fa             	mov    %r15d,%edx
   441ec:	4c 89 f7             	mov    %r14,%rdi
   441ef:	41 ff 16             	callq  *(%r14)
            continue;
   441f2:	4c 89 e3             	mov    %r12,%rbx
   441f5:	eb d7                	jmp    441ce <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   441f7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   441fb:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   441ff:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44203:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44207:	e9 51 fe ff ff       	jmpq   4405d <printer_vprintf+0x351>
            color = va_arg(val, int);
   4420c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44210:	8b 07                	mov    (%rdi),%eax
   44212:	83 f8 2f             	cmp    $0x2f,%eax
   44215:	77 10                	ja     44227 <printer_vprintf+0x51b>
   44217:	89 c2                	mov    %eax,%edx
   44219:	48 03 57 10          	add    0x10(%rdi),%rdx
   4421d:	83 c0 08             	add    $0x8,%eax
   44220:	89 07                	mov    %eax,(%rdi)
   44222:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   44225:	eb a7                	jmp    441ce <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   44227:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4422b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   4422f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44233:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44237:	eb e9                	jmp    44222 <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   44239:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4423d:	8b 01                	mov    (%rcx),%eax
   4423f:	83 f8 2f             	cmp    $0x2f,%eax
   44242:	77 23                	ja     44267 <printer_vprintf+0x55b>
   44244:	89 c2                	mov    %eax,%edx
   44246:	48 03 51 10          	add    0x10(%rcx),%rdx
   4424a:	83 c0 08             	add    $0x8,%eax
   4424d:	89 01                	mov    %eax,(%rcx)
   4424f:	8b 02                	mov    (%rdx),%eax
   44251:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   44254:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   44258:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   4425c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   44262:	e9 ff fd ff ff       	jmpq   44066 <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   44267:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4426b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   4426f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44273:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44277:	eb d6                	jmp    4424f <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   44279:	84 d2                	test   %dl,%dl
   4427b:	0f 85 39 01 00 00    	jne    443ba <printer_vprintf+0x6ae>
   44281:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   44285:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   44289:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   4428d:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   44291:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   44297:	e9 ca fd ff ff       	jmpq   44066 <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   4429c:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   442a2:	bf e0 51 04 00       	mov    $0x451e0,%edi
        if (flags & FLAG_NUMERIC) {
   442a7:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   442ac:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   442b0:	4c 89 c1             	mov    %r8,%rcx
   442b3:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   442b7:	48 63 f6             	movslq %esi,%rsi
   442ba:	49 83 ec 01          	sub    $0x1,%r12
   442be:	48 89 c8             	mov    %rcx,%rax
   442c1:	ba 00 00 00 00       	mov    $0x0,%edx
   442c6:	48 f7 f6             	div    %rsi
   442c9:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   442cd:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   442d1:	48 89 ca             	mov    %rcx,%rdx
   442d4:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   442d7:	48 39 d6             	cmp    %rdx,%rsi
   442da:	76 de                	jbe    442ba <printer_vprintf+0x5ae>
   442dc:	e9 9a fd ff ff       	jmpq   4407b <printer_vprintf+0x36f>
                prefix = "-";
   442e1:	48 c7 45 a0 ec 4f 04 	movq   $0x44fec,-0x60(%rbp)
   442e8:	00 
            if (flags & FLAG_NEGATIVE) {
   442e9:	8b 45 a8             	mov    -0x58(%rbp),%eax
   442ec:	a8 80                	test   $0x80,%al
   442ee:	0f 85 b0 fd ff ff    	jne    440a4 <printer_vprintf+0x398>
                prefix = "+";
   442f4:	48 c7 45 a0 e7 4f 04 	movq   $0x44fe7,-0x60(%rbp)
   442fb:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   442fc:	a8 10                	test   $0x10,%al
   442fe:	0f 85 a0 fd ff ff    	jne    440a4 <printer_vprintf+0x398>
                prefix = " ";
   44304:	a8 08                	test   $0x8,%al
   44306:	ba ef 4f 04 00       	mov    $0x44fef,%edx
   4430b:	b8 ee 4f 04 00       	mov    $0x44fee,%eax
   44310:	48 0f 44 c2          	cmove  %rdx,%rax
   44314:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   44318:	e9 87 fd ff ff       	jmpq   440a4 <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   4431d:	41 8d 41 10          	lea    0x10(%r9),%eax
   44321:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   44326:	0f 85 78 fd ff ff    	jne    440a4 <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   4432c:	4d 85 c0             	test   %r8,%r8
   4432f:	75 0d                	jne    4433e <printer_vprintf+0x632>
   44331:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   44338:	0f 84 66 fd ff ff    	je     440a4 <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   4433e:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   44342:	ba f0 4f 04 00       	mov    $0x44ff0,%edx
   44347:	b8 e9 4f 04 00       	mov    $0x44fe9,%eax
   4434c:	48 0f 44 c2          	cmove  %rdx,%rax
   44350:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   44354:	e9 4b fd ff ff       	jmpq   440a4 <printer_vprintf+0x398>
            len = strlen(data);
   44359:	4c 89 e7             	mov    %r12,%rdi
   4435c:	e8 b5 f8 ff ff       	callq  43c16 <strlen>
   44361:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   44364:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   44368:	0f 84 63 fd ff ff    	je     440d1 <printer_vprintf+0x3c5>
   4436e:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   44372:	0f 84 59 fd ff ff    	je     440d1 <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   44378:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   4437b:	89 ca                	mov    %ecx,%edx
   4437d:	29 c2                	sub    %eax,%edx
   4437f:	39 c1                	cmp    %eax,%ecx
   44381:	b8 00 00 00 00       	mov    $0x0,%eax
   44386:	0f 4e d0             	cmovle %eax,%edx
   44389:	89 55 9c             	mov    %edx,-0x64(%rbp)
   4438c:	e9 56 fd ff ff       	jmpq   440e7 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   44391:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   44395:	e8 7c f8 ff ff       	callq  43c16 <strlen>
   4439a:	8b 7d 98             	mov    -0x68(%rbp),%edi
   4439d:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   443a0:	44 89 e9             	mov    %r13d,%ecx
   443a3:	29 f9                	sub    %edi,%ecx
   443a5:	29 c1                	sub    %eax,%ecx
   443a7:	44 39 ea             	cmp    %r13d,%edx
   443aa:	b8 00 00 00 00       	mov    $0x0,%eax
   443af:	0f 4d c8             	cmovge %eax,%ecx
   443b2:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   443b5:	e9 2d fd ff ff       	jmpq   440e7 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   443ba:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   443bd:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   443c1:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   443c5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   443cb:	e9 96 fc ff ff       	jmpq   44066 <printer_vprintf+0x35a>
        int flags = 0;
   443d0:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   443d7:	e9 b0 f9 ff ff       	jmpq   43d8c <printer_vprintf+0x80>
}
   443dc:	48 83 c4 58          	add    $0x58,%rsp
   443e0:	5b                   	pop    %rbx
   443e1:	41 5c                	pop    %r12
   443e3:	41 5d                	pop    %r13
   443e5:	41 5e                	pop    %r14
   443e7:	41 5f                	pop    %r15
   443e9:	5d                   	pop    %rbp
   443ea:	c3                   	retq   

00000000000443eb <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   443eb:	55                   	push   %rbp
   443ec:	48 89 e5             	mov    %rsp,%rbp
   443ef:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   443f3:	48 c7 45 f0 f6 3a 04 	movq   $0x43af6,-0x10(%rbp)
   443fa:	00 
        cpos = 0;
   443fb:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   44401:	b8 00 00 00 00       	mov    $0x0,%eax
   44406:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   44409:	48 63 ff             	movslq %edi,%rdi
   4440c:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   44413:	00 
   44414:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   44418:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   4441c:	e8 eb f8 ff ff       	callq  43d0c <printer_vprintf>
    return cp.cursor - console;
   44421:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44425:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   4442b:	48 d1 f8             	sar    %rax
}
   4442e:	c9                   	leaveq 
   4442f:	c3                   	retq   

0000000000044430 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   44430:	55                   	push   %rbp
   44431:	48 89 e5             	mov    %rsp,%rbp
   44434:	48 83 ec 50          	sub    $0x50,%rsp
   44438:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4443c:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44440:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   44444:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   4444b:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4444f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44453:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44457:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   4445b:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4445f:	e8 87 ff ff ff       	callq  443eb <console_vprintf>
}
   44464:	c9                   	leaveq 
   44465:	c3                   	retq   

0000000000044466 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   44466:	55                   	push   %rbp
   44467:	48 89 e5             	mov    %rsp,%rbp
   4446a:	53                   	push   %rbx
   4446b:	48 83 ec 28          	sub    $0x28,%rsp
   4446f:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   44472:	48 c7 45 d8 7c 3b 04 	movq   $0x43b7c,-0x28(%rbp)
   44479:	00 
    sp.s = s;
   4447a:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   4447e:	48 85 f6             	test   %rsi,%rsi
   44481:	75 0b                	jne    4448e <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   44483:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44486:	29 d8                	sub    %ebx,%eax
}
   44488:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4448c:	c9                   	leaveq 
   4448d:	c3                   	retq   
        sp.end = s + size - 1;
   4448e:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   44493:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   44497:	be 00 00 00 00       	mov    $0x0,%esi
   4449c:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   444a0:	e8 67 f8 ff ff       	callq  43d0c <printer_vprintf>
        *sp.s = 0;
   444a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   444a9:	c6 00 00             	movb   $0x0,(%rax)
   444ac:	eb d5                	jmp    44483 <vsnprintf+0x1d>

00000000000444ae <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   444ae:	55                   	push   %rbp
   444af:	48 89 e5             	mov    %rsp,%rbp
   444b2:	48 83 ec 50          	sub    $0x50,%rsp
   444b6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   444ba:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   444be:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   444c2:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   444c9:	48 8d 45 10          	lea    0x10(%rbp),%rax
   444cd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   444d1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   444d5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   444d9:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   444dd:	e8 84 ff ff ff       	callq  44466 <vsnprintf>
    va_end(val);
    return n;
}
   444e2:	c9                   	leaveq 
   444e3:	c3                   	retq   

00000000000444e4 <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   444e4:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   444e9:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   444ee:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   444f3:	48 83 c0 02          	add    $0x2,%rax
   444f7:	48 39 d0             	cmp    %rdx,%rax
   444fa:	75 f2                	jne    444ee <console_clear+0xa>
    }
    cursorpos = 0;
   444fc:	c7 05 f6 4a 07 00 00 	movl   $0x0,0x74af6(%rip)        # b8ffc <cursorpos>
   44503:	00 00 00 
}
   44506:	c3                   	retq   
