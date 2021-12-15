
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
   400be:	e8 b6 0b 00 00       	callq  40c79 <exception>

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
   4023f:	e8 e7 1d 00 00       	callq  4202b <hardware_init>
    pageinfo_init();
   40244:	e8 8f 14 00 00       	callq  416d8 <pageinfo_init>
    console_clear();
   40249:	e8 8f 42 00 00       	callq  444dd <console_clear>
    timer_init(HZ);
   4024e:	bf 64 00 00 00       	mov    $0x64,%edi
   40253:	e8 c3 22 00 00       	callq  4251b <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   40258:	48 8b 05 a1 1d 01 00 	mov    0x11da1(%rip),%rax        # 52000 <kernel_pagetable>
   4025f:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40265:	b9 00 00 10 00       	mov    $0x100000,%ecx
   4026a:	ba 00 00 00 00       	mov    $0x0,%edx
   4026f:	be 00 00 00 00       	mov    $0x0,%esi
   40274:	48 89 c7             	mov    %rax,%rdi
   40277:	e8 ed 2f 00 00       	callq  43269 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   4027c:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   40281:	be 00 80 0b 00       	mov    $0xb8000,%esi
   40286:	48 8b 05 73 1d 01 00 	mov    0x11d73(%rip),%rax        # 52000 <kernel_pagetable>
   4028d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40293:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40298:	48 89 c7             	mov    %rax,%rdi
   4029b:	e8 c9 2f 00 00       	callq  43269 <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   402a0:	ba 00 0e 00 00       	mov    $0xe00,%edx
   402a5:	be 00 00 00 00       	mov    $0x0,%esi
   402aa:	bf 20 f0 04 00       	mov    $0x4f020,%edi
   402af:	e8 40 39 00 00       	callq  43bf4 <memset>
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
   40312:	be 00 45 04 00       	mov    $0x44500,%esi
   40317:	48 89 c7             	mov    %rax,%rdi
   4031a:	e8 46 39 00 00       	callq  43c65 <strcmp>
   4031f:	85 c0                	test   %eax,%eax
   40321:	75 14                	jne    40337 <kernel+0x104>
        process_setup(1, 4);
   40323:	be 04 00 00 00       	mov    $0x4,%esi
   40328:	bf 01 00 00 00       	mov    $0x1,%edi
   4032d:	e8 32 05 00 00       	callq  40864 <process_setup>
   40332:	e9 c2 00 00 00       	jmpq   403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   40337:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4033c:	74 29                	je     40367 <kernel+0x134>
   4033e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40342:	be 05 45 04 00       	mov    $0x44505,%esi
   40347:	48 89 c7             	mov    %rax,%rdi
   4034a:	e8 16 39 00 00       	callq  43c65 <strcmp>
   4034f:	85 c0                	test   %eax,%eax
   40351:	75 14                	jne    40367 <kernel+0x134>
        process_setup(1, 5);
   40353:	be 05 00 00 00       	mov    $0x5,%esi
   40358:	bf 01 00 00 00       	mov    $0x1,%edi
   4035d:	e8 02 05 00 00       	callq  40864 <process_setup>
   40362:	e9 92 00 00 00       	jmpq   403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   40367:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4036c:	74 26                	je     40394 <kernel+0x161>
   4036e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40372:	be 0e 45 04 00       	mov    $0x4450e,%esi
   40377:	48 89 c7             	mov    %rax,%rdi
   4037a:	e8 e6 38 00 00       	callq  43c65 <strcmp>
   4037f:	85 c0                	test   %eax,%eax
   40381:	75 11                	jne    40394 <kernel+0x161>
        process_setup(1, 6);
   40383:	be 06 00 00 00       	mov    $0x6,%esi
   40388:	bf 01 00 00 00       	mov    $0x1,%edi
   4038d:	e8 d2 04 00 00       	callq  40864 <process_setup>
   40392:	eb 65                	jmp    403f9 <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   40394:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40399:	74 39                	je     403d4 <kernel+0x1a1>
   4039b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4039f:	be 13 45 04 00       	mov    $0x44513,%esi
   403a4:	48 89 c7             	mov    %rax,%rdi
   403a7:	e8 b9 38 00 00       	callq  43c65 <strcmp>
   403ac:	85 c0                	test   %eax,%eax
   403ae:	75 24                	jne    403d4 <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   403b0:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   403b7:	eb 13                	jmp    403cc <kernel+0x199>
            process_setup(i, 6);
   403b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
   403bc:	be 06 00 00 00       	mov    $0x6,%esi
   403c1:	89 c7                	mov    %eax,%edi
   403c3:	e8 9c 04 00 00       	callq  40864 <process_setup>
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
   403ea:	e8 75 04 00 00       	callq  40864 <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   403ef:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   403f3:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   403f7:	7e e4                	jle    403dd <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   403f9:	bf 00 f1 04 00       	mov    $0x4f100,%edi
   403fe:	e8 78 12 00 00       	callq  4167b <run>

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
   4046a:	e8 cb 31 00 00       	callq  4363a <virtual_memory_lookup>
        virtual_memory_map(pt, va, map.pa, PAGESIZE, map.perm);
   4046f:	8b 4d f0             	mov    -0x10(%rbp),%ecx
   40472:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40476:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40479:	48 63 f0             	movslq %eax,%rsi
   4047c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40480:	41 89 c8             	mov    %ecx,%r8d
   40483:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40488:	48 89 c7             	mov    %rax,%rdi
   4048b:	e8 d9 2d 00 00       	callq  43269 <virtual_memory_map>
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

// L1
    int page_number = get_free_page_number();
   404b7:	b8 00 00 00 00       	mov    $0x0,%eax
   404bc:	e8 42 ff ff ff       	callq  40403 <get_free_page_number>
   404c1:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (page_number == -1) return NULL;
   404c4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   404c8:	75 0a                	jne    404d4 <alloc_pt+0x30>
   404ca:	b8 00 00 00 00       	mov    $0x0,%eax
   404cf:	e9 8e 03 00 00       	jmpq   40862 <alloc_pt+0x3be>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   404d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
   404d7:	48 98                	cltq   
   404d9:	48 c1 e0 0c          	shl    $0xc,%rax
   404dd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   404e1:	8b 45 8c             	mov    -0x74(%rbp),%eax
   404e4:	0f be d0             	movsbl %al,%edx
   404e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   404eb:	89 d6                	mov    %edx,%esi
   404ed:	48 89 c7             	mov    %rax,%rdi
   404f0:	e8 42 05 00 00       	callq  40a37 <assign_physical_page>
   404f5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   404f8:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   404fc:	75 16                	jne    40514 <alloc_pt+0x70>
        free_page(l1_addr);
   404fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40502:	48 89 c7             	mov    %rax,%rdi
   40505:	e8 5d fc ff ff       	callq  40167 <free_page>
        return NULL;
   4050a:	b8 00 00 00 00       	mov    $0x0,%eax
   4050f:	e9 4e 03 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    memset((void *) l1_addr, 0, sz_pt);
   40514:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40518:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4051c:	be 00 00 00 00       	mov    $0x0,%esi
   40521:	48 89 c7             	mov    %rax,%rdi
   40524:	e8 cb 36 00 00       	callq  43bf4 <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   40529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4052d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    
// L2
    page_number = get_free_page_number();
   40531:	b8 00 00 00 00       	mov    $0x0,%eax
   40536:	e8 c8 fe ff ff       	callq  40403 <get_free_page_number>
   4053b:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (page_number == -1) {
   4053e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   40542:	75 16                	jne    4055a <alloc_pt+0xb6>
        free_page(l1_addr);
   40544:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40548:	48 89 c7             	mov    %rax,%rdi
   4054b:	e8 17 fc ff ff       	callq  40167 <free_page>
        return NULL;
   40550:	b8 00 00 00 00       	mov    $0x0,%eax
   40555:	e9 08 03 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   4055a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4055d:	48 98                	cltq   
   4055f:	48 c1 e0 0c          	shl    $0xc,%rax
   40563:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

    page_result = assign_physical_page(l2_addr, pid);
   40567:	8b 45 8c             	mov    -0x74(%rbp),%eax
   4056a:	0f be d0             	movsbl %al,%edx
   4056d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40571:	89 d6                	mov    %edx,%esi
   40573:	48 89 c7             	mov    %rax,%rdi
   40576:	e8 bc 04 00 00       	callq  40a37 <assign_physical_page>
   4057b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   4057e:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40582:	75 22                	jne    405a6 <alloc_pt+0x102>
        free_page(l1_addr); free_page(l2_addr);
   40584:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40588:	48 89 c7             	mov    %rax,%rdi
   4058b:	e8 d7 fb ff ff       	callq  40167 <free_page>
   40590:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40594:	48 89 c7             	mov    %rax,%rdi
   40597:	e8 cb fb ff ff       	callq  40167 <free_page>
        return NULL;
   4059c:	b8 00 00 00 00       	mov    $0x0,%eax
   405a1:	e9 bc 02 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    memset((void *) l2_addr, 0, sz_pt);
   405a6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405aa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   405ae:	be 00 00 00 00       	mov    $0x0,%esi
   405b3:	48 89 c7             	mov    %rax,%rdi
   405b6:	e8 39 36 00 00       	callq  43bf4 <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   405bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405bf:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

// L3
    page_number = get_free_page_number();
   405c3:	b8 00 00 00 00       	mov    $0x0,%eax
   405c8:	e8 36 fe ff ff       	callq  40403 <get_free_page_number>
   405cd:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (page_number == -1) {
   405d0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   405d4:	75 22                	jne    405f8 <alloc_pt+0x154>
        free_page(l1_addr); free_page(l2_addr);
   405d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   405da:	48 89 c7             	mov    %rax,%rdi
   405dd:	e8 85 fb ff ff       	callq  40167 <free_page>
   405e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405e6:	48 89 c7             	mov    %rax,%rdi
   405e9:	e8 79 fb ff ff       	callq  40167 <free_page>
        return NULL;
   405ee:	b8 00 00 00 00       	mov    $0x0,%eax
   405f3:	e9 6a 02 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   405f8:	8b 45 f4             	mov    -0xc(%rbp),%eax
   405fb:	48 98                	cltq   
   405fd:	48 c1 e0 0c          	shl    $0xc,%rax
   40601:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    page_result = assign_physical_page(l3_addr, pid);
   40605:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40608:	0f be d0             	movsbl %al,%edx
   4060b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4060f:	89 d6                	mov    %edx,%esi
   40611:	48 89 c7             	mov    %rax,%rdi
   40614:	e8 1e 04 00 00       	callq  40a37 <assign_physical_page>
   40619:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   4061c:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40620:	75 2e                	jne    40650 <alloc_pt+0x1ac>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr);
   40622:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40626:	48 89 c7             	mov    %rax,%rdi
   40629:	e8 39 fb ff ff       	callq  40167 <free_page>
   4062e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40632:	48 89 c7             	mov    %rax,%rdi
   40635:	e8 2d fb ff ff       	callq  40167 <free_page>
   4063a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4063e:	48 89 c7             	mov    %rax,%rdi
   40641:	e8 21 fb ff ff       	callq  40167 <free_page>
        return NULL;
   40646:	b8 00 00 00 00       	mov    $0x0,%eax
   4064b:	e9 12 02 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    memset((void *) l3_addr, 0, sz_pt);
   40650:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40654:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40658:	be 00 00 00 00       	mov    $0x0,%esi
   4065d:	48 89 c7             	mov    %rax,%rdi
   40660:	e8 8f 35 00 00       	callq  43bf4 <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   40665:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40669:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

// L4i
    page_number = get_free_page_number();
   4066d:	b8 00 00 00 00       	mov    $0x0,%eax
   40672:	e8 8c fd ff ff       	callq  40403 <get_free_page_number>
   40677:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (page_number == -1) {
   4067a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   4067e:	75 2e                	jne    406ae <alloc_pt+0x20a>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr);
   40680:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40684:	48 89 c7             	mov    %rax,%rdi
   40687:	e8 db fa ff ff       	callq  40167 <free_page>
   4068c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40690:	48 89 c7             	mov    %rax,%rdi
   40693:	e8 cf fa ff ff       	callq  40167 <free_page>
   40698:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4069c:	48 89 c7             	mov    %rax,%rdi
   4069f:	e8 c3 fa ff ff       	callq  40167 <free_page>
        return NULL;
   406a4:	b8 00 00 00 00       	mov    $0x0,%eax
   406a9:	e9 b4 01 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   406ae:	8b 45 f4             	mov    -0xc(%rbp),%eax
   406b1:	48 98                	cltq   
   406b3:	48 c1 e0 0c          	shl    $0xc,%rax
   406b7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

    page_result = assign_physical_page(l4i_addr, pid);
   406bb:	8b 45 8c             	mov    -0x74(%rbp),%eax
   406be:	0f be d0             	movsbl %al,%edx
   406c1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406c5:	89 d6                	mov    %edx,%esi
   406c7:	48 89 c7             	mov    %rax,%rdi
   406ca:	e8 68 03 00 00       	callq  40a37 <assign_physical_page>
   406cf:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   406d2:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   406d6:	75 3a                	jne    40712 <alloc_pt+0x26e>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr);
   406d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406dc:	48 89 c7             	mov    %rax,%rdi
   406df:	e8 83 fa ff ff       	callq  40167 <free_page>
   406e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   406e8:	48 89 c7             	mov    %rax,%rdi
   406eb:	e8 77 fa ff ff       	callq  40167 <free_page>
   406f0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   406f4:	48 89 c7             	mov    %rax,%rdi
   406f7:	e8 6b fa ff ff       	callq  40167 <free_page>
   406fc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40700:	48 89 c7             	mov    %rax,%rdi
   40703:	e8 5f fa ff ff       	callq  40167 <free_page>
        return NULL;
   40708:	b8 00 00 00 00       	mov    $0x0,%eax
   4070d:	e9 50 01 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    memset((void *) l4i_addr, 0, sz_pt);
   40712:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40716:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4071a:	be 00 00 00 00       	mov    $0x0,%esi
   4071f:	48 89 c7             	mov    %rax,%rdi
   40722:	e8 cd 34 00 00       	callq  43bf4 <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   40727:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4072b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

// L4j
    page_number = get_free_page_number();
   4072f:	b8 00 00 00 00       	mov    $0x0,%eax
   40734:	e8 ca fc ff ff       	callq  40403 <get_free_page_number>
   40739:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (page_number == -1) {
   4073c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   40740:	75 3a                	jne    4077c <alloc_pt+0x2d8>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr);
   40742:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40746:	48 89 c7             	mov    %rax,%rdi
   40749:	e8 19 fa ff ff       	callq  40167 <free_page>
   4074e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40752:	48 89 c7             	mov    %rax,%rdi
   40755:	e8 0d fa ff ff       	callq  40167 <free_page>
   4075a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4075e:	48 89 c7             	mov    %rax,%rdi
   40761:	e8 01 fa ff ff       	callq  40167 <free_page>
   40766:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4076a:	48 89 c7             	mov    %rax,%rdi
   4076d:	e8 f5 f9 ff ff       	callq  40167 <free_page>
        return NULL;
   40772:	b8 00 00 00 00       	mov    $0x0,%eax
   40777:	e9 e6 00 00 00       	jmpq   40862 <alloc_pt+0x3be>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   4077c:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4077f:	48 98                	cltq   
   40781:	48 c1 e0 0c          	shl    $0xc,%rax
   40785:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

    page_result = assign_physical_page(l4j_addr, pid);
   40789:	8b 45 8c             	mov    -0x74(%rbp),%eax
   4078c:	0f be d0             	movsbl %al,%edx
   4078f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40793:	89 d6                	mov    %edx,%esi
   40795:	48 89 c7             	mov    %rax,%rdi
   40798:	e8 9a 02 00 00       	callq  40a37 <assign_physical_page>
   4079d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) {
   407a0:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   407a4:	75 43                	jne    407e9 <alloc_pt+0x345>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr); free_page(l4j_addr);
   407a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   407aa:	48 89 c7             	mov    %rax,%rdi
   407ad:	e8 b5 f9 ff ff       	callq  40167 <free_page>
   407b2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   407b6:	48 89 c7             	mov    %rax,%rdi
   407b9:	e8 a9 f9 ff ff       	callq  40167 <free_page>
   407be:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   407c2:	48 89 c7             	mov    %rax,%rdi
   407c5:	e8 9d f9 ff ff       	callq  40167 <free_page>
   407ca:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   407ce:	48 89 c7             	mov    %rax,%rdi
   407d1:	e8 91 f9 ff ff       	callq  40167 <free_page>
   407d6:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   407da:	48 89 c7             	mov    %rax,%rdi
   407dd:	e8 85 f9 ff ff       	callq  40167 <free_page>
        return NULL;
   407e2:	b8 00 00 00 00       	mov    $0x0,%eax
   407e7:	eb 79                	jmp    40862 <alloc_pt+0x3be>
    }

    memset((void *) l4j_addr, 0, sz_pt);
   407e9:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   407ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   407f1:	be 00 00 00 00       	mov    $0x0,%esi
   407f6:	48 89 c7             	mov    %rax,%rdi
   407f9:	e8 f6 33 00 00       	callq  43bf4 <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   407fe:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40802:	48 89 45 98          	mov    %rax,-0x68(%rbp)

// Linking

    int perm = PTE_U | PTE_P | PTE_W;
   40806:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%rbp)

    l1->entry[0] = (x86_64_pageentry_t) l2 | perm;
   4080d:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40810:	48 63 d0             	movslq %eax,%rdx
   40813:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40817:	48 09 c2             	or     %rax,%rdx
   4081a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4081e:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = (x86_64_pageentry_t) l3 | perm;
   40821:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40824:	48 63 d0             	movslq %eax,%rdx
   40827:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4082b:	48 09 c2             	or     %rax,%rdx
   4082e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40832:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = (x86_64_pageentry_t) l4i | perm;
   40835:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40838:	48 63 d0             	movslq %eax,%rdx
   4083b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4083f:	48 09 c2             	or     %rax,%rdx
   40842:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40846:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = (x86_64_pageentry_t) l4j | perm;
   40849:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4084c:	48 63 d0             	movslq %eax,%rdx
   4084f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40853:	48 09 c2             	or     %rax,%rdx
   40856:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4085a:	48 89 50 08          	mov    %rdx,0x8(%rax)

    return l1;
   4085e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
}
   40862:	c9                   	leaveq 
   40863:	c3                   	retq   

0000000000040864 <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   40864:	55                   	push   %rbp
   40865:	48 89 e5             	mov    %rsp,%rbp
   40868:	48 83 ec 40          	sub    $0x40,%rsp
   4086c:	89 7d cc             	mov    %edi,-0x34(%rbp)
   4086f:	89 75 c8             	mov    %esi,-0x38(%rbp)
    process_init(&processes[pid], 0);
   40872:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40875:	48 63 d0             	movslq %eax,%rdx
   40878:	48 89 d0             	mov    %rdx,%rax
   4087b:	48 c1 e0 03          	shl    $0x3,%rax
   4087f:	48 29 d0             	sub    %rdx,%rax
   40882:	48 c1 e0 05          	shl    $0x5,%rax
   40886:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   4088c:	be 00 00 00 00       	mov    $0x0,%esi
   40891:	48 89 c7             	mov    %rax,%rdi
   40894:	e8 14 1f 00 00       	callq  427ad <process_init>

    x86_64_pagetable *pt = alloc_pt(pid);
   40899:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4089c:	89 c7                	mov    %eax,%edi
   4089e:	e8 01 fc ff ff       	callq  404a4 <alloc_pt>
   408a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   408a7:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   408ac:	0f 84 82 01 00 00    	je     40a34 <process_setup+0x1d0>

    processes[pid].p_pagetable = pt;
   408b2:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408b5:	48 63 d0             	movslq %eax,%rdx
   408b8:	48 89 d0             	mov    %rdx,%rax
   408bb:	48 c1 e0 03          	shl    $0x3,%rax
   408bf:	48 29 d0             	sub    %rdx,%rax
   408c2:	48 c1 e0 05          	shl    $0x5,%rax
   408c6:	48 8d 90 f0 f0 04 00 	lea    0x4f0f0(%rax),%rdx
   408cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408d1:	48 89 02             	mov    %rax,(%rdx)
    copy_kernel_mapping(pt);
   408d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408d8:	48 89 c7             	mov    %rax,%rdi
   408db:	e8 5e fb ff ff       	callq  4043e <copy_kernel_mapping>
    int r = program_load(&processes[pid], program_number, NULL);
   408e0:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408e3:	48 63 d0             	movslq %eax,%rdx
   408e6:	48 89 d0             	mov    %rdx,%rax
   408e9:	48 c1 e0 03          	shl    $0x3,%rax
   408ed:	48 29 d0             	sub    %rdx,%rax
   408f0:	48 c1 e0 05          	shl    $0x5,%rax
   408f4:	48 8d 88 20 f0 04 00 	lea    0x4f020(%rax),%rcx
   408fb:	8b 45 c8             	mov    -0x38(%rbp),%eax
   408fe:	ba 00 00 00 00       	mov    $0x0,%edx
   40903:	89 c6                	mov    %eax,%esi
   40905:	48 89 cf             	mov    %rcx,%rdi
   40908:	e8 24 2e 00 00       	callq  43731 <program_load>
   4090d:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   40910:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40914:	79 14                	jns    4092a <process_setup+0xc6>
   40916:	ba 19 45 04 00       	mov    $0x44519,%edx
   4091b:	be 14 01 00 00       	mov    $0x114,%esi
   40920:	bf 20 45 04 00       	mov    $0x44520,%edi
   40925:	e8 40 26 00 00       	callq  42f6a <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   4092a:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4092d:	48 63 d0             	movslq %eax,%rdx
   40930:	48 89 d0             	mov    %rdx,%rax
   40933:	48 c1 e0 03          	shl    $0x3,%rax
   40937:	48 29 d0             	sub    %rdx,%rax
   4093a:	48 c1 e0 05          	shl    $0x5,%rax
   4093e:	48 05 d8 f0 04 00    	add    $0x4f0d8,%rax
   40944:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   4094b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4094e:	48 63 d0             	movslq %eax,%rdx
   40951:	48 89 d0             	mov    %rdx,%rax
   40954:	48 c1 e0 03          	shl    $0x3,%rax
   40958:	48 29 d0             	sub    %rdx,%rax
   4095b:	48 c1 e0 05          	shl    $0x5,%rax
   4095f:	48 05 d8 f0 04 00    	add    $0x4f0d8,%rax
   40965:	48 8b 00             	mov    (%rax),%rax
   40968:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   4096e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int stack_page_number = get_free_page_number();
   40972:	b8 00 00 00 00       	mov    $0x0,%eax
   40977:	e8 87 fa ff ff       	callq  40403 <get_free_page_number>
   4097c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (stack_page_number == -1) {
   4097f:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40983:	75 11                	jne    40996 <process_setup+0x132>
        free_pt(pt);
   40985:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40989:	48 89 c7             	mov    %rax,%rdi
   4098c:	e8 0a f8 ff ff       	callq  4019b <free_pt>
        return;
   40991:	e9 9f 00 00 00       	jmpq   40a35 <process_setup+0x1d1>
    }
    uintptr_t stack_addr = PAGEADDRESS(stack_page_number);
   40996:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40999:	48 98                	cltq   
   4099b:	48 c1 e0 0c          	shl    $0xc,%rax
   4099f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int assign_status = assign_physical_page(stack_addr, pid);
   409a3:	8b 45 cc             	mov    -0x34(%rbp),%eax
   409a6:	0f be d0             	movsbl %al,%edx
   409a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409ad:	89 d6                	mov    %edx,%esi
   409af:	48 89 c7             	mov    %rax,%rdi
   409b2:	e8 80 00 00 00       	callq  40a37 <assign_physical_page>
   409b7:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (assign_status == -1) {
   409ba:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   409be:	75 1a                	jne    409da <process_setup+0x176>
        free_pt(pt); free_page(stack_addr);
   409c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409c4:	48 89 c7             	mov    %rax,%rdi
   409c7:	e8 cf f7 ff ff       	callq  4019b <free_pt>
   409cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   409d0:	48 89 c7             	mov    %rax,%rdi
   409d3:	e8 8f f7 ff ff       	callq  40167 <free_page>
        return;
   409d8:	eb 5b                	jmp    40a35 <process_setup+0x1d1>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_addr,
   409da:	8b 45 cc             	mov    -0x34(%rbp),%eax
   409dd:	48 63 d0             	movslq %eax,%rdx
   409e0:	48 89 d0             	mov    %rdx,%rax
   409e3:	48 c1 e0 03          	shl    $0x3,%rax
   409e7:	48 29 d0             	sub    %rdx,%rax
   409ea:	48 c1 e0 05          	shl    $0x5,%rax
   409ee:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   409f4:	48 8b 00             	mov    (%rax),%rax
   409f7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   409fb:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   409ff:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40a05:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40a0a:	48 89 c7             	mov    %rax,%rdi
   40a0d:	e8 57 28 00 00       	callq  43269 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   40a12:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40a15:	48 63 d0             	movslq %eax,%rdx
   40a18:	48 89 d0             	mov    %rdx,%rax
   40a1b:	48 c1 e0 03          	shl    $0x3,%rax
   40a1f:	48 29 d0             	sub    %rdx,%rax
   40a22:	48 c1 e0 05          	shl    $0x5,%rax
   40a26:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   40a2c:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   40a32:	eb 01                	jmp    40a35 <process_setup+0x1d1>
    if (pt == NULL) return;
   40a34:	90                   	nop
}
   40a35:	c9                   	leaveq 
   40a36:	c3                   	retq   

0000000000040a37 <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   40a37:	55                   	push   %rbp
   40a38:	48 89 e5             	mov    %rsp,%rbp
   40a3b:	48 83 ec 10          	sub    $0x10,%rsp
   40a3f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40a43:	89 f0                	mov    %esi,%eax
   40a45:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   40a48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a4c:	25 ff 0f 00 00       	and    $0xfff,%eax
   40a51:	48 85 c0             	test   %rax,%rax
   40a54:	75 20                	jne    40a76 <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   40a56:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40a5d:	00 
   40a5e:	77 16                	ja     40a76 <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   40a60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a64:	48 c1 e8 0c          	shr    $0xc,%rax
   40a68:	48 98                	cltq   
   40a6a:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   40a71:	00 
   40a72:	84 c0                	test   %al,%al
   40a74:	74 07                	je     40a7d <assign_physical_page+0x46>
        return -1;
   40a76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40a7b:	eb 2c                	jmp    40aa9 <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   40a7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a81:	48 c1 e8 0c          	shr    $0xc,%rax
   40a85:	48 98                	cltq   
   40a87:	c6 84 00 41 fe 04 00 	movb   $0x1,0x4fe41(%rax,%rax,1)
   40a8e:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40a8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a93:	48 c1 e8 0c          	shr    $0xc,%rax
   40a97:	48 98                	cltq   
   40a99:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   40a9d:	88 94 00 40 fe 04 00 	mov    %dl,0x4fe40(%rax,%rax,1)
        return 0;
   40aa4:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40aa9:	c9                   	leaveq 
   40aaa:	c3                   	retq   

0000000000040aab <syscall_mapping>:

void syscall_mapping(proc* p){
   40aab:	55                   	push   %rbp
   40aac:	48 89 e5             	mov    %rsp,%rbp
   40aaf:	48 83 ec 70          	sub    $0x70,%rsp
   40ab3:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40ab7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40abb:	48 8b 40 38          	mov    0x38(%rax),%rax
   40abf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40ac3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ac7:	48 8b 40 30          	mov    0x30(%rax),%rax
   40acb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40acf:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ad3:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40ada:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40ade:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40ae2:	48 89 ce             	mov    %rcx,%rsi
   40ae5:	48 89 c7             	mov    %rax,%rdi
   40ae8:	e8 4d 2b 00 00       	callq  4363a <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   40aed:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40af0:	48 98                	cltq   
   40af2:	83 e0 06             	and    $0x6,%eax
   40af5:	48 83 f8 06          	cmp    $0x6,%rax
   40af9:	75 73                	jne    40b6e <syscall_mapping+0xc3>
    return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   40afb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40aff:	48 83 c0 17          	add    $0x17,%rax
   40b03:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40b07:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40b0b:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b12:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40b16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40b1a:	48 89 ce             	mov    %rcx,%rsi
   40b1d:	48 89 c7             	mov    %rax,%rdi
   40b20:	e8 15 2b 00 00       	callq  4363a <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   40b25:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40b28:	48 98                	cltq   
   40b2a:	83 e0 03             	and    $0x3,%eax
   40b2d:	48 83 f8 03          	cmp    $0x3,%rax
   40b31:	75 3e                	jne    40b71 <syscall_mapping+0xc6>
    return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40b33:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40b37:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b3e:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40b42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40b46:	48 89 ce             	mov    %rcx,%rsi
   40b49:	48 89 c7             	mov    %rax,%rdi
   40b4c:	e8 e9 2a 00 00       	callq  4363a <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40b51:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40b55:	48 89 c1             	mov    %rax,%rcx
   40b58:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40b5c:	ba 18 00 00 00       	mov    $0x18,%edx
   40b61:	48 89 c6             	mov    %rax,%rsi
   40b64:	48 89 cf             	mov    %rcx,%rdi
   40b67:	e8 1f 30 00 00       	callq  43b8b <memcpy>
   40b6c:	eb 04                	jmp    40b72 <syscall_mapping+0xc7>
    return;
   40b6e:	90                   	nop
   40b6f:	eb 01                	jmp    40b72 <syscall_mapping+0xc7>
    return;
   40b71:	90                   	nop
}
   40b72:	c9                   	leaveq 
   40b73:	c3                   	retq   

0000000000040b74 <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40b74:	55                   	push   %rbp
   40b75:	48 89 e5             	mov    %rsp,%rbp
   40b78:	48 83 ec 18          	sub    $0x18,%rsp
   40b7c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40b80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b84:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b88:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40b8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40b8f:	75 14                	jne    40ba5 <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40b91:	0f b6 05 68 54 00 00 	movzbl 0x5468(%rip),%eax        # 46000 <disp_global>
   40b98:	84 c0                	test   %al,%al
   40b9a:	0f 94 c0             	sete   %al
   40b9d:	88 05 5d 54 00 00    	mov    %al,0x545d(%rip)        # 46000 <disp_global>
   40ba3:	eb 36                	jmp    40bdb <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   40ba5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40ba9:	78 2f                	js     40bda <syscall_mem_tog+0x66>
   40bab:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40baf:	7f 29                	jg     40bda <syscall_mem_tog+0x66>
   40bb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bb5:	8b 00                	mov    (%rax),%eax
   40bb7:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40bba:	75 1e                	jne    40bda <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40bbc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bc0:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40bc7:	84 c0                	test   %al,%al
   40bc9:	0f 94 c0             	sete   %al
   40bcc:	89 c2                	mov    %eax,%edx
   40bce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bd2:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40bd8:	eb 01                	jmp    40bdb <syscall_mem_tog+0x67>
            return;
   40bda:	90                   	nop
    }
}
   40bdb:	c9                   	leaveq 
   40bdc:	c3                   	retq   

0000000000040bdd <get_free_process_slot>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

int get_free_process_slot() {
   40bdd:	55                   	push   %rbp
   40bde:	48 89 e5             	mov    %rsp,%rbp
   40be1:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 1; i < NPROC; i++) {
   40be5:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40bec:	eb 29                	jmp    40c17 <get_free_process_slot+0x3a>
        if (processes[i].p_state == P_FREE) return i;
   40bee:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40bf1:	48 63 d0             	movslq %eax,%rdx
   40bf4:	48 89 d0             	mov    %rdx,%rax
   40bf7:	48 c1 e0 03          	shl    $0x3,%rax
   40bfb:	48 29 d0             	sub    %rdx,%rax
   40bfe:	48 c1 e0 05          	shl    $0x5,%rax
   40c02:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   40c08:	8b 00                	mov    (%rax),%eax
   40c0a:	85 c0                	test   %eax,%eax
   40c0c:	75 05                	jne    40c13 <get_free_process_slot+0x36>
   40c0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c11:	eb 0f                	jmp    40c22 <get_free_process_slot+0x45>
    for (int i = 1; i < NPROC; i++) {
   40c13:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40c17:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40c1b:	7e d1                	jle    40bee <get_free_process_slot+0x11>
    }
    return -1;
   40c1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40c22:	c9                   	leaveq 
   40c23:	c3                   	retq   

0000000000040c24 <free_process_pages>:

void free_process_pages(int pid, x86_64_pagetable *pt) {
   40c24:	55                   	push   %rbp
   40c25:	48 89 e5             	mov    %rsp,%rbp
   40c28:	48 83 ec 20          	sub    $0x20,%rsp
   40c2c:	89 7d ec             	mov    %edi,-0x14(%rbp)
   40c2f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40c33:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40c3a:	00 
   40c3b:	eb 2e                	jmp    40c6b <free_process_pages+0x47>
        if (pageinfo[PAGENUMBER(va)].owner == pid) free_page(va);
   40c3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c41:	48 c1 e8 0c          	shr    $0xc,%rax
   40c45:	48 98                	cltq   
   40c47:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   40c4e:	00 
   40c4f:	0f be c0             	movsbl %al,%eax
   40c52:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   40c55:	75 0c                	jne    40c63 <free_process_pages+0x3f>
   40c57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c5b:	48 89 c7             	mov    %rax,%rdi
   40c5e:	e8 04 f5 ff ff       	callq  40167 <free_page>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40c63:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40c6a:	00 
   40c6b:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   40c72:	00 
   40c73:	76 c8                	jbe    40c3d <free_process_pages+0x19>
    }
}
   40c75:	90                   	nop
   40c76:	90                   	nop
   40c77:	c9                   	leaveq 
   40c78:	c3                   	retq   

0000000000040c79 <exception>:

void exception(x86_64_registers* reg) {
   40c79:	55                   	push   %rbp
   40c7a:	48 89 e5             	mov    %rsp,%rbp
   40c7d:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
   40c84:	48 89 bd 78 fe ff ff 	mov    %rdi,-0x188(%rbp)
    current->p_registers = *reg;
   40c8b:	48 8b 05 6e e3 00 00 	mov    0xe36e(%rip),%rax        # 4f000 <current>
   40c92:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   40c99:	48 83 c0 08          	add    $0x8,%rax
   40c9d:	48 89 d6             	mov    %rdx,%rsi
   40ca0:	ba 18 00 00 00       	mov    $0x18,%edx
   40ca5:	48 89 c7             	mov    %rax,%rdi
   40ca8:	48 89 d1             	mov    %rdx,%rcx
   40cab:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40cae:	48 8b 05 4b 13 01 00 	mov    0x1134b(%rip),%rax        # 52000 <kernel_pagetable>
   40cb5:	48 89 c7             	mov    %rax,%rdi
   40cb8:	e8 7b 24 00 00       	callq  43138 <set_pagetable>
    console_show_cursor(cursorpos);
   40cbd:	8b 05 39 83 07 00    	mov    0x78339(%rip),%eax        # b8ffc <cursorpos>
   40cc3:	89 c7                	mov    %eax,%edi
   40cc5:	e8 a2 1b 00 00       	callq  4286c <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40cca:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40cd1:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cd8:	48 83 f8 0e          	cmp    $0xe,%rax
   40cdc:	74 14                	je     40cf2 <exception+0x79>
   40cde:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40ce5:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cec:	48 83 f8 0d          	cmp    $0xd,%rax
   40cf0:	75 16                	jne    40d08 <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40cf2:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40cf9:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40d00:	83 e0 04             	and    $0x4,%eax
   40d03:	48 85 c0             	test   %rax,%rax
   40d06:	74 1a                	je     40d22 <exception+0xa9>
    {
        check_virtual_memory();
   40d08:	e8 62 0d 00 00       	callq  41a6f <check_virtual_memory>
        if(disp_global){
   40d0d:	0f b6 05 ec 52 00 00 	movzbl 0x52ec(%rip),%eax        # 46000 <disp_global>
   40d14:	84 c0                	test   %al,%al
   40d16:	74 0a                	je     40d22 <exception+0xa9>
            memshow_physical();
   40d18:	e8 ca 0e 00 00       	callq  41be7 <memshow_physical>
            memshow_virtual_animate();
   40d1d:	e8 f0 11 00 00       	callq  41f12 <memshow_virtual_animate>
        }
    }
    check_keyboard();
   40d22:	e8 22 20 00 00       	callq  42d49 <check_keyboard>
    int fail = 0;
   40d27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)

    // Actually handle the exception.
    switch (reg->reg_intno) {
   40d2e:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   40d35:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40d3c:	48 83 e8 0e          	sub    $0xe,%rax
   40d40:	48 83 f8 2a          	cmp    $0x2a,%rax
   40d44:	0f 87 84 08 00 00    	ja     415ce <exception+0x955>
   40d4a:	48 8b 04 c5 d0 45 04 	mov    0x445d0(,%rax,8),%rax
   40d51:	00 
   40d52:	ff e0                	jmpq   *%rax
    case INT_SYS_FORK:
        int child_pid = get_free_process_slot();
   40d54:	b8 00 00 00 00       	mov    $0x0,%eax
   40d59:	e8 7f fe ff ff       	callq  40bdd <get_free_process_slot>
   40d5e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
        if (child_pid == -1) {
   40d61:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40d65:	75 14                	jne    40d7b <exception+0x102>
            current->p_registers.reg_rax = -1; break;
   40d67:	48 8b 05 92 e2 00 00 	mov    0xe292(%rip),%rax        # 4f000 <current>
   40d6e:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40d75:	ff 
   40d76:	e9 65 08 00 00       	jmpq   415e0 <exception+0x967>
        }

        process_init(&processes[child_pid], 0);
   40d7b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40d7e:	48 63 d0             	movslq %eax,%rdx
   40d81:	48 89 d0             	mov    %rdx,%rax
   40d84:	48 c1 e0 03          	shl    $0x3,%rax
   40d88:	48 29 d0             	sub    %rdx,%rax
   40d8b:	48 c1 e0 05          	shl    $0x5,%rax
   40d8f:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   40d95:	be 00 00 00 00       	mov    $0x0,%esi
   40d9a:	48 89 c7             	mov    %rax,%rdi
   40d9d:	e8 0b 1a 00 00       	callq  427ad <process_init>
        x86_64_pagetable *child_pt = alloc_pt(child_pid);
   40da2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40da5:	89 c7                	mov    %eax,%edi
   40da7:	e8 f8 f6 ff ff       	callq  404a4 <alloc_pt>
   40dac:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        if (child_pt == NULL)  {
   40db0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   40db5:	75 0c                	jne    40dc3 <exception+0x14a>
            fail = 1;
   40db7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
            break;
   40dbe:	e9 1d 08 00 00       	jmpq   415e0 <exception+0x967>
        }
        
        vamapping map_;

        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40dc3:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
   40dca:	00 
   40dcb:	e9 bf 02 00 00       	jmpq   4108f <exception+0x416>
            map_ = virtual_memory_lookup(current->p_pagetable, va);
   40dd0:	48 8b 05 29 e2 00 00 	mov    0xe229(%rip),%rax        # 4f000 <current>
   40dd7:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40dde:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
   40de5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40de9:	48 89 ce             	mov    %rcx,%rsi
   40dec:	48 89 c7             	mov    %rax,%rdi
   40def:	e8 46 28 00 00       	callq  4363a <virtual_memory_lookup>
            if (map_.pn == -1) continue;
   40df4:	8b 85 58 ff ff ff    	mov    -0xa8(%rbp),%eax
   40dfa:	83 f8 ff             	cmp    $0xffffffff,%eax
   40dfd:	0f 84 7d 02 00 00    	je     41080 <exception+0x407>
            if ((map_.perm & (PTE_P | PTE_U)) && !(map_.perm & PTE_W)) {
   40e03:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40e09:	48 98                	cltq   
   40e0b:	83 e0 05             	and    $0x5,%eax
   40e0e:	48 85 c0             	test   %rax,%rax
   40e11:	0f 84 a5 00 00 00    	je     40ebc <exception+0x243>
   40e17:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40e1d:	48 98                	cltq   
   40e1f:	83 e0 02             	and    $0x2,%eax
   40e22:	48 85 c0             	test   %rax,%rax
   40e25:	0f 85 91 00 00 00    	jne    40ebc <exception+0x243>
                pageinfo[PAGENUMBER(map_.pa)].refcount++; 
   40e2b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   40e32:	48 c1 e8 0c          	shr    $0xc,%rax
   40e36:	89 c2                	mov    %eax,%edx
   40e38:	48 63 c2             	movslq %edx,%rax
   40e3b:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   40e42:	00 
   40e43:	83 c0 01             	add    $0x1,%eax
   40e46:	89 c1                	mov    %eax,%ecx
   40e48:	48 63 c2             	movslq %edx,%rax
   40e4b:	88 8c 00 41 fe 04 00 	mov    %cl,0x4fe41(%rax,%rax,1)
                int map_status = virtual_memory_map(child_pt, va, map_.pa, PAGESIZE, map_.perm);
   40e52:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   40e58:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   40e5f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40e63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40e67:	41 89 c8             	mov    %ecx,%r8d
   40e6a:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40e6f:	48 89 c7             	mov    %rax,%rdi
   40e72:	e8 f2 23 00 00       	callq  43269 <virtual_memory_map>
   40e77:	89 45 d4             	mov    %eax,-0x2c(%rbp)
                if (map_status == -1) {
   40e7a:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   40e7e:	0f 85 ff 01 00 00    	jne    41083 <exception+0x40a>
                    free_process_pages(child_pid, child_pt);
   40e84:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40e88:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40e8b:	48 89 d6             	mov    %rdx,%rsi
   40e8e:	89 c7                	mov    %eax,%edi
   40e90:	e8 8f fd ff ff       	callq  40c24 <free_process_pages>
                    free_pt(child_pt);
   40e95:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40e99:	48 89 c7             	mov    %rax,%rdi
   40e9c:	e8 fa f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40ea1:	48 8b 05 58 e1 00 00 	mov    0xe158(%rip),%rax        # 4f000 <current>
   40ea8:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40eaf:	ff 
                    fail = 1;
   40eb0:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40eb7:	e9 e1 01 00 00       	jmpq   4109d <exception+0x424>
                }
                continue;
            }
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) {
   40ebc:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   40ec2:	48 98                	cltq   
   40ec4:	83 e0 04             	and    $0x4,%eax
   40ec7:	48 85 c0             	test   %rax,%rax
   40eca:	0f 84 4d 01 00 00    	je     4101d <exception+0x3a4>
   40ed0:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   40ed5:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   40ed9:	0f 84 3e 01 00 00    	je     4101d <exception+0x3a4>
                int free_page_number = get_free_page_number();
   40edf:	b8 00 00 00 00       	mov    $0x0,%eax
   40ee4:	e8 1a f5 ff ff       	callq  40403 <get_free_page_number>
   40ee9:	89 45 d0             	mov    %eax,-0x30(%rbp)
                if (free_page_number == -1) {
   40eec:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%rbp)
   40ef0:	75 38                	jne    40f2a <exception+0x2b1>
                    free_process_pages(child_pid, child_pt);
   40ef2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40ef6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40ef9:	48 89 d6             	mov    %rdx,%rsi
   40efc:	89 c7                	mov    %eax,%edi
   40efe:	e8 21 fd ff ff       	callq  40c24 <free_process_pages>
                    free_pt(child_pt);
   40f03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40f07:	48 89 c7             	mov    %rax,%rdi
   40f0a:	e8 8c f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40f0f:	48 8b 05 ea e0 00 00 	mov    0xe0ea(%rip),%rax        # 4f000 <current>
   40f16:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f1d:	ff 
                    fail = 1;
   40f1e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40f25:	e9 73 01 00 00       	jmpq   4109d <exception+0x424>
                }

                uintptr_t addr = PAGEADDRESS(free_page_number);
   40f2a:	8b 45 d0             	mov    -0x30(%rbp),%eax
   40f2d:	48 98                	cltq   
   40f2f:	48 c1 e0 0c          	shl    $0xc,%rax
   40f33:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
                int assign_status = assign_physical_page(addr, child_pid);
   40f37:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f3a:	0f be d0             	movsbl %al,%edx
   40f3d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f41:	89 d6                	mov    %edx,%esi
   40f43:	48 89 c7             	mov    %rax,%rdi
   40f46:	e8 ec fa ff ff       	callq  40a37 <assign_physical_page>
   40f4b:	89 45 c4             	mov    %eax,-0x3c(%rbp)
                if (assign_status == -1) {
   40f4e:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
   40f52:	75 44                	jne    40f98 <exception+0x31f>
                    free_page(addr);
   40f54:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f58:	48 89 c7             	mov    %rax,%rdi
   40f5b:	e8 07 f2 ff ff       	callq  40167 <free_page>
                    free_process_pages(child_pid, child_pt);
   40f60:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40f64:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f67:	48 89 d6             	mov    %rdx,%rsi
   40f6a:	89 c7                	mov    %eax,%edi
   40f6c:	e8 b3 fc ff ff       	callq  40c24 <free_process_pages>
                    free_pt(child_pt);
   40f71:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40f75:	48 89 c7             	mov    %rax,%rdi
   40f78:	e8 1e f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40f7d:	48 8b 05 7c e0 00 00 	mov    0xe07c(%rip),%rax        # 4f000 <current>
   40f84:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f8b:	ff 
                    fail = 1;
   40f8c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   40f93:	e9 05 01 00 00       	jmpq   4109d <exception+0x424>
                }
                memcpy((void *) addr, (void *) map_.pa, PAGESIZE);
   40f98:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   40f9f:	48 89 c1             	mov    %rax,%rcx
   40fa2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40fa6:	ba 00 10 00 00       	mov    $0x1000,%edx
   40fab:	48 89 ce             	mov    %rcx,%rsi
   40fae:	48 89 c7             	mov    %rax,%rdi
   40fb1:	e8 d5 2b 00 00       	callq  43b8b <memcpy>
                int map_status = virtual_memory_map(child_pt, va, addr, PAGESIZE, map_.perm);
   40fb6:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   40fbc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40fc0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   40fc4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40fc8:	41 89 c8             	mov    %ecx,%r8d
   40fcb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40fd0:	48 89 c7             	mov    %rax,%rdi
   40fd3:	e8 91 22 00 00       	callq  43269 <virtual_memory_map>
   40fd8:	89 45 c0             	mov    %eax,-0x40(%rbp)
                if (map_status == -1) {
   40fdb:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%rbp)
   40fdf:	0f 85 a1 00 00 00    	jne    41086 <exception+0x40d>
                    free_process_pages(child_pid, child_pt);
   40fe5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40fe9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40fec:	48 89 d6             	mov    %rdx,%rsi
   40fef:	89 c7                	mov    %eax,%edi
   40ff1:	e8 2e fc ff ff       	callq  40c24 <free_process_pages>
                    free_pt(child_pt);
   40ff6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40ffa:	48 89 c7             	mov    %rax,%rdi
   40ffd:	e8 99 f1 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   41002:	48 8b 05 f7 df 00 00 	mov    0xdff7(%rip),%rax        # 4f000 <current>
   41009:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41010:	ff 
                    fail = 1;
   41011:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   41018:	e9 80 00 00 00       	jmpq   4109d <exception+0x424>
                }
            } 
            else {
                int map_status = virtual_memory_map(child_pt, va, map_.pa, PAGESIZE, map_.perm);
   4101d:	8b 8d 68 ff ff ff    	mov    -0x98(%rbp),%ecx
   41023:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4102a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   4102e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41032:	41 89 c8             	mov    %ecx,%r8d
   41035:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4103a:	48 89 c7             	mov    %rax,%rdi
   4103d:	e8 27 22 00 00       	callq  43269 <virtual_memory_map>
   41042:	89 45 bc             	mov    %eax,-0x44(%rbp)
                if (map_status == -1) {
   41045:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%rbp)
   41049:	75 3c                	jne    41087 <exception+0x40e>
                    free_process_pages(child_pid, child_pt);
   4104b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   4104f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41052:	48 89 d6             	mov    %rdx,%rsi
   41055:	89 c7                	mov    %eax,%edi
   41057:	e8 c8 fb ff ff       	callq  40c24 <free_process_pages>
                    free_pt(child_pt);
   4105c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41060:	48 89 c7             	mov    %rax,%rdi
   41063:	e8 33 f1 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1;
   41068:	48 8b 05 91 df 00 00 	mov    0xdf91(%rip),%rax        # 4f000 <current>
   4106f:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41076:	ff 
                    fail = 1; 
   41077:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
                    break;
   4107e:	eb 1d                	jmp    4109d <exception+0x424>
            if (map_.pn == -1) continue;
   41080:	90                   	nop
   41081:	eb 04                	jmp    41087 <exception+0x40e>
                continue;
   41083:	90                   	nop
   41084:	eb 01                	jmp    41087 <exception+0x40e>
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) {
   41086:	90                   	nop
        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41087:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   4108e:	00 
   4108f:	48 81 7d f0 ff ff 2f 	cmpq   $0x2fffff,-0x10(%rbp)
   41096:	00 
   41097:	0f 86 33 fd ff ff    	jbe    40dd0 <exception+0x157>
                }
            }
        }

        if (fail == 0) {
   4109d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   410a1:	0f 85 38 05 00 00    	jne    415df <exception+0x966>
            processes[child_pid].p_pid = child_pid;
   410a7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410aa:	48 63 d0             	movslq %eax,%rdx
   410ad:	48 89 d0             	mov    %rdx,%rax
   410b0:	48 c1 e0 03          	shl    $0x3,%rax
   410b4:	48 29 d0             	sub    %rdx,%rax
   410b7:	48 c1 e0 05          	shl    $0x5,%rax
   410bb:	48 8d 90 20 f0 04 00 	lea    0x4f020(%rax),%rdx
   410c2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410c5:	89 02                	mov    %eax,(%rdx)
            processes[child_pid].p_registers = processes[current->p_pid].p_registers;
   410c7:	48 8b 05 32 df 00 00 	mov    0xdf32(%rip),%rax        # 4f000 <current>
   410ce:	8b 08                	mov    (%rax),%ecx
   410d0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   410d3:	48 63 d0             	movslq %eax,%rdx
   410d6:	48 89 d0             	mov    %rdx,%rax
   410d9:	48 c1 e0 03          	shl    $0x3,%rax
   410dd:	48 29 d0             	sub    %rdx,%rax
   410e0:	48 c1 e0 05          	shl    $0x5,%rax
   410e4:	48 8d b0 20 f0 04 00 	lea    0x4f020(%rax),%rsi
   410eb:	48 63 d1             	movslq %ecx,%rdx
   410ee:	48 89 d0             	mov    %rdx,%rax
   410f1:	48 c1 e0 03          	shl    $0x3,%rax
   410f5:	48 29 d0             	sub    %rdx,%rax
   410f8:	48 c1 e0 05          	shl    $0x5,%rax
   410fc:	48 8d 90 20 f0 04 00 	lea    0x4f020(%rax),%rdx
   41103:	48 8d 46 08          	lea    0x8(%rsi),%rax
   41107:	48 83 c2 08          	add    $0x8,%rdx
   4110b:	b9 18 00 00 00       	mov    $0x18,%ecx
   41110:	48 89 c7             	mov    %rax,%rdi
   41113:	48 89 d6             	mov    %rdx,%rsi
   41116:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
            processes[child_pid].p_registers.reg_rax = 0;
   41119:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4111c:	48 63 d0             	movslq %eax,%rdx
   4111f:	48 89 d0             	mov    %rdx,%rax
   41122:	48 c1 e0 03          	shl    $0x3,%rax
   41126:	48 29 d0             	sub    %rdx,%rax
   41129:	48 c1 e0 05          	shl    $0x5,%rax
   4112d:	48 05 28 f0 04 00    	add    $0x4f028,%rax
   41133:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
            processes[child_pid].p_state = processes[current->p_pid].p_state;
   4113a:	48 8b 05 bf de 00 00 	mov    0xdebf(%rip),%rax        # 4f000 <current>
   41141:	8b 00                	mov    (%rax),%eax
   41143:	48 63 d0             	movslq %eax,%rdx
   41146:	48 89 d0             	mov    %rdx,%rax
   41149:	48 c1 e0 03          	shl    $0x3,%rax
   4114d:	48 29 d0             	sub    %rdx,%rax
   41150:	48 c1 e0 05          	shl    $0x5,%rax
   41154:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   4115a:	8b 10                	mov    (%rax),%edx
   4115c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4115f:	48 63 c8             	movslq %eax,%rcx
   41162:	48 89 c8             	mov    %rcx,%rax
   41165:	48 c1 e0 03          	shl    $0x3,%rax
   41169:	48 29 c8             	sub    %rcx,%rax
   4116c:	48 c1 e0 05          	shl    $0x5,%rax
   41170:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41176:	89 10                	mov    %edx,(%rax)
            processes[child_pid].display_status = processes[current->p_pid].display_status;
   41178:	48 8b 05 81 de 00 00 	mov    0xde81(%rip),%rax        # 4f000 <current>
   4117f:	8b 00                	mov    (%rax),%eax
   41181:	48 63 d0             	movslq %eax,%rdx
   41184:	48 89 d0             	mov    %rdx,%rax
   41187:	48 c1 e0 03          	shl    $0x3,%rax
   4118b:	48 29 d0             	sub    %rdx,%rax
   4118e:	48 c1 e0 05          	shl    $0x5,%rax
   41192:	48 05 f8 f0 04 00    	add    $0x4f0f8,%rax
   41198:	0f b6 10             	movzbl (%rax),%edx
   4119b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4119e:	48 63 c8             	movslq %eax,%rcx
   411a1:	48 89 c8             	mov    %rcx,%rax
   411a4:	48 c1 e0 03          	shl    $0x3,%rax
   411a8:	48 29 c8             	sub    %rcx,%rax
   411ab:	48 c1 e0 05          	shl    $0x5,%rax
   411af:	48 05 f8 f0 04 00    	add    $0x4f0f8,%rax
   411b5:	88 10                	mov    %dl,(%rax)
            processes[child_pid].p_pagetable = child_pt;
   411b7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   411ba:	48 63 d0             	movslq %eax,%rdx
   411bd:	48 89 d0             	mov    %rdx,%rax
   411c0:	48 c1 e0 03          	shl    $0x3,%rax
   411c4:	48 29 d0             	sub    %rdx,%rax
   411c7:	48 c1 e0 05          	shl    $0x5,%rax
   411cb:	48 8d 90 f0 f0 04 00 	lea    0x4f0f0(%rax),%rdx
   411d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   411d6:	48 89 02             	mov    %rax,(%rdx)
            processes[current->p_pid].p_registers.reg_rax = child_pid;
   411d9:	48 8b 05 20 de 00 00 	mov    0xde20(%rip),%rax        # 4f000 <current>
   411e0:	8b 00                	mov    (%rax),%eax
   411e2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   411e5:	48 63 d2             	movslq %edx,%rdx
   411e8:	48 63 c8             	movslq %eax,%rcx
   411eb:	48 89 c8             	mov    %rcx,%rax
   411ee:	48 c1 e0 03          	shl    $0x3,%rax
   411f2:	48 29 c8             	sub    %rcx,%rax
   411f5:	48 c1 e0 05          	shl    $0x5,%rax
   411f9:	48 05 28 f0 04 00    	add    $0x4f028,%rax
   411ff:	48 89 10             	mov    %rdx,(%rax)
        }

        break;
   41202:	e9 d8 03 00 00       	jmpq   415df <exception+0x966>
    case INT_SYS_EXIT:
        vamapping map__;
        for (uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41207:	48 c7 45 e8 00 00 10 	movq   $0x100000,-0x18(%rbp)
   4120e:	00 
   4120f:	e9 8f 00 00 00       	jmpq   412a3 <exception+0x62a>
            map__ = virtual_memory_lookup(current->p_pagetable, va);
   41214:	48 8b 05 e5 dd 00 00 	mov    0xdde5(%rip),%rax        # 4f000 <current>
   4121b:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41222:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
   41229:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4122d:	48 89 ce             	mov    %rcx,%rsi
   41230:	48 89 c7             	mov    %rax,%rdi
   41233:	e8 02 24 00 00       	callq  4363a <virtual_memory_lookup>
            if (map__.pn == -1) continue;
   41238:	8b 85 40 ff ff ff    	mov    -0xc0(%rbp),%eax
   4123e:	83 f8 ff             	cmp    $0xffffffff,%eax
   41241:	74 57                	je     4129a <exception+0x621>
            pageinfo[PAGENUMBER(map__.pa)].refcount--;
   41243:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   4124a:	48 c1 e8 0c          	shr    $0xc,%rax
   4124e:	89 c2                	mov    %eax,%edx
   41250:	48 63 c2             	movslq %edx,%rax
   41253:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   4125a:	00 
   4125b:	83 e8 01             	sub    $0x1,%eax
   4125e:	89 c1                	mov    %eax,%ecx
   41260:	48 63 c2             	movslq %edx,%rax
   41263:	88 8c 00 41 fe 04 00 	mov    %cl,0x4fe41(%rax,%rax,1)
            if (pageinfo[PAGENUMBER(map__.pa)].refcount == 0) {
   4126a:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   41271:	48 c1 e8 0c          	shr    $0xc,%rax
   41275:	48 98                	cltq   
   41277:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   4127e:	00 
   4127f:	84 c0                	test   %al,%al
   41281:	75 18                	jne    4129b <exception+0x622>
                pageinfo[PAGENUMBER(map__.pa)].owner = PO_FREE;
   41283:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
   4128a:	48 c1 e8 0c          	shr    $0xc,%rax
   4128e:	48 98                	cltq   
   41290:	c6 84 00 40 fe 04 00 	movb   $0x0,0x4fe40(%rax,%rax,1)
   41297:	00 
   41298:	eb 01                	jmp    4129b <exception+0x622>
            if (map__.pn == -1) continue;
   4129a:	90                   	nop
        for (uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4129b:	48 81 45 e8 00 10 00 	addq   $0x1000,-0x18(%rbp)
   412a2:	00 
   412a3:	48 81 7d e8 ff ff 2f 	cmpq   $0x2fffff,-0x18(%rbp)
   412aa:	00 
   412ab:	0f 86 63 ff ff ff    	jbe    41214 <exception+0x59b>
            }
            
        }
        free_pt(current->p_pagetable);
   412b1:	48 8b 05 48 dd 00 00 	mov    0xdd48(%rip),%rax        # 4f000 <current>
   412b8:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   412bf:	48 89 c7             	mov    %rax,%rdi
   412c2:	e8 d4 ee ff ff       	callq  4019b <free_pt>
        current->p_state = P_FREE;
   412c7:	48 8b 05 32 dd 00 00 	mov    0xdd32(%rip),%rax        # 4f000 <current>
   412ce:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   412d5:	00 00 00 
        break;
   412d8:	e9 03 03 00 00       	jmpq   415e0 <exception+0x967>
    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
        char msg[160];
        uintptr_t addr = current->p_registers.reg_rdi;
   412dd:	48 8b 05 1c dd 00 00 	mov    0xdd1c(%rip),%rax        # 4f000 <current>
   412e4:	48 8b 40 38          	mov    0x38(%rax),%rax
   412e8:	48 89 45 90          	mov    %rax,-0x70(%rbp)
        if((void *)addr == NULL)
   412ec:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
   412f1:	75 0f                	jne    41302 <exception+0x689>
            panic(NULL);
   412f3:	bf 00 00 00 00       	mov    $0x0,%edi
   412f8:	b8 00 00 00 00       	mov    $0x0,%eax
   412fd:	e8 88 1b 00 00       	callq  42e8a <panic>
        vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   41302:	48 8b 05 f7 dc 00 00 	mov    0xdcf7(%rip),%rax        # 4f000 <current>
   41309:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41310:	48 8d 85 28 ff ff ff 	lea    -0xd8(%rbp),%rax
   41317:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
   4131b:	48 89 ce             	mov    %rcx,%rsi
   4131e:	48 89 c7             	mov    %rax,%rdi
   41321:	e8 14 23 00 00       	callq  4363a <virtual_memory_lookup>
        memcpy(msg, (void *)map.pa, 160);
   41326:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
   4132d:	48 89 c1             	mov    %rax,%rcx
   41330:	48 8d 85 88 fe ff ff 	lea    -0x178(%rbp),%rax
   41337:	ba a0 00 00 00       	mov    $0xa0,%edx
   4133c:	48 89 ce             	mov    %rcx,%rsi
   4133f:	48 89 c7             	mov    %rax,%rdi
   41342:	e8 44 28 00 00       	callq  43b8b <memcpy>
        panic(msg);
   41347:	48 8d 85 88 fe ff ff 	lea    -0x178(%rbp),%rax
   4134e:	48 89 c7             	mov    %rax,%rdi
   41351:	b8 00 00 00 00       	mov    $0x0,%eax
   41356:	e8 2f 1b 00 00       	callq  42e8a <panic>
        }
        panic(NULL);
        break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   4135b:	48 8b 05 9e dc 00 00 	mov    0xdc9e(%rip),%rax        # 4f000 <current>
   41362:	8b 10                	mov    (%rax),%edx
   41364:	48 8b 05 95 dc 00 00 	mov    0xdc95(%rip),%rax        # 4f000 <current>
   4136b:	48 63 d2             	movslq %edx,%rdx
   4136e:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   41372:	e9 69 02 00 00       	jmpq   415e0 <exception+0x967>

    case INT_SYS_YIELD:
        schedule();
   41377:	e8 8d 02 00 00       	callq  41609 <schedule>
        break;                  /* will not be reached */
   4137c:	e9 5f 02 00 00       	jmpq   415e0 <exception+0x967>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   41381:	48 8b 05 78 dc 00 00 	mov    0xdc78(%rip),%rax        # 4f000 <current>
   41388:	48 8b 40 38          	mov    0x38(%rax),%rax
   4138c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
        int pn = get_free_page_number();    
   41390:	b8 00 00 00 00       	mov    $0x0,%eax
   41395:	e8 69 f0 ff ff       	callq  40403 <get_free_page_number>
   4139a:	89 45 ac             	mov    %eax,-0x54(%rbp)
        if (pn == -1) {
   4139d:	83 7d ac ff          	cmpl   $0xffffffff,-0x54(%rbp)
   413a1:	75 2d                	jne    413d0 <exception+0x757>
            console_printf(CPOS(24, 0), 0x0C00, "Out of physical memory :(\n");
   413a3:	ba 29 45 04 00       	mov    $0x44529,%edx
   413a8:	be 00 0c 00 00       	mov    $0xc00,%esi
   413ad:	bf 80 07 00 00       	mov    $0x780,%edi
   413b2:	b8 00 00 00 00       	mov    $0x0,%eax
   413b7:	e8 6d 30 00 00       	callq  44429 <console_printf>
            current->p_registers.reg_rax = -1; break;
   413bc:	48 8b 05 3d dc 00 00 	mov    0xdc3d(%rip),%rax        # 4f000 <current>
   413c3:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   413ca:	ff 
   413cb:	e9 10 02 00 00       	jmpq   415e0 <exception+0x967>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   413d0:	8b 45 ac             	mov    -0x54(%rbp),%eax
   413d3:	48 98                	cltq   
   413d5:	48 c1 e0 0c          	shl    $0xc,%rax
   413d9:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
        if (addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   413dd:	48 81 7d b0 ff ff 0f 	cmpq   $0xfffff,-0x50(%rbp)
   413e4:	00 
   413e5:	76 18                	jbe    413ff <exception+0x786>
   413e7:	48 81 7d b0 ff ff 2f 	cmpq   $0x2fffff,-0x50(%rbp)
   413ee:	00 
   413ef:	77 0e                	ja     413ff <exception+0x786>
   413f1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   413f5:	25 ff 0f 00 00       	and    $0xfff,%eax
   413fa:	48 85 c0             	test   %rax,%rax
   413fd:	74 14                	je     41413 <exception+0x79a>
            current->p_registers.reg_rax = -1; break;
   413ff:	48 8b 05 fa db 00 00 	mov    0xdbfa(%rip),%rax        # 4f000 <current>
   41406:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4140d:	ff 
   4140e:	e9 cd 01 00 00       	jmpq   415e0 <exception+0x967>
        }
        
        int r = assign_physical_page(pa, current->p_pid);
   41413:	48 8b 05 e6 db 00 00 	mov    0xdbe6(%rip),%rax        # 4f000 <current>
   4141a:	8b 00                	mov    (%rax),%eax
   4141c:	0f be d0             	movsbl %al,%edx
   4141f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   41423:	89 d6                	mov    %edx,%esi
   41425:	48 89 c7             	mov    %rax,%rdi
   41428:	e8 0a f6 ff ff       	callq  40a37 <assign_physical_page>
   4142d:	89 45 9c             	mov    %eax,-0x64(%rbp)
        if (r >= 0) {
   41430:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   41434:	78 2b                	js     41461 <exception+0x7e8>
            virtual_memory_map(current->p_pagetable, addr, pa,
   41436:	48 8b 05 c3 db 00 00 	mov    0xdbc3(%rip),%rax        # 4f000 <current>
   4143d:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41444:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   41448:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
   4144c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   41452:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41457:	48 89 c7             	mov    %rax,%rdi
   4145a:	e8 0a 1e 00 00       	callq  43269 <virtual_memory_map>
   4145f:	eb 0c                	jmp    4146d <exception+0x7f4>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        } else free_page(pa);
   41461:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   41465:	48 89 c7             	mov    %rax,%rdi
   41468:	e8 fa ec ff ff       	callq  40167 <free_page>
        current->p_registers.reg_rax = r;
   4146d:	48 8b 05 8c db 00 00 	mov    0xdb8c(%rip),%rax        # 4f000 <current>
   41474:	8b 55 9c             	mov    -0x64(%rbp),%edx
   41477:	48 63 d2             	movslq %edx,%rdx
   4147a:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   4147e:	e9 5d 01 00 00       	jmpq   415e0 <exception+0x967>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   41483:	48 8b 05 76 db 00 00 	mov    0xdb76(%rip),%rax        # 4f000 <current>
   4148a:	48 89 c7             	mov    %rax,%rdi
   4148d:	e8 19 f6 ff ff       	callq  40aab <syscall_mapping>
            break;
   41492:	e9 49 01 00 00       	jmpq   415e0 <exception+0x967>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   41497:	48 8b 05 62 db 00 00 	mov    0xdb62(%rip),%rax        # 4f000 <current>
   4149e:	48 89 c7             	mov    %rax,%rdi
   414a1:	e8 ce f6 ff ff       	callq  40b74 <syscall_mem_tog>
        break;
   414a6:	e9 35 01 00 00       	jmpq   415e0 <exception+0x967>
    }

    case INT_TIMER:
        ++ticks;
   414ab:	8b 05 6f e9 00 00    	mov    0xe96f(%rip),%eax        # 4fe20 <ticks>
   414b1:	83 c0 01             	add    $0x1,%eax
   414b4:	89 05 66 e9 00 00    	mov    %eax,0xe966(%rip)        # 4fe20 <ticks>
        schedule();
   414ba:	e8 4a 01 00 00       	callq  41609 <schedule>
        break;                  /* will not be reached */
   414bf:	e9 1c 01 00 00       	jmpq   415e0 <exception+0x967>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   414c4:	0f 20 d0             	mov    %cr2,%rax
   414c7:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    return val;
   414ce:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   414d5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   414d9:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   414e0:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   414e7:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   414ea:	48 85 c0             	test   %rax,%rax
   414ed:	74 07                	je     414f6 <exception+0x87d>
   414ef:	b8 44 45 04 00       	mov    $0x44544,%eax
   414f4:	eb 05                	jmp    414fb <exception+0x882>
   414f6:	b8 4a 45 04 00       	mov    $0x4454a,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   414fb:	48 89 45 80          	mov    %rax,-0x80(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   414ff:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   41506:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   4150d:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   41510:	48 85 c0             	test   %rax,%rax
   41513:	74 07                	je     4151c <exception+0x8a3>
   41515:	b8 4f 45 04 00       	mov    $0x4454f,%eax
   4151a:	eb 05                	jmp    41521 <exception+0x8a8>
   4151c:	b8 62 45 04 00       	mov    $0x44562,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   41521:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   41528:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   4152f:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41536:	83 e0 04             	and    $0x4,%eax
   41539:	48 85 c0             	test   %rax,%rax
   4153c:	75 32                	jne    41570 <exception+0x8f7>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   4153e:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   41545:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   4154c:	48 8b 8d 78 ff ff ff 	mov    -0x88(%rbp),%rcx
   41553:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
   41557:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   4155b:	49 89 f0             	mov    %rsi,%r8
   4155e:	48 89 c6             	mov    %rax,%rsi
   41561:	bf 70 45 04 00       	mov    $0x44570,%edi
   41566:	b8 00 00 00 00       	mov    $0x0,%eax
   4156b:	e8 1a 19 00 00       	callq  42e8a <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   41570:	48 8b 85 78 fe ff ff 	mov    -0x188(%rbp),%rax
   41577:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   4157e:	48 8b 05 7b da 00 00 	mov    0xda7b(%rip),%rax        # 4f000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   41585:	8b 00                	mov    (%rax),%eax
   41587:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
   4158b:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   4158f:	52                   	push   %rdx
   41590:	ff b5 78 ff ff ff    	pushq  -0x88(%rbp)
   41596:	49 89 f1             	mov    %rsi,%r9
   41599:	49 89 c8             	mov    %rcx,%r8
   4159c:	89 c1                	mov    %eax,%ecx
   4159e:	ba a0 45 04 00       	mov    $0x445a0,%edx
   415a3:	be 00 0c 00 00       	mov    $0xc00,%esi
   415a8:	bf 80 07 00 00       	mov    $0x780,%edi
   415ad:	b8 00 00 00 00       	mov    $0x0,%eax
   415b2:	e8 72 2e 00 00       	callq  44429 <console_printf>
   415b7:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   415bb:	48 8b 05 3e da 00 00 	mov    0xda3e(%rip),%rax        # 4f000 <current>
   415c2:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   415c9:	00 00 00 
        break;
   415cc:	eb 12                	jmp    415e0 <exception+0x967>
    }

    default:
        default_exception(current);
   415ce:	48 8b 05 2b da 00 00 	mov    0xda2b(%rip),%rax        # 4f000 <current>
   415d5:	48 89 c7             	mov    %rax,%rdi
   415d8:	e8 bd 19 00 00       	callq  42f9a <default_exception>
        break;                  /* will not be reached */
   415dd:	eb 01                	jmp    415e0 <exception+0x967>
        break;
   415df:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   415e0:	48 8b 05 19 da 00 00 	mov    0xda19(%rip),%rax        # 4f000 <current>
   415e7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   415ed:	83 f8 01             	cmp    $0x1,%eax
   415f0:	75 0f                	jne    41601 <exception+0x988>
        run(current);
   415f2:	48 8b 05 07 da 00 00 	mov    0xda07(%rip),%rax        # 4f000 <current>
   415f9:	48 89 c7             	mov    %rax,%rdi
   415fc:	e8 7a 00 00 00       	callq  4167b <run>
    } else {
        schedule();
   41601:	e8 03 00 00 00       	callq  41609 <schedule>
    }
}
   41606:	90                   	nop
   41607:	c9                   	leaveq 
   41608:	c3                   	retq   

0000000000041609 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   41609:	55                   	push   %rbp
   4160a:	48 89 e5             	mov    %rsp,%rbp
   4160d:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   41611:	48 8b 05 e8 d9 00 00 	mov    0xd9e8(%rip),%rax        # 4f000 <current>
   41618:	8b 00                	mov    (%rax),%eax
   4161a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   4161d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41620:	83 c0 01             	add    $0x1,%eax
   41623:	99                   	cltd   
   41624:	c1 ea 1c             	shr    $0x1c,%edx
   41627:	01 d0                	add    %edx,%eax
   41629:	83 e0 0f             	and    $0xf,%eax
   4162c:	29 d0                	sub    %edx,%eax
   4162e:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   41631:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41634:	48 63 d0             	movslq %eax,%rdx
   41637:	48 89 d0             	mov    %rdx,%rax
   4163a:	48 c1 e0 03          	shl    $0x3,%rax
   4163e:	48 29 d0             	sub    %rdx,%rax
   41641:	48 c1 e0 05          	shl    $0x5,%rax
   41645:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   4164b:	8b 00                	mov    (%rax),%eax
   4164d:	83 f8 01             	cmp    $0x1,%eax
   41650:	75 22                	jne    41674 <schedule+0x6b>
            run(&processes[pid]);
   41652:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41655:	48 63 d0             	movslq %eax,%rdx
   41658:	48 89 d0             	mov    %rdx,%rax
   4165b:	48 c1 e0 03          	shl    $0x3,%rax
   4165f:	48 29 d0             	sub    %rdx,%rax
   41662:	48 c1 e0 05          	shl    $0x5,%rax
   41666:	48 05 20 f0 04 00    	add    $0x4f020,%rax
   4166c:	48 89 c7             	mov    %rax,%rdi
   4166f:	e8 07 00 00 00       	callq  4167b <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   41674:	e8 d0 16 00 00       	callq  42d49 <check_keyboard>
        pid = (pid + 1) % NPROC;
   41679:	eb a2                	jmp    4161d <schedule+0x14>

000000000004167b <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   4167b:	55                   	push   %rbp
   4167c:	48 89 e5             	mov    %rsp,%rbp
   4167f:	48 83 ec 10          	sub    $0x10,%rsp
   41683:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   41687:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4168b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   41691:	83 f8 01             	cmp    $0x1,%eax
   41694:	74 14                	je     416aa <run+0x2f>
   41696:	ba 28 47 04 00       	mov    $0x44728,%edx
   4169b:	be 60 02 00 00       	mov    $0x260,%esi
   416a0:	bf 20 45 04 00       	mov    $0x44520,%edi
   416a5:	e8 c0 18 00 00       	callq  42f6a <assert_fail>
    current = p;
   416aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416ae:	48 89 05 4b d9 00 00 	mov    %rax,0xd94b(%rip)        # 4f000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   416b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416b9:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   416c0:	48 89 c7             	mov    %rax,%rdi
   416c3:	e8 70 1a 00 00       	callq  43138 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   416c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416cc:	48 83 c0 08          	add    $0x8,%rax
   416d0:	48 89 c7             	mov    %rax,%rdi
   416d3:	e8 eb e9 ff ff       	callq  400c3 <exception_return>

00000000000416d8 <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   416d8:	55                   	push   %rbp
   416d9:	48 89 e5             	mov    %rsp,%rbp
   416dc:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   416e0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   416e7:	00 
   416e8:	e9 81 00 00 00       	jmpq   4176e <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   416ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   416f1:	48 89 c7             	mov    %rax,%rdi
   416f4:	e8 ef 0e 00 00       	callq  425e8 <physical_memory_isreserved>
   416f9:	85 c0                	test   %eax,%eax
   416fb:	74 09                	je     41706 <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   416fd:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   41704:	eb 2f                	jmp    41735 <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   41706:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   4170d:	00 
   4170e:	76 0b                	jbe    4171b <pageinfo_init+0x43>
   41710:	b8 08 80 05 00       	mov    $0x58008,%eax
   41715:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41719:	72 0a                	jb     41725 <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   4171b:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   41722:	00 
   41723:	75 09                	jne    4172e <pageinfo_init+0x56>
            owner = PO_KERNEL;
   41725:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   4172c:	eb 07                	jmp    41735 <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   4172e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   41735:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41739:	48 c1 e8 0c          	shr    $0xc,%rax
   4173d:	89 c1                	mov    %eax,%ecx
   4173f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41742:	89 c2                	mov    %eax,%edx
   41744:	48 63 c1             	movslq %ecx,%rax
   41747:	88 94 00 40 fe 04 00 	mov    %dl,0x4fe40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   4174e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41752:	0f 95 c2             	setne  %dl
   41755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41759:	48 c1 e8 0c          	shr    $0xc,%rax
   4175d:	48 98                	cltq   
   4175f:	88 94 00 41 fe 04 00 	mov    %dl,0x4fe41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41766:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4176d:	00 
   4176e:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   41775:	00 
   41776:	0f 86 71 ff ff ff    	jbe    416ed <pageinfo_init+0x15>
    }
}
   4177c:	90                   	nop
   4177d:	90                   	nop
   4177e:	c9                   	leaveq 
   4177f:	c3                   	retq   

0000000000041780 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   41780:	55                   	push   %rbp
   41781:	48 89 e5             	mov    %rsp,%rbp
   41784:	48 83 ec 50          	sub    $0x50,%rsp
   41788:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   4178c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41790:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41796:	48 89 c2             	mov    %rax,%rdx
   41799:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4179d:	48 39 c2             	cmp    %rax,%rdx
   417a0:	74 14                	je     417b6 <check_page_table_mappings+0x36>
   417a2:	ba 48 47 04 00       	mov    $0x44748,%edx
   417a7:	be 8a 02 00 00       	mov    $0x28a,%esi
   417ac:	bf 20 45 04 00       	mov    $0x44520,%edi
   417b1:	e8 b4 17 00 00       	callq  42f6a <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   417b6:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   417bd:	00 
   417be:	e9 9a 00 00 00       	jmpq   4185d <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   417c3:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   417c7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   417cb:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   417cf:	48 89 ce             	mov    %rcx,%rsi
   417d2:	48 89 c7             	mov    %rax,%rdi
   417d5:	e8 60 1e 00 00       	callq  4363a <virtual_memory_lookup>
        if (vam.pa != va) {
   417da:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   417de:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   417e2:	74 27                	je     4180b <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   417e4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   417e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417ec:	49 89 d0             	mov    %rdx,%r8
   417ef:	48 89 c1             	mov    %rax,%rcx
   417f2:	ba 67 47 04 00       	mov    $0x44767,%edx
   417f7:	be 00 c0 00 00       	mov    $0xc000,%esi
   417fc:	bf e0 06 00 00       	mov    $0x6e0,%edi
   41801:	b8 00 00 00 00       	mov    $0x0,%eax
   41806:	e8 1e 2c 00 00       	callq  44429 <console_printf>
        }
        assert(vam.pa == va);
   4180b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4180f:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41813:	74 14                	je     41829 <check_page_table_mappings+0xa9>
   41815:	ba 71 47 04 00       	mov    $0x44771,%edx
   4181a:	be 93 02 00 00       	mov    $0x293,%esi
   4181f:	bf 20 45 04 00       	mov    $0x44520,%edi
   41824:	e8 41 17 00 00       	callq  42f6a <assert_fail>
        if (va >= (uintptr_t) start_data) {
   41829:	b8 00 60 04 00       	mov    $0x46000,%eax
   4182e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41832:	72 21                	jb     41855 <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   41834:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41837:	48 98                	cltq   
   41839:	83 e0 02             	and    $0x2,%eax
   4183c:	48 85 c0             	test   %rax,%rax
   4183f:	75 14                	jne    41855 <check_page_table_mappings+0xd5>
   41841:	ba 7e 47 04 00       	mov    $0x4477e,%edx
   41846:	be 95 02 00 00       	mov    $0x295,%esi
   4184b:	bf 20 45 04 00       	mov    $0x44520,%edi
   41850:	e8 15 17 00 00       	callq  42f6a <assert_fail>
         va += PAGESIZE) {
   41855:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4185c:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   4185d:	b8 08 80 05 00       	mov    $0x58008,%eax
   41862:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41866:	0f 82 57 ff ff ff    	jb     417c3 <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   4186c:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41873:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41874:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   41878:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4187c:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41880:	48 89 ce             	mov    %rcx,%rsi
   41883:	48 89 c7             	mov    %rax,%rdi
   41886:	e8 af 1d 00 00       	callq  4363a <virtual_memory_lookup>
    assert(vam.pa == kstack);
   4188b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4188f:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   41893:	74 14                	je     418a9 <check_page_table_mappings+0x129>
   41895:	ba 8f 47 04 00       	mov    $0x4478f,%edx
   4189a:	be 9c 02 00 00       	mov    $0x29c,%esi
   4189f:	bf 20 45 04 00       	mov    $0x44520,%edi
   418a4:	e8 c1 16 00 00       	callq  42f6a <assert_fail>
    assert(vam.perm & PTE_W);
   418a9:	8b 45 e8             	mov    -0x18(%rbp),%eax
   418ac:	48 98                	cltq   
   418ae:	83 e0 02             	and    $0x2,%eax
   418b1:	48 85 c0             	test   %rax,%rax
   418b4:	75 14                	jne    418ca <check_page_table_mappings+0x14a>
   418b6:	ba 7e 47 04 00       	mov    $0x4477e,%edx
   418bb:	be 9d 02 00 00       	mov    $0x29d,%esi
   418c0:	bf 20 45 04 00       	mov    $0x44520,%edi
   418c5:	e8 a0 16 00 00       	callq  42f6a <assert_fail>
}
   418ca:	90                   	nop
   418cb:	c9                   	leaveq 
   418cc:	c3                   	retq   

00000000000418cd <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   418cd:	55                   	push   %rbp
   418ce:	48 89 e5             	mov    %rsp,%rbp
   418d1:	48 83 ec 20          	sub    $0x20,%rsp
   418d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   418d9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   418dc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   418df:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   418e2:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   418e9:	48 8b 05 10 07 01 00 	mov    0x10710(%rip),%rax        # 52000 <kernel_pagetable>
   418f0:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   418f4:	75 67                	jne    4195d <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   418f6:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   418fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41904:	eb 51                	jmp    41957 <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   41906:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41909:	48 63 d0             	movslq %eax,%rdx
   4190c:	48 89 d0             	mov    %rdx,%rax
   4190f:	48 c1 e0 03          	shl    $0x3,%rax
   41913:	48 29 d0             	sub    %rdx,%rax
   41916:	48 c1 e0 05          	shl    $0x5,%rax
   4191a:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41920:	8b 00                	mov    (%rax),%eax
   41922:	85 c0                	test   %eax,%eax
   41924:	74 2d                	je     41953 <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   41926:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41929:	48 63 d0             	movslq %eax,%rdx
   4192c:	48 89 d0             	mov    %rdx,%rax
   4192f:	48 c1 e0 03          	shl    $0x3,%rax
   41933:	48 29 d0             	sub    %rdx,%rax
   41936:	48 c1 e0 05          	shl    $0x5,%rax
   4193a:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41940:	48 8b 10             	mov    (%rax),%rdx
   41943:	48 8b 05 b6 06 01 00 	mov    0x106b6(%rip),%rax        # 52000 <kernel_pagetable>
   4194a:	48 39 c2             	cmp    %rax,%rdx
   4194d:	75 04                	jne    41953 <check_page_table_ownership+0x86>
                ++expected_refcount;
   4194f:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41953:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41957:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   4195b:	7e a9                	jle    41906 <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   4195d:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41960:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41963:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41967:	be 00 00 00 00       	mov    $0x0,%esi
   4196c:	48 89 c7             	mov    %rax,%rdi
   4196f:	e8 03 00 00 00       	callq  41977 <check_page_table_ownership_level>
}
   41974:	90                   	nop
   41975:	c9                   	leaveq 
   41976:	c3                   	retq   

0000000000041977 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   41977:	55                   	push   %rbp
   41978:	48 89 e5             	mov    %rsp,%rbp
   4197b:	48 83 ec 30          	sub    $0x30,%rsp
   4197f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41983:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   41986:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41989:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   4198c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41990:	48 c1 e8 0c          	shr    $0xc,%rax
   41994:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   41999:	7e 14                	jle    419af <check_page_table_ownership_level+0x38>
   4199b:	ba a0 47 04 00       	mov    $0x447a0,%edx
   419a0:	be ba 02 00 00       	mov    $0x2ba,%esi
   419a5:	bf 20 45 04 00       	mov    $0x44520,%edi
   419aa:	e8 bb 15 00 00       	callq  42f6a <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   419af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   419b3:	48 c1 e8 0c          	shr    $0xc,%rax
   419b7:	48 98                	cltq   
   419b9:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   419c0:	00 
   419c1:	0f be c0             	movsbl %al,%eax
   419c4:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   419c7:	74 14                	je     419dd <check_page_table_ownership_level+0x66>
   419c9:	ba b8 47 04 00       	mov    $0x447b8,%edx
   419ce:	be bb 02 00 00       	mov    $0x2bb,%esi
   419d3:	bf 20 45 04 00       	mov    $0x44520,%edi
   419d8:	e8 8d 15 00 00       	callq  42f6a <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   419dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   419e1:	48 c1 e8 0c          	shr    $0xc,%rax
   419e5:	48 98                	cltq   
   419e7:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   419ee:	00 
   419ef:	0f be c0             	movsbl %al,%eax
   419f2:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   419f5:	74 14                	je     41a0b <check_page_table_ownership_level+0x94>
   419f7:	ba e0 47 04 00       	mov    $0x447e0,%edx
   419fc:	be bc 02 00 00       	mov    $0x2bc,%esi
   41a01:	bf 20 45 04 00       	mov    $0x44520,%edi
   41a06:	e8 5f 15 00 00       	callq  42f6a <assert_fail>
    if (level < 3) {
   41a0b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41a0f:	7f 5b                	jg     41a6c <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41a11:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41a18:	eb 49                	jmp    41a63 <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   41a1a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41a1e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41a21:	48 63 d2             	movslq %edx,%rdx
   41a24:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41a28:	48 85 c0             	test   %rax,%rax
   41a2b:	74 32                	je     41a5f <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   41a2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41a31:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41a34:	48 63 d2             	movslq %edx,%rdx
   41a37:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41a3b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   41a41:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   41a45:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41a48:	8d 70 01             	lea    0x1(%rax),%esi
   41a4b:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41a4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41a52:	b9 01 00 00 00       	mov    $0x1,%ecx
   41a57:	48 89 c7             	mov    %rax,%rdi
   41a5a:	e8 18 ff ff ff       	callq  41977 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41a5f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41a63:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41a6a:	7e ae                	jle    41a1a <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   41a6c:	90                   	nop
   41a6d:	c9                   	leaveq 
   41a6e:	c3                   	retq   

0000000000041a6f <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41a6f:	55                   	push   %rbp
   41a70:	48 89 e5             	mov    %rsp,%rbp
   41a73:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   41a77:	8b 05 6b d6 00 00    	mov    0xd66b(%rip),%eax        # 4f0e8 <processes+0xc8>
   41a7d:	85 c0                	test   %eax,%eax
   41a7f:	74 14                	je     41a95 <check_virtual_memory+0x26>
   41a81:	ba 10 48 04 00       	mov    $0x44810,%edx
   41a86:	be cf 02 00 00       	mov    $0x2cf,%esi
   41a8b:	bf 20 45 04 00       	mov    $0x44520,%edi
   41a90:	e8 d5 14 00 00       	callq  42f6a <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41a95:	48 8b 05 64 05 01 00 	mov    0x10564(%rip),%rax        # 52000 <kernel_pagetable>
   41a9c:	48 89 c7             	mov    %rax,%rdi
   41a9f:	e8 dc fc ff ff       	callq  41780 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41aa4:	48 8b 05 55 05 01 00 	mov    0x10555(%rip),%rax        # 52000 <kernel_pagetable>
   41aab:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41ab0:	48 89 c7             	mov    %rax,%rdi
   41ab3:	e8 15 fe ff ff       	callq  418cd <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   41ab8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41abf:	e9 9c 00 00 00       	jmpq   41b60 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   41ac4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ac7:	48 63 d0             	movslq %eax,%rdx
   41aca:	48 89 d0             	mov    %rdx,%rax
   41acd:	48 c1 e0 03          	shl    $0x3,%rax
   41ad1:	48 29 d0             	sub    %rdx,%rax
   41ad4:	48 c1 e0 05          	shl    $0x5,%rax
   41ad8:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41ade:	8b 00                	mov    (%rax),%eax
   41ae0:	85 c0                	test   %eax,%eax
   41ae2:	74 78                	je     41b5c <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   41ae4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ae7:	48 63 d0             	movslq %eax,%rdx
   41aea:	48 89 d0             	mov    %rdx,%rax
   41aed:	48 c1 e0 03          	shl    $0x3,%rax
   41af1:	48 29 d0             	sub    %rdx,%rax
   41af4:	48 c1 e0 05          	shl    $0x5,%rax
   41af8:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41afe:	48 8b 10             	mov    (%rax),%rdx
   41b01:	48 8b 05 f8 04 01 00 	mov    0x104f8(%rip),%rax        # 52000 <kernel_pagetable>
   41b08:	48 39 c2             	cmp    %rax,%rdx
   41b0b:	74 4f                	je     41b5c <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   41b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41b10:	48 63 d0             	movslq %eax,%rdx
   41b13:	48 89 d0             	mov    %rdx,%rax
   41b16:	48 c1 e0 03          	shl    $0x3,%rax
   41b1a:	48 29 d0             	sub    %rdx,%rax
   41b1d:	48 c1 e0 05          	shl    $0x5,%rax
   41b21:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41b27:	48 8b 00             	mov    (%rax),%rax
   41b2a:	48 89 c7             	mov    %rax,%rdi
   41b2d:	e8 4e fc ff ff       	callq  41780 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41b32:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41b35:	48 63 d0             	movslq %eax,%rdx
   41b38:	48 89 d0             	mov    %rdx,%rax
   41b3b:	48 c1 e0 03          	shl    $0x3,%rax
   41b3f:	48 29 d0             	sub    %rdx,%rax
   41b42:	48 c1 e0 05          	shl    $0x5,%rax
   41b46:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   41b4c:	48 8b 00             	mov    (%rax),%rax
   41b4f:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41b52:	89 d6                	mov    %edx,%esi
   41b54:	48 89 c7             	mov    %rax,%rdi
   41b57:	e8 71 fd ff ff       	callq  418cd <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41b5c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41b60:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41b64:	0f 8e 5a ff ff ff    	jle    41ac4 <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41b6a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41b71:	eb 67                	jmp    41bda <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   41b73:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b76:	48 98                	cltq   
   41b78:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41b7f:	00 
   41b80:	84 c0                	test   %al,%al
   41b82:	7e 52                	jle    41bd6 <check_virtual_memory+0x167>
   41b84:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b87:	48 98                	cltq   
   41b89:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41b90:	00 
   41b91:	84 c0                	test   %al,%al
   41b93:	78 41                	js     41bd6 <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   41b95:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b98:	48 98                	cltq   
   41b9a:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41ba1:	00 
   41ba2:	0f be c0             	movsbl %al,%eax
   41ba5:	48 63 d0             	movslq %eax,%rdx
   41ba8:	48 89 d0             	mov    %rdx,%rax
   41bab:	48 c1 e0 03          	shl    $0x3,%rax
   41baf:	48 29 d0             	sub    %rdx,%rax
   41bb2:	48 c1 e0 05          	shl    $0x5,%rax
   41bb6:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41bbc:	8b 00                	mov    (%rax),%eax
   41bbe:	85 c0                	test   %eax,%eax
   41bc0:	75 14                	jne    41bd6 <check_virtual_memory+0x167>
   41bc2:	ba 30 48 04 00       	mov    $0x44830,%edx
   41bc7:	be e6 02 00 00       	mov    $0x2e6,%esi
   41bcc:	bf 20 45 04 00       	mov    $0x44520,%edi
   41bd1:	e8 94 13 00 00       	callq  42f6a <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41bd6:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41bda:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41be1:	7e 90                	jle    41b73 <check_virtual_memory+0x104>
        }
    }
}
   41be3:	90                   	nop
   41be4:	90                   	nop
   41be5:	c9                   	leaveq 
   41be6:	c3                   	retq   

0000000000041be7 <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   41be7:	55                   	push   %rbp
   41be8:	48 89 e5             	mov    %rsp,%rbp
   41beb:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41bef:	ba 86 48 04 00       	mov    $0x44886,%edx
   41bf4:	be 00 0f 00 00       	mov    $0xf00,%esi
   41bf9:	bf 20 00 00 00       	mov    $0x20,%edi
   41bfe:	b8 00 00 00 00       	mov    $0x0,%eax
   41c03:	e8 21 28 00 00       	callq  44429 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41c08:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41c0f:	e9 f4 00 00 00       	jmpq   41d08 <memshow_physical+0x121>
        if (pn % 64 == 0) {
   41c14:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c17:	83 e0 3f             	and    $0x3f,%eax
   41c1a:	85 c0                	test   %eax,%eax
   41c1c:	75 3e                	jne    41c5c <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41c1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c21:	c1 e0 0c             	shl    $0xc,%eax
   41c24:	89 c2                	mov    %eax,%edx
   41c26:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c29:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41c2c:	85 c0                	test   %eax,%eax
   41c2e:	0f 48 c1             	cmovs  %ecx,%eax
   41c31:	c1 f8 06             	sar    $0x6,%eax
   41c34:	8d 48 01             	lea    0x1(%rax),%ecx
   41c37:	89 c8                	mov    %ecx,%eax
   41c39:	c1 e0 02             	shl    $0x2,%eax
   41c3c:	01 c8                	add    %ecx,%eax
   41c3e:	c1 e0 04             	shl    $0x4,%eax
   41c41:	83 c0 03             	add    $0x3,%eax
   41c44:	89 d1                	mov    %edx,%ecx
   41c46:	ba 96 48 04 00       	mov    $0x44896,%edx
   41c4b:	be 00 0f 00 00       	mov    $0xf00,%esi
   41c50:	89 c7                	mov    %eax,%edi
   41c52:	b8 00 00 00 00       	mov    $0x0,%eax
   41c57:	e8 cd 27 00 00       	callq  44429 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41c5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c5f:	48 98                	cltq   
   41c61:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41c68:	00 
   41c69:	0f be c0             	movsbl %al,%eax
   41c6c:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   41c6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c72:	48 98                	cltq   
   41c74:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41c7b:	00 
   41c7c:	84 c0                	test   %al,%al
   41c7e:	75 07                	jne    41c87 <memshow_physical+0xa0>
            owner = PO_FREE;
   41c80:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41c87:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41c8a:	83 c0 02             	add    $0x2,%eax
   41c8d:	48 98                	cltq   
   41c8f:	0f b7 84 00 60 48 04 	movzwl 0x44860(%rax,%rax,1),%eax
   41c96:	00 
   41c97:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   41c9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c9e:	48 98                	cltq   
   41ca0:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41ca7:	00 
   41ca8:	3c 01                	cmp    $0x1,%al
   41caa:	7e 1a                	jle    41cc6 <memshow_physical+0xdf>
   41cac:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41cb1:	48 c1 e8 0c          	shr    $0xc,%rax
   41cb5:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   41cb8:	74 0c                	je     41cc6 <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   41cba:	b8 53 00 00 00       	mov    $0x53,%eax
   41cbf:	80 cc 0f             	or     $0xf,%ah
   41cc2:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
        color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41cc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41cc9:	8d 50 3f             	lea    0x3f(%rax),%edx
   41ccc:	85 c0                	test   %eax,%eax
   41cce:	0f 48 c2             	cmovs  %edx,%eax
   41cd1:	c1 f8 06             	sar    $0x6,%eax
   41cd4:	8d 50 01             	lea    0x1(%rax),%edx
   41cd7:	89 d0                	mov    %edx,%eax
   41cd9:	c1 e0 02             	shl    $0x2,%eax
   41cdc:	01 d0                	add    %edx,%eax
   41cde:	c1 e0 04             	shl    $0x4,%eax
   41ce1:	89 c1                	mov    %eax,%ecx
   41ce3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ce6:	99                   	cltd   
   41ce7:	c1 ea 1a             	shr    $0x1a,%edx
   41cea:	01 d0                	add    %edx,%eax
   41cec:	83 e0 3f             	and    $0x3f,%eax
   41cef:	29 d0                	sub    %edx,%eax
   41cf1:	83 c0 0c             	add    $0xc,%eax
   41cf4:	01 c8                	add    %ecx,%eax
   41cf6:	48 98                	cltq   
   41cf8:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   41cfc:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   41d03:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41d04:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41d08:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41d0f:	0f 8e ff fe ff ff    	jle    41c14 <memshow_physical+0x2d>
    }
}
   41d15:	90                   	nop
   41d16:	90                   	nop
   41d17:	c9                   	leaveq 
   41d18:	c3                   	retq   

0000000000041d19 <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   41d19:	55                   	push   %rbp
   41d1a:	48 89 e5             	mov    %rsp,%rbp
   41d1d:	48 83 ec 40          	sub    $0x40,%rsp
   41d21:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   41d25:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   41d29:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41d2d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41d33:	48 89 c2             	mov    %rax,%rdx
   41d36:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41d3a:	48 39 c2             	cmp    %rax,%rdx
   41d3d:	74 14                	je     41d53 <memshow_virtual+0x3a>
   41d3f:	ba a0 48 04 00       	mov    $0x448a0,%edx
   41d44:	be 17 03 00 00       	mov    $0x317,%esi
   41d49:	bf 20 45 04 00       	mov    $0x44520,%edi
   41d4e:	e8 17 12 00 00       	callq  42f6a <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41d53:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41d57:	48 89 c1             	mov    %rax,%rcx
   41d5a:	ba cd 48 04 00       	mov    $0x448cd,%edx
   41d5f:	be 00 0f 00 00       	mov    $0xf00,%esi
   41d64:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41d69:	b8 00 00 00 00       	mov    $0x0,%eax
   41d6e:	e8 b6 26 00 00       	callq  44429 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41d73:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41d7a:	00 
   41d7b:	e9 80 01 00 00       	jmpq   41f00 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41d80:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   41d84:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41d88:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41d8c:	48 89 ce             	mov    %rcx,%rsi
   41d8f:	48 89 c7             	mov    %rax,%rdi
   41d92:	e8 a3 18 00 00       	callq  4363a <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   41d97:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41d9a:	85 c0                	test   %eax,%eax
   41d9c:	79 0b                	jns    41da9 <memshow_virtual+0x90>
            color = ' ';
   41d9e:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   41da4:	e9 d7 00 00 00       	jmpq   41e80 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41da9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41dad:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41db3:	76 14                	jbe    41dc9 <memshow_virtual+0xb0>
   41db5:	ba ea 48 04 00       	mov    $0x448ea,%edx
   41dba:	be 20 03 00 00       	mov    $0x320,%esi
   41dbf:	bf 20 45 04 00       	mov    $0x44520,%edi
   41dc4:	e8 a1 11 00 00       	callq  42f6a <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41dc9:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41dcc:	48 98                	cltq   
   41dce:	0f b6 84 00 40 fe 04 	movzbl 0x4fe40(%rax,%rax,1),%eax
   41dd5:	00 
   41dd6:	0f be c0             	movsbl %al,%eax
   41dd9:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41ddc:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41ddf:	48 98                	cltq   
   41de1:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41de8:	00 
   41de9:	84 c0                	test   %al,%al
   41deb:	75 07                	jne    41df4 <memshow_virtual+0xdb>
                owner = PO_FREE;
   41ded:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41df4:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41df7:	83 c0 02             	add    $0x2,%eax
   41dfa:	48 98                	cltq   
   41dfc:	0f b7 84 00 60 48 04 	movzwl 0x44860(%rax,%rax,1),%eax
   41e03:	00 
   41e04:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   41e08:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41e0b:	48 98                	cltq   
   41e0d:	83 e0 04             	and    $0x4,%eax
   41e10:	48 85 c0             	test   %rax,%rax
   41e13:	74 27                	je     41e3c <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41e15:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e19:	c1 e0 04             	shl    $0x4,%eax
   41e1c:	66 25 00 f0          	and    $0xf000,%ax
   41e20:	89 c2                	mov    %eax,%edx
   41e22:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e26:	c1 f8 04             	sar    $0x4,%eax
   41e29:	66 25 00 0f          	and    $0xf00,%ax
   41e2d:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   41e2f:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e33:	0f b6 c0             	movzbl %al,%eax
   41e36:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41e38:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   41e3c:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41e3f:	48 98                	cltq   
   41e41:	0f b6 84 00 41 fe 04 	movzbl 0x4fe41(%rax,%rax,1),%eax
   41e48:	00 
   41e49:	3c 01                	cmp    $0x1,%al
   41e4b:	7e 33                	jle    41e80 <memshow_virtual+0x167>
   41e4d:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41e52:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41e56:	74 28                	je     41e80 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41e58:	b8 53 00 00 00       	mov    $0x53,%eax
   41e5d:	89 c2                	mov    %eax,%edx
   41e5f:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41e63:	66 25 00 f0          	and    $0xf000,%ax
   41e67:	09 d0                	or     %edx,%eax
   41e69:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41e6d:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41e70:	48 98                	cltq   
   41e72:	83 e0 04             	and    $0x4,%eax
   41e75:	48 85 c0             	test   %rax,%rax
   41e78:	75 06                	jne    41e80 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41e7a:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
        color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41e80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e84:	48 c1 e8 0c          	shr    $0xc,%rax
   41e88:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41e8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e8e:	83 e0 3f             	and    $0x3f,%eax
   41e91:	85 c0                	test   %eax,%eax
   41e93:	75 34                	jne    41ec9 <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   41e95:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e98:	c1 e8 06             	shr    $0x6,%eax
   41e9b:	89 c2                	mov    %eax,%edx
   41e9d:	89 d0                	mov    %edx,%eax
   41e9f:	c1 e0 02             	shl    $0x2,%eax
   41ea2:	01 d0                	add    %edx,%eax
   41ea4:	c1 e0 04             	shl    $0x4,%eax
   41ea7:	05 73 03 00 00       	add    $0x373,%eax
   41eac:	89 c7                	mov    %eax,%edi
   41eae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41eb2:	48 89 c1             	mov    %rax,%rcx
   41eb5:	ba 96 48 04 00       	mov    $0x44896,%edx
   41eba:	be 00 0f 00 00       	mov    $0xf00,%esi
   41ebf:	b8 00 00 00 00       	mov    $0x0,%eax
   41ec4:	e8 60 25 00 00       	callq  44429 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41ec9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ecc:	c1 e8 06             	shr    $0x6,%eax
   41ecf:	89 c2                	mov    %eax,%edx
   41ed1:	89 d0                	mov    %edx,%eax
   41ed3:	c1 e0 02             	shl    $0x2,%eax
   41ed6:	01 d0                	add    %edx,%eax
   41ed8:	c1 e0 04             	shl    $0x4,%eax
   41edb:	89 c2                	mov    %eax,%edx
   41edd:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ee0:	83 e0 3f             	and    $0x3f,%eax
   41ee3:	01 d0                	add    %edx,%eax
   41ee5:	05 7c 03 00 00       	add    $0x37c,%eax
   41eea:	89 c2                	mov    %eax,%edx
   41eec:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41ef0:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   41ef7:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41ef8:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41eff:	00 
   41f00:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41f07:	00 
   41f08:	0f 86 72 fe ff ff    	jbe    41d80 <memshow_virtual+0x67>
    }
}
   41f0e:	90                   	nop
   41f0f:	90                   	nop
   41f10:	c9                   	leaveq 
   41f11:	c3                   	retq   

0000000000041f12 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41f12:	55                   	push   %rbp
   41f13:	48 89 e5             	mov    %rsp,%rbp
   41f16:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41f1a:	8b 05 20 e3 00 00    	mov    0xe320(%rip),%eax        # 50240 <last_ticks.1>
   41f20:	85 c0                	test   %eax,%eax
   41f22:	74 13                	je     41f37 <memshow_virtual_animate+0x25>
   41f24:	8b 05 f6 de 00 00    	mov    0xdef6(%rip),%eax        # 4fe20 <ticks>
   41f2a:	8b 15 10 e3 00 00    	mov    0xe310(%rip),%edx        # 50240 <last_ticks.1>
   41f30:	29 d0                	sub    %edx,%eax
   41f32:	83 f8 31             	cmp    $0x31,%eax
   41f35:	76 2c                	jbe    41f63 <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   41f37:	8b 05 e3 de 00 00    	mov    0xdee3(%rip),%eax        # 4fe20 <ticks>
   41f3d:	89 05 fd e2 00 00    	mov    %eax,0xe2fd(%rip)        # 50240 <last_ticks.1>
        ++showing;
   41f43:	8b 05 bb 40 00 00    	mov    0x40bb(%rip),%eax        # 46004 <showing.0>
   41f49:	83 c0 01             	add    $0x1,%eax
   41f4c:	89 05 b2 40 00 00    	mov    %eax,0x40b2(%rip)        # 46004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   41f52:	eb 0f                	jmp    41f63 <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   41f54:	8b 05 aa 40 00 00    	mov    0x40aa(%rip),%eax        # 46004 <showing.0>
   41f5a:	83 c0 01             	add    $0x1,%eax
   41f5d:	89 05 a1 40 00 00    	mov    %eax,0x40a1(%rip)        # 46004 <showing.0>
    while (showing <= 2*NPROC
   41f63:	8b 05 9b 40 00 00    	mov    0x409b(%rip),%eax        # 46004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   41f69:	83 f8 20             	cmp    $0x20,%eax
   41f6c:	7f 2e                	jg     41f9c <memshow_virtual_animate+0x8a>
   41f6e:	8b 05 90 40 00 00    	mov    0x4090(%rip),%eax        # 46004 <showing.0>
   41f74:	99                   	cltd   
   41f75:	c1 ea 1c             	shr    $0x1c,%edx
   41f78:	01 d0                	add    %edx,%eax
   41f7a:	83 e0 0f             	and    $0xf,%eax
   41f7d:	29 d0                	sub    %edx,%eax
   41f7f:	48 63 d0             	movslq %eax,%rdx
   41f82:	48 89 d0             	mov    %rdx,%rax
   41f85:	48 c1 e0 03          	shl    $0x3,%rax
   41f89:	48 29 d0             	sub    %rdx,%rax
   41f8c:	48 c1 e0 05          	shl    $0x5,%rax
   41f90:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41f96:	8b 00                	mov    (%rax),%eax
   41f98:	85 c0                	test   %eax,%eax
   41f9a:	74 b8                	je     41f54 <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41f9c:	8b 05 62 40 00 00    	mov    0x4062(%rip),%eax        # 46004 <showing.0>
   41fa2:	99                   	cltd   
   41fa3:	c1 ea 1c             	shr    $0x1c,%edx
   41fa6:	01 d0                	add    %edx,%eax
   41fa8:	83 e0 0f             	and    $0xf,%eax
   41fab:	29 d0                	sub    %edx,%eax
   41fad:	89 05 51 40 00 00    	mov    %eax,0x4051(%rip)        # 46004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41fb3:	8b 05 4b 40 00 00    	mov    0x404b(%rip),%eax        # 46004 <showing.0>
   41fb9:	48 63 d0             	movslq %eax,%rdx
   41fbc:	48 89 d0             	mov    %rdx,%rax
   41fbf:	48 c1 e0 03          	shl    $0x3,%rax
   41fc3:	48 29 d0             	sub    %rdx,%rax
   41fc6:	48 c1 e0 05          	shl    $0x5,%rax
   41fca:	48 05 e8 f0 04 00    	add    $0x4f0e8,%rax
   41fd0:	8b 00                	mov    (%rax),%eax
   41fd2:	85 c0                	test   %eax,%eax
   41fd4:	74 52                	je     42028 <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41fd6:	8b 15 28 40 00 00    	mov    0x4028(%rip),%edx        # 46004 <showing.0>
   41fdc:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41fe0:	89 d1                	mov    %edx,%ecx
   41fe2:	ba 04 49 04 00       	mov    $0x44904,%edx
   41fe7:	be 04 00 00 00       	mov    $0x4,%esi
   41fec:	48 89 c7             	mov    %rax,%rdi
   41fef:	b8 00 00 00 00       	mov    $0x0,%eax
   41ff4:	e8 ae 24 00 00       	callq  444a7 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   41ff9:	8b 05 05 40 00 00    	mov    0x4005(%rip),%eax        # 46004 <showing.0>
   41fff:	48 63 d0             	movslq %eax,%rdx
   42002:	48 89 d0             	mov    %rdx,%rax
   42005:	48 c1 e0 03          	shl    $0x3,%rax
   42009:	48 29 d0             	sub    %rdx,%rax
   4200c:	48 c1 e0 05          	shl    $0x5,%rax
   42010:	48 05 f0 f0 04 00    	add    $0x4f0f0,%rax
   42016:	48 8b 00             	mov    (%rax),%rax
   42019:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   4201d:	48 89 d6             	mov    %rdx,%rsi
   42020:	48 89 c7             	mov    %rax,%rdi
   42023:	e8 f1 fc ff ff       	callq  41d19 <memshow_virtual>
    }
}
   42028:	90                   	nop
   42029:	c9                   	leaveq 
   4202a:	c3                   	retq   

000000000004202b <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   4202b:	55                   	push   %rbp
   4202c:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   4202f:	e8 53 01 00 00       	callq  42187 <segments_init>
    interrupt_init();
   42034:	e8 d4 03 00 00       	callq  4240d <interrupt_init>
    virtual_memory_init();
   42039:	e8 e7 0f 00 00       	callq  43025 <virtual_memory_init>
}
   4203e:	90                   	nop
   4203f:	5d                   	pop    %rbp
   42040:	c3                   	retq   

0000000000042041 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   42041:	55                   	push   %rbp
   42042:	48 89 e5             	mov    %rsp,%rbp
   42045:	48 83 ec 18          	sub    $0x18,%rsp
   42049:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4204d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42051:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   42054:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42057:	48 98                	cltq   
   42059:	48 c1 e0 2d          	shl    $0x2d,%rax
   4205d:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   42061:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   42068:	90 00 00 
   4206b:	48 09 c2             	or     %rax,%rdx
    *segment = type
   4206e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42072:	48 89 10             	mov    %rdx,(%rax)
}
   42075:	90                   	nop
   42076:	c9                   	leaveq 
   42077:	c3                   	retq   

0000000000042078 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   42078:	55                   	push   %rbp
   42079:	48 89 e5             	mov    %rsp,%rbp
   4207c:	48 83 ec 28          	sub    $0x28,%rsp
   42080:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42084:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42088:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4208b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   4208f:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   42093:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42097:	48 c1 e0 10          	shl    $0x10,%rax
   4209b:	48 89 c2             	mov    %rax,%rdx
   4209e:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   420a5:	00 00 00 
   420a8:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   420ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   420af:	48 c1 e0 20          	shl    $0x20,%rax
   420b3:	48 89 c1             	mov    %rax,%rcx
   420b6:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   420bd:	00 00 ff 
   420c0:	48 21 c8             	and    %rcx,%rax
   420c3:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   420c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   420ca:	48 83 e8 01          	sub    $0x1,%rax
   420ce:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   420d1:	48 09 d0             	or     %rdx,%rax
        | type
   420d4:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   420d8:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   420db:	8b 45 ec             	mov    -0x14(%rbp),%eax
   420de:	48 98                	cltq   
   420e0:	48 c1 e0 2d          	shl    $0x2d,%rax
   420e4:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   420e7:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   420ee:	80 00 00 
   420f1:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   420f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420f8:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   420fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420ff:	48 83 c0 08          	add    $0x8,%rax
   42103:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42107:	48 c1 ea 20          	shr    $0x20,%rdx
   4210b:	48 89 10             	mov    %rdx,(%rax)
}
   4210e:	90                   	nop
   4210f:	c9                   	leaveq 
   42110:	c3                   	retq   

0000000000042111 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   42111:	55                   	push   %rbp
   42112:	48 89 e5             	mov    %rsp,%rbp
   42115:	48 83 ec 20          	sub    $0x20,%rsp
   42119:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4211d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42121:	89 55 ec             	mov    %edx,-0x14(%rbp)
   42124:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   42128:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4212c:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   4212f:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   42133:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   42136:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42139:	48 98                	cltq   
   4213b:	48 c1 e0 2d          	shl    $0x2d,%rax
   4213f:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   42142:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42146:	48 c1 e0 20          	shl    $0x20,%rax
   4214a:	48 89 c1             	mov    %rax,%rcx
   4214d:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   42154:	00 ff ff 
   42157:	48 21 c8             	and    %rcx,%rax
   4215a:	48 09 c2             	or     %rax,%rdx
   4215d:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   42164:	80 00 00 
   42167:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4216a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4216e:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   42171:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42175:	48 c1 e8 20          	shr    $0x20,%rax
   42179:	48 89 c2             	mov    %rax,%rdx
   4217c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42180:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   42184:	90                   	nop
   42185:	c9                   	leaveq 
   42186:	c3                   	retq   

0000000000042187 <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   42187:	55                   	push   %rbp
   42188:	48 89 e5             	mov    %rsp,%rbp
   4218b:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   4218f:	48 c7 05 c6 e0 00 00 	movq   $0x0,0xe0c6(%rip)        # 50260 <segments>
   42196:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   4219a:	ba 00 00 00 00       	mov    $0x0,%edx
   4219f:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   421a6:	08 20 00 
   421a9:	48 89 c6             	mov    %rax,%rsi
   421ac:	bf 68 02 05 00       	mov    $0x50268,%edi
   421b1:	e8 8b fe ff ff       	callq  42041 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   421b6:	ba 03 00 00 00       	mov    $0x3,%edx
   421bb:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   421c2:	08 20 00 
   421c5:	48 89 c6             	mov    %rax,%rsi
   421c8:	bf 70 02 05 00       	mov    $0x50270,%edi
   421cd:	e8 6f fe ff ff       	callq  42041 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   421d2:	ba 00 00 00 00       	mov    $0x0,%edx
   421d7:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   421de:	02 00 00 
   421e1:	48 89 c6             	mov    %rax,%rsi
   421e4:	bf 78 02 05 00       	mov    $0x50278,%edi
   421e9:	e8 53 fe ff ff       	callq  42041 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   421ee:	ba 03 00 00 00       	mov    $0x3,%edx
   421f3:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   421fa:	02 00 00 
   421fd:	48 89 c6             	mov    %rax,%rsi
   42200:	bf 80 02 05 00       	mov    $0x50280,%edi
   42205:	e8 37 fe ff ff       	callq  42041 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   4220a:	b8 a0 12 05 00       	mov    $0x512a0,%eax
   4220f:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   42215:	48 89 c1             	mov    %rax,%rcx
   42218:	ba 00 00 00 00       	mov    $0x0,%edx
   4221d:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   42224:	09 00 00 
   42227:	48 89 c6             	mov    %rax,%rsi
   4222a:	bf 88 02 05 00       	mov    $0x50288,%edi
   4222f:	e8 44 fe ff ff       	callq  42078 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   42234:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   4223a:	b8 60 02 05 00       	mov    $0x50260,%eax
   4223f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   42243:	ba 60 00 00 00       	mov    $0x60,%edx
   42248:	be 00 00 00 00       	mov    $0x0,%esi
   4224d:	bf a0 12 05 00       	mov    $0x512a0,%edi
   42252:	e8 9d 19 00 00       	callq  43bf4 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   42257:	48 c7 05 42 f0 00 00 	movq   $0x80000,0xf042(%rip)        # 512a4 <kernel_task_descriptor+0x4>
   4225e:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   42262:	ba 00 10 00 00       	mov    $0x1000,%edx
   42267:	be 00 00 00 00       	mov    $0x0,%esi
   4226c:	bf a0 02 05 00       	mov    $0x502a0,%edi
   42271:	e8 7e 19 00 00       	callq  43bf4 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   42276:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   4227d:	eb 30                	jmp    422af <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   4227f:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42284:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42287:	48 c1 e0 04          	shl    $0x4,%rax
   4228b:	48 05 a0 02 05 00    	add    $0x502a0,%rax
   42291:	48 89 d1             	mov    %rdx,%rcx
   42294:	ba 00 00 00 00       	mov    $0x0,%edx
   42299:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   422a0:	0e 00 00 
   422a3:	48 89 c7             	mov    %rax,%rdi
   422a6:	e8 66 fe ff ff       	callq  42111 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   422ab:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   422af:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   422b6:	76 c7                	jbe    4227f <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   422b8:	b8 36 00 04 00       	mov    $0x40036,%eax
   422bd:	48 89 c1             	mov    %rax,%rcx
   422c0:	ba 00 00 00 00       	mov    $0x0,%edx
   422c5:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   422cc:	0e 00 00 
   422cf:	48 89 c6             	mov    %rax,%rsi
   422d2:	bf a0 04 05 00       	mov    $0x504a0,%edi
   422d7:	e8 35 fe ff ff       	callq  42111 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   422dc:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   422e1:	48 89 c1             	mov    %rax,%rcx
   422e4:	ba 00 00 00 00       	mov    $0x0,%edx
   422e9:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   422f0:	0e 00 00 
   422f3:	48 89 c6             	mov    %rax,%rsi
   422f6:	bf 70 03 05 00       	mov    $0x50370,%edi
   422fb:	e8 11 fe ff ff       	callq  42111 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   42300:	b8 32 00 04 00       	mov    $0x40032,%eax
   42305:	48 89 c1             	mov    %rax,%rcx
   42308:	ba 00 00 00 00       	mov    $0x0,%edx
   4230d:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42314:	0e 00 00 
   42317:	48 89 c6             	mov    %rax,%rsi
   4231a:	bf 80 03 05 00       	mov    $0x50380,%edi
   4231f:	e8 ed fd ff ff       	callq  42111 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42324:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   4232b:	eb 3e                	jmp    4236b <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   4232d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42330:	83 e8 30             	sub    $0x30,%eax
   42333:	89 c0                	mov    %eax,%eax
   42335:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   4233c:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   4233d:	48 89 c2             	mov    %rax,%rdx
   42340:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42343:	48 c1 e0 04          	shl    $0x4,%rax
   42347:	48 05 a0 02 05 00    	add    $0x502a0,%rax
   4234d:	48 89 d1             	mov    %rdx,%rcx
   42350:	ba 03 00 00 00       	mov    $0x3,%edx
   42355:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   4235c:	0e 00 00 
   4235f:	48 89 c7             	mov    %rax,%rdi
   42362:	e8 aa fd ff ff       	callq  42111 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42367:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4236b:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   4236f:	76 bc                	jbe    4232d <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   42371:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   42377:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   4237c:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   42380:	b8 28 00 00 00       	mov    $0x28,%eax
   42385:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   42389:	0f 00 d8             	ltr    %ax
   4238c:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   42390:	0f 20 c0             	mov    %cr0,%rax
   42393:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   42397:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   4239b:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   4239e:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   423a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
   423a8:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   423ab:	8b 45 f0             	mov    -0x10(%rbp),%eax
   423ae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   423b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   423b6:	0f 22 c0             	mov    %rax,%cr0
}
   423b9:	90                   	nop
    lcr0(cr0);
}
   423ba:	90                   	nop
   423bb:	c9                   	leaveq 
   423bc:	c3                   	retq   

00000000000423bd <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   423bd:	55                   	push   %rbp
   423be:	48 89 e5             	mov    %rsp,%rbp
   423c1:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   423c5:	0f b7 05 34 ef 00 00 	movzwl 0xef34(%rip),%eax        # 51300 <interrupts_enabled>
   423cc:	f7 d0                	not    %eax
   423ce:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   423d2:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   423d6:	0f b6 c0             	movzbl %al,%eax
   423d9:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   423e0:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   423e3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   423e7:	8b 55 f0             	mov    -0x10(%rbp),%edx
   423ea:	ee                   	out    %al,(%dx)
}
   423eb:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   423ec:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   423f0:	66 c1 e8 08          	shr    $0x8,%ax
   423f4:	0f b6 c0             	movzbl %al,%eax
   423f7:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   423fe:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42401:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42405:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42408:	ee                   	out    %al,(%dx)
}
   42409:	90                   	nop
}
   4240a:	90                   	nop
   4240b:	c9                   	leaveq 
   4240c:	c3                   	retq   

000000000004240d <interrupt_init>:

void interrupt_init(void) {
   4240d:	55                   	push   %rbp
   4240e:	48 89 e5             	mov    %rsp,%rbp
   42411:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   42415:	66 c7 05 e2 ee 00 00 	movw   $0x0,0xeee2(%rip)        # 51300 <interrupts_enabled>
   4241c:	00 00 
    interrupt_mask();
   4241e:	e8 9a ff ff ff       	callq  423bd <interrupt_mask>
   42423:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   4242a:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4242e:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   42432:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   42435:	ee                   	out    %al,(%dx)
}
   42436:	90                   	nop
   42437:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   4243e:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42442:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   42446:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42449:	ee                   	out    %al,(%dx)
}
   4244a:	90                   	nop
   4244b:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   42452:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42456:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   4245a:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   4245d:	ee                   	out    %al,(%dx)
}
   4245e:	90                   	nop
   4245f:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   42466:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4246a:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   4246e:	8b 55 bc             	mov    -0x44(%rbp),%edx
   42471:	ee                   	out    %al,(%dx)
}
   42472:	90                   	nop
   42473:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   4247a:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4247e:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   42482:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   42485:	ee                   	out    %al,(%dx)
}
   42486:	90                   	nop
   42487:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   4248e:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42492:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   42496:	8b 55 cc             	mov    -0x34(%rbp),%edx
   42499:	ee                   	out    %al,(%dx)
}
   4249a:	90                   	nop
   4249b:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   424a2:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424a6:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   424aa:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   424ad:	ee                   	out    %al,(%dx)
}
   424ae:	90                   	nop
   424af:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   424b6:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424ba:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   424be:	8b 55 dc             	mov    -0x24(%rbp),%edx
   424c1:	ee                   	out    %al,(%dx)
}
   424c2:	90                   	nop
   424c3:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   424ca:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424ce:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   424d2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   424d5:	ee                   	out    %al,(%dx)
}
   424d6:	90                   	nop
   424d7:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   424de:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424e2:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   424e6:	8b 55 ec             	mov    -0x14(%rbp),%edx
   424e9:	ee                   	out    %al,(%dx)
}
   424ea:	90                   	nop
   424eb:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   424f2:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424f6:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   424fa:	8b 55 f4             	mov    -0xc(%rbp),%edx
   424fd:	ee                   	out    %al,(%dx)
}
   424fe:	90                   	nop
   424ff:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   42506:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4250a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4250e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42511:	ee                   	out    %al,(%dx)
}
   42512:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   42513:	e8 a5 fe ff ff       	callq  423bd <interrupt_mask>
}
   42518:	90                   	nop
   42519:	c9                   	leaveq 
   4251a:	c3                   	retq   

000000000004251b <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   4251b:	55                   	push   %rbp
   4251c:	48 89 e5             	mov    %rsp,%rbp
   4251f:	48 83 ec 28          	sub    $0x28,%rsp
   42523:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   42526:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   4252a:	0f 8e 9f 00 00 00    	jle    425cf <timer_init+0xb4>
   42530:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   42537:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4253b:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4253f:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42542:	ee                   	out    %al,(%dx)
}
   42543:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   42544:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42547:	89 c2                	mov    %eax,%edx
   42549:	c1 ea 1f             	shr    $0x1f,%edx
   4254c:	01 d0                	add    %edx,%eax
   4254e:	d1 f8                	sar    %eax
   42550:	05 de 34 12 00       	add    $0x1234de,%eax
   42555:	99                   	cltd   
   42556:	f7 7d dc             	idivl  -0x24(%rbp)
   42559:	89 c2                	mov    %eax,%edx
   4255b:	89 d0                	mov    %edx,%eax
   4255d:	c1 f8 1f             	sar    $0x1f,%eax
   42560:	c1 e8 18             	shr    $0x18,%eax
   42563:	89 c1                	mov    %eax,%ecx
   42565:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   42568:	0f b6 c0             	movzbl %al,%eax
   4256b:	29 c8                	sub    %ecx,%eax
   4256d:	0f b6 c0             	movzbl %al,%eax
   42570:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   42577:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4257a:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4257e:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42581:	ee                   	out    %al,(%dx)
}
   42582:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   42583:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42586:	89 c2                	mov    %eax,%edx
   42588:	c1 ea 1f             	shr    $0x1f,%edx
   4258b:	01 d0                	add    %edx,%eax
   4258d:	d1 f8                	sar    %eax
   4258f:	05 de 34 12 00       	add    $0x1234de,%eax
   42594:	99                   	cltd   
   42595:	f7 7d dc             	idivl  -0x24(%rbp)
   42598:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   4259e:	85 c0                	test   %eax,%eax
   425a0:	0f 48 c2             	cmovs  %edx,%eax
   425a3:	c1 f8 08             	sar    $0x8,%eax
   425a6:	0f b6 c0             	movzbl %al,%eax
   425a9:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   425b0:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425b3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   425b7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   425ba:	ee                   	out    %al,(%dx)
}
   425bb:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   425bc:	0f b7 05 3d ed 00 00 	movzwl 0xed3d(%rip),%eax        # 51300 <interrupts_enabled>
   425c3:	83 c8 01             	or     $0x1,%eax
   425c6:	66 89 05 33 ed 00 00 	mov    %ax,0xed33(%rip)        # 51300 <interrupts_enabled>
   425cd:	eb 11                	jmp    425e0 <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   425cf:	0f b7 05 2a ed 00 00 	movzwl 0xed2a(%rip),%eax        # 51300 <interrupts_enabled>
   425d6:	83 e0 fe             	and    $0xfffffffe,%eax
   425d9:	66 89 05 20 ed 00 00 	mov    %ax,0xed20(%rip)        # 51300 <interrupts_enabled>
    }
    interrupt_mask();
   425e0:	e8 d8 fd ff ff       	callq  423bd <interrupt_mask>
}
   425e5:	90                   	nop
   425e6:	c9                   	leaveq 
   425e7:	c3                   	retq   

00000000000425e8 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   425e8:	55                   	push   %rbp
   425e9:	48 89 e5             	mov    %rsp,%rbp
   425ec:	48 83 ec 08          	sub    $0x8,%rsp
   425f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   425f4:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   425f9:	74 14                	je     4260f <physical_memory_isreserved+0x27>
   425fb:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42602:	00 
   42603:	76 11                	jbe    42616 <physical_memory_isreserved+0x2e>
   42605:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4260c:	00 
   4260d:	77 07                	ja     42616 <physical_memory_isreserved+0x2e>
   4260f:	b8 01 00 00 00       	mov    $0x1,%eax
   42614:	eb 05                	jmp    4261b <physical_memory_isreserved+0x33>
   42616:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4261b:	c9                   	leaveq 
   4261c:	c3                   	retq   

000000000004261d <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   4261d:	55                   	push   %rbp
   4261e:	48 89 e5             	mov    %rsp,%rbp
   42621:	48 83 ec 10          	sub    $0x10,%rsp
   42625:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42628:	89 75 f8             	mov    %esi,-0x8(%rbp)
   4262b:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   4262e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42631:	c1 e0 10             	shl    $0x10,%eax
   42634:	89 c2                	mov    %eax,%edx
   42636:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42639:	c1 e0 0b             	shl    $0xb,%eax
   4263c:	09 c2                	or     %eax,%edx
   4263e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42641:	c1 e0 08             	shl    $0x8,%eax
   42644:	09 d0                	or     %edx,%eax
}
   42646:	c9                   	leaveq 
   42647:	c3                   	retq   

0000000000042648 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   42648:	55                   	push   %rbp
   42649:	48 89 e5             	mov    %rsp,%rbp
   4264c:	48 83 ec 18          	sub    $0x18,%rsp
   42650:	89 7d ec             	mov    %edi,-0x14(%rbp)
   42653:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   42656:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42659:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4265c:	09 d0                	or     %edx,%eax
   4265e:	0d 00 00 00 80       	or     $0x80000000,%eax
   42663:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   4266a:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   4266d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42670:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42673:	ef                   	out    %eax,(%dx)
}
   42674:	90                   	nop
   42675:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   4267c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4267f:	89 c2                	mov    %eax,%edx
   42681:	ed                   	in     (%dx),%eax
   42682:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   42685:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   42688:	c9                   	leaveq 
   42689:	c3                   	retq   

000000000004268a <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   4268a:	55                   	push   %rbp
   4268b:	48 89 e5             	mov    %rsp,%rbp
   4268e:	48 83 ec 28          	sub    $0x28,%rsp
   42692:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42695:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   42698:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4269f:	eb 73                	jmp    42714 <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   426a1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   426a8:	eb 60                	jmp    4270a <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   426aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   426b1:	eb 4a                	jmp    426fd <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   426b3:	8b 55 f4             	mov    -0xc(%rbp),%edx
   426b6:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   426b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   426bc:	89 ce                	mov    %ecx,%esi
   426be:	89 c7                	mov    %eax,%edi
   426c0:	e8 58 ff ff ff       	callq  4261d <pci_make_configaddr>
   426c5:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   426c8:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426cb:	be 00 00 00 00       	mov    $0x0,%esi
   426d0:	89 c7                	mov    %eax,%edi
   426d2:	e8 71 ff ff ff       	callq  42648 <pci_config_readl>
   426d7:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   426da:	8b 45 d8             	mov    -0x28(%rbp),%eax
   426dd:	c1 e0 10             	shl    $0x10,%eax
   426e0:	0b 45 dc             	or     -0x24(%rbp),%eax
   426e3:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   426e6:	75 05                	jne    426ed <pci_find_device+0x63>
                    return configaddr;
   426e8:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426eb:	eb 35                	jmp    42722 <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   426ed:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   426f1:	75 06                	jne    426f9 <pci_find_device+0x6f>
   426f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   426f7:	74 0c                	je     42705 <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   426f9:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   426fd:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   42701:	75 b0                	jne    426b3 <pci_find_device+0x29>
   42703:	eb 01                	jmp    42706 <pci_find_device+0x7c>
                    break;
   42705:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   42706:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4270a:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   4270e:	75 9a                	jne    426aa <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   42710:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42714:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   4271b:	75 84                	jne    426a1 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   4271d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42722:	c9                   	leaveq 
   42723:	c3                   	retq   

0000000000042724 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   42724:	55                   	push   %rbp
   42725:	48 89 e5             	mov    %rsp,%rbp
   42728:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   4272c:	be 13 71 00 00       	mov    $0x7113,%esi
   42731:	bf 86 80 00 00       	mov    $0x8086,%edi
   42736:	e8 4f ff ff ff       	callq  4268a <pci_find_device>
   4273b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   4273e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   42742:	78 30                	js     42774 <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   42744:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42747:	be 40 00 00 00       	mov    $0x40,%esi
   4274c:	89 c7                	mov    %eax,%edi
   4274e:	e8 f5 fe ff ff       	callq  42648 <pci_config_readl>
   42753:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42758:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   4275b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4275e:	83 c0 04             	add    $0x4,%eax
   42761:	89 45 f4             	mov    %eax,-0xc(%rbp)
   42764:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   4276a:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   4276e:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42771:	66 ef                	out    %ax,(%dx)
}
   42773:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   42774:	ba 20 49 04 00       	mov    $0x44920,%edx
   42779:	be 00 c0 00 00       	mov    $0xc000,%esi
   4277e:	bf 80 07 00 00       	mov    $0x780,%edi
   42783:	b8 00 00 00 00       	mov    $0x0,%eax
   42788:	e8 9c 1c 00 00       	callq  44429 <console_printf>
 spinloop: goto spinloop;
   4278d:	eb fe                	jmp    4278d <poweroff+0x69>

000000000004278f <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   4278f:	55                   	push   %rbp
   42790:	48 89 e5             	mov    %rsp,%rbp
   42793:	48 83 ec 10          	sub    $0x10,%rsp
   42797:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   4279e:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427a2:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   427a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
   427a9:	ee                   	out    %al,(%dx)
}
   427aa:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   427ab:	eb fe                	jmp    427ab <reboot+0x1c>

00000000000427ad <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   427ad:	55                   	push   %rbp
   427ae:	48 89 e5             	mov    %rsp,%rbp
   427b1:	48 83 ec 10          	sub    $0x10,%rsp
   427b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   427b9:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   427bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427c0:	48 83 c0 08          	add    $0x8,%rax
   427c4:	ba c0 00 00 00       	mov    $0xc0,%edx
   427c9:	be 00 00 00 00       	mov    $0x0,%esi
   427ce:	48 89 c7             	mov    %rax,%rdi
   427d1:	e8 1e 14 00 00       	callq  43bf4 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   427d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427da:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   427e1:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   427e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427e7:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   427ee:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   427f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427f6:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   427fd:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42801:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42805:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   4280c:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   4280e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42812:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42819:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   4281d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42820:	83 e0 01             	and    $0x1,%eax
   42823:	85 c0                	test   %eax,%eax
   42825:	74 1c                	je     42843 <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   42827:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4282b:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42832:	80 cc 30             	or     $0x30,%ah
   42835:	48 89 c2             	mov    %rax,%rdx
   42838:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4283c:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42843:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42846:	83 e0 02             	and    $0x2,%eax
   42849:	85 c0                	test   %eax,%eax
   4284b:	74 1c                	je     42869 <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   4284d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42851:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42858:	80 e4 fd             	and    $0xfd,%ah
   4285b:	48 89 c2             	mov    %rax,%rdx
   4285e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42862:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42869:	90                   	nop
   4286a:	c9                   	leaveq 
   4286b:	c3                   	retq   

000000000004286c <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   4286c:	55                   	push   %rbp
   4286d:	48 89 e5             	mov    %rsp,%rbp
   42870:	48 83 ec 28          	sub    $0x28,%rsp
   42874:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   42877:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   4287b:	78 09                	js     42886 <console_show_cursor+0x1a>
   4287d:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42884:	7e 07                	jle    4288d <console_show_cursor+0x21>
        cpos = 0;
   42886:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   4288d:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   42894:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42898:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   4289c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   4289f:	ee                   	out    %al,(%dx)
}
   428a0:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   428a1:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428a4:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   428aa:	85 c0                	test   %eax,%eax
   428ac:	0f 48 c2             	cmovs  %edx,%eax
   428af:	c1 f8 08             	sar    $0x8,%eax
   428b2:	0f b6 c0             	movzbl %al,%eax
   428b5:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   428bc:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428bf:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   428c3:	8b 55 ec             	mov    -0x14(%rbp),%edx
   428c6:	ee                   	out    %al,(%dx)
}
   428c7:	90                   	nop
   428c8:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   428cf:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428d3:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   428d7:	8b 55 f4             	mov    -0xc(%rbp),%edx
   428da:	ee                   	out    %al,(%dx)
}
   428db:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   428dc:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428df:	99                   	cltd   
   428e0:	c1 ea 18             	shr    $0x18,%edx
   428e3:	01 d0                	add    %edx,%eax
   428e5:	0f b6 c0             	movzbl %al,%eax
   428e8:	29 d0                	sub    %edx,%eax
   428ea:	0f b6 c0             	movzbl %al,%eax
   428ed:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   428f4:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428f7:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   428fb:	8b 55 fc             	mov    -0x4(%rbp),%edx
   428fe:	ee                   	out    %al,(%dx)
}
   428ff:	90                   	nop
}
   42900:	90                   	nop
   42901:	c9                   	leaveq 
   42902:	c3                   	retq   

0000000000042903 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42903:	55                   	push   %rbp
   42904:	48 89 e5             	mov    %rsp,%rbp
   42907:	48 83 ec 20          	sub    $0x20,%rsp
   4290b:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42912:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42915:	89 c2                	mov    %eax,%edx
   42917:	ec                   	in     (%dx),%al
   42918:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   4291b:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   4291f:	0f b6 c0             	movzbl %al,%eax
   42922:	83 e0 01             	and    $0x1,%eax
   42925:	85 c0                	test   %eax,%eax
   42927:	75 0a                	jne    42933 <keyboard_readc+0x30>
        return -1;
   42929:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4292e:	e9 e7 01 00 00       	jmpq   42b1a <keyboard_readc+0x217>
   42933:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4293a:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4293d:	89 c2                	mov    %eax,%edx
   4293f:	ec                   	in     (%dx),%al
   42940:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   42943:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   42947:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   4294a:	0f b6 05 b1 e9 00 00 	movzbl 0xe9b1(%rip),%eax        # 51302 <last_escape.2>
   42951:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   42954:	c6 05 a7 e9 00 00 00 	movb   $0x0,0xe9a7(%rip)        # 51302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   4295b:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   4295f:	75 11                	jne    42972 <keyboard_readc+0x6f>
        last_escape = 0x80;
   42961:	c6 05 9a e9 00 00 80 	movb   $0x80,0xe99a(%rip)        # 51302 <last_escape.2>
        return 0;
   42968:	b8 00 00 00 00       	mov    $0x0,%eax
   4296d:	e9 a8 01 00 00       	jmpq   42b1a <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42972:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42976:	84 c0                	test   %al,%al
   42978:	79 60                	jns    429da <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   4297a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4297e:	83 e0 7f             	and    $0x7f,%eax
   42981:	89 c2                	mov    %eax,%edx
   42983:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   42987:	09 d0                	or     %edx,%eax
   42989:	48 98                	cltq   
   4298b:	0f b6 80 40 49 04 00 	movzbl 0x44940(%rax),%eax
   42992:	0f b6 c0             	movzbl %al,%eax
   42995:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42998:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   4299f:	7e 2f                	jle    429d0 <keyboard_readc+0xcd>
   429a1:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   429a8:	7f 26                	jg     429d0 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   429aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
   429ad:	2d fa 00 00 00       	sub    $0xfa,%eax
   429b2:	ba 01 00 00 00       	mov    $0x1,%edx
   429b7:	89 c1                	mov    %eax,%ecx
   429b9:	d3 e2                	shl    %cl,%edx
   429bb:	89 d0                	mov    %edx,%eax
   429bd:	f7 d0                	not    %eax
   429bf:	89 c2                	mov    %eax,%edx
   429c1:	0f b6 05 3b e9 00 00 	movzbl 0xe93b(%rip),%eax        # 51303 <modifiers.1>
   429c8:	21 d0                	and    %edx,%eax
   429ca:	88 05 33 e9 00 00    	mov    %al,0xe933(%rip)        # 51303 <modifiers.1>
        }
        return 0;
   429d0:	b8 00 00 00 00       	mov    $0x0,%eax
   429d5:	e9 40 01 00 00       	jmpq   42b1a <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   429da:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   429de:	0a 45 fa             	or     -0x6(%rbp),%al
   429e1:	0f b6 c0             	movzbl %al,%eax
   429e4:	48 98                	cltq   
   429e6:	0f b6 80 40 49 04 00 	movzbl 0x44940(%rax),%eax
   429ed:	0f b6 c0             	movzbl %al,%eax
   429f0:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   429f3:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   429f7:	7e 57                	jle    42a50 <keyboard_readc+0x14d>
   429f9:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   429fd:	7f 51                	jg     42a50 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   429ff:	0f b6 05 fd e8 00 00 	movzbl 0xe8fd(%rip),%eax        # 51303 <modifiers.1>
   42a06:	0f b6 c0             	movzbl %al,%eax
   42a09:	83 e0 02             	and    $0x2,%eax
   42a0c:	85 c0                	test   %eax,%eax
   42a0e:	74 09                	je     42a19 <keyboard_readc+0x116>
            ch -= 0x60;
   42a10:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42a14:	e9 fd 00 00 00       	jmpq   42b16 <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42a19:	0f b6 05 e3 e8 00 00 	movzbl 0xe8e3(%rip),%eax        # 51303 <modifiers.1>
   42a20:	0f b6 c0             	movzbl %al,%eax
   42a23:	83 e0 01             	and    $0x1,%eax
   42a26:	85 c0                	test   %eax,%eax
   42a28:	0f 94 c2             	sete   %dl
   42a2b:	0f b6 05 d1 e8 00 00 	movzbl 0xe8d1(%rip),%eax        # 51303 <modifiers.1>
   42a32:	0f b6 c0             	movzbl %al,%eax
   42a35:	83 e0 08             	and    $0x8,%eax
   42a38:	85 c0                	test   %eax,%eax
   42a3a:	0f 94 c0             	sete   %al
   42a3d:	31 d0                	xor    %edx,%eax
   42a3f:	84 c0                	test   %al,%al
   42a41:	0f 84 cf 00 00 00    	je     42b16 <keyboard_readc+0x213>
            ch -= 0x20;
   42a47:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42a4b:	e9 c6 00 00 00       	jmpq   42b16 <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42a50:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42a57:	7e 30                	jle    42a89 <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42a59:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a5c:	2d fa 00 00 00       	sub    $0xfa,%eax
   42a61:	ba 01 00 00 00       	mov    $0x1,%edx
   42a66:	89 c1                	mov    %eax,%ecx
   42a68:	d3 e2                	shl    %cl,%edx
   42a6a:	89 d0                	mov    %edx,%eax
   42a6c:	89 c2                	mov    %eax,%edx
   42a6e:	0f b6 05 8e e8 00 00 	movzbl 0xe88e(%rip),%eax        # 51303 <modifiers.1>
   42a75:	31 d0                	xor    %edx,%eax
   42a77:	88 05 86 e8 00 00    	mov    %al,0xe886(%rip)        # 51303 <modifiers.1>
        ch = 0;
   42a7d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42a84:	e9 8e 00 00 00       	jmpq   42b17 <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   42a89:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42a90:	7e 2d                	jle    42abf <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42a92:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a95:	2d fa 00 00 00       	sub    $0xfa,%eax
   42a9a:	ba 01 00 00 00       	mov    $0x1,%edx
   42a9f:	89 c1                	mov    %eax,%ecx
   42aa1:	d3 e2                	shl    %cl,%edx
   42aa3:	89 d0                	mov    %edx,%eax
   42aa5:	89 c2                	mov    %eax,%edx
   42aa7:	0f b6 05 55 e8 00 00 	movzbl 0xe855(%rip),%eax        # 51303 <modifiers.1>
   42aae:	09 d0                	or     %edx,%eax
   42ab0:	88 05 4d e8 00 00    	mov    %al,0xe84d(%rip)        # 51303 <modifiers.1>
        ch = 0;
   42ab6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42abd:	eb 58                	jmp    42b17 <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42abf:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42ac3:	7e 31                	jle    42af6 <keyboard_readc+0x1f3>
   42ac5:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   42acc:	7f 28                	jg     42af6 <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42ace:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ad1:	8d 50 80             	lea    -0x80(%rax),%edx
   42ad4:	0f b6 05 28 e8 00 00 	movzbl 0xe828(%rip),%eax        # 51303 <modifiers.1>
   42adb:	0f b6 c0             	movzbl %al,%eax
   42ade:	83 e0 03             	and    $0x3,%eax
   42ae1:	48 98                	cltq   
   42ae3:	48 63 d2             	movslq %edx,%rdx
   42ae6:	0f b6 84 90 40 4a 04 	movzbl 0x44a40(%rax,%rdx,4),%eax
   42aed:	00 
   42aee:	0f b6 c0             	movzbl %al,%eax
   42af1:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42af4:	eb 21                	jmp    42b17 <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42af6:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42afa:	7f 1b                	jg     42b17 <keyboard_readc+0x214>
   42afc:	0f b6 05 00 e8 00 00 	movzbl 0xe800(%rip),%eax        # 51303 <modifiers.1>
   42b03:	0f b6 c0             	movzbl %al,%eax
   42b06:	83 e0 02             	and    $0x2,%eax
   42b09:	85 c0                	test   %eax,%eax
   42b0b:	74 0a                	je     42b17 <keyboard_readc+0x214>
        ch = 0;
   42b0d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42b14:	eb 01                	jmp    42b17 <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   42b16:	90                   	nop
    }

    return ch;
   42b17:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42b1a:	c9                   	leaveq 
   42b1b:	c3                   	retq   

0000000000042b1c <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   42b1c:	55                   	push   %rbp
   42b1d:	48 89 e5             	mov    %rsp,%rbp
   42b20:	48 83 ec 20          	sub    $0x20,%rsp
   42b24:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42b2b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42b2e:	89 c2                	mov    %eax,%edx
   42b30:	ec                   	in     (%dx),%al
   42b31:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42b34:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42b3b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42b3e:	89 c2                	mov    %eax,%edx
   42b40:	ec                   	in     (%dx),%al
   42b41:	88 45 eb             	mov    %al,-0x15(%rbp)
   42b44:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42b4b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42b4e:	89 c2                	mov    %eax,%edx
   42b50:	ec                   	in     (%dx),%al
   42b51:	88 45 f3             	mov    %al,-0xd(%rbp)
   42b54:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42b5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42b5e:	89 c2                	mov    %eax,%edx
   42b60:	ec                   	in     (%dx),%al
   42b61:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42b64:	90                   	nop
   42b65:	c9                   	leaveq 
   42b66:	c3                   	retq   

0000000000042b67 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42b67:	55                   	push   %rbp
   42b68:	48 89 e5             	mov    %rsp,%rbp
   42b6b:	48 83 ec 40          	sub    $0x40,%rsp
   42b6f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42b73:	89 f0                	mov    %esi,%eax
   42b75:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42b78:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42b7b:	8b 05 83 e7 00 00    	mov    0xe783(%rip),%eax        # 51304 <initialized.0>
   42b81:	85 c0                	test   %eax,%eax
   42b83:	75 1e                	jne    42ba3 <parallel_port_putc+0x3c>
   42b85:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42b8c:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42b90:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42b94:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42b97:	ee                   	out    %al,(%dx)
}
   42b98:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   42b99:	c7 05 61 e7 00 00 01 	movl   $0x1,0xe761(%rip)        # 51304 <initialized.0>
   42ba0:	00 00 00 
    }

    for (int i = 0;
   42ba3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42baa:	eb 09                	jmp    42bb5 <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42bac:	e8 6b ff ff ff       	callq  42b1c <delay>
         ++i) {
   42bb1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42bb5:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42bbc:	7f 18                	jg     42bd6 <parallel_port_putc+0x6f>
   42bbe:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42bc5:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42bc8:	89 c2                	mov    %eax,%edx
   42bca:	ec                   	in     (%dx),%al
   42bcb:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42bce:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42bd2:	84 c0                	test   %al,%al
   42bd4:	79 d6                	jns    42bac <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   42bd6:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   42bda:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42be1:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42be4:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   42be8:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42beb:	ee                   	out    %al,(%dx)
}
   42bec:	90                   	nop
   42bed:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42bf4:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42bf8:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42bfc:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42bff:	ee                   	out    %al,(%dx)
}
   42c00:	90                   	nop
   42c01:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   42c08:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c0c:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42c10:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42c13:	ee                   	out    %al,(%dx)
}
   42c14:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   42c15:	90                   	nop
   42c16:	c9                   	leaveq 
   42c17:	c3                   	retq   

0000000000042c18 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   42c18:	55                   	push   %rbp
   42c19:	48 89 e5             	mov    %rsp,%rbp
   42c1c:	48 83 ec 20          	sub    $0x20,%rsp
   42c20:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42c24:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42c28:	48 c7 45 f8 67 2b 04 	movq   $0x42b67,-0x8(%rbp)
   42c2f:	00 
    printer_vprintf(&p, 0, format, val);
   42c30:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42c34:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42c38:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42c3c:	be 00 00 00 00       	mov    $0x0,%esi
   42c41:	48 89 c7             	mov    %rax,%rdi
   42c44:	e8 bc 10 00 00       	callq  43d05 <printer_vprintf>
}
   42c49:	90                   	nop
   42c4a:	c9                   	leaveq 
   42c4b:	c3                   	retq   

0000000000042c4c <log_printf>:

void log_printf(const char* format, ...) {
   42c4c:	55                   	push   %rbp
   42c4d:	48 89 e5             	mov    %rsp,%rbp
   42c50:	48 83 ec 60          	sub    $0x60,%rsp
   42c54:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42c58:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42c5c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42c60:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42c64:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42c68:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42c6c:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42c73:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42c77:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42c7b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42c7f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42c83:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   42c87:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42c8b:	48 89 d6             	mov    %rdx,%rsi
   42c8e:	48 89 c7             	mov    %rax,%rdi
   42c91:	e8 82 ff ff ff       	callq  42c18 <log_vprintf>
    va_end(val);
}
   42c96:	90                   	nop
   42c97:	c9                   	leaveq 
   42c98:	c3                   	retq   

0000000000042c99 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42c99:	55                   	push   %rbp
   42c9a:	48 89 e5             	mov    %rsp,%rbp
   42c9d:	48 83 ec 40          	sub    $0x40,%rsp
   42ca1:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42ca4:	89 75 d8             	mov    %esi,-0x28(%rbp)
   42ca7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   42cab:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42caf:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   42cb3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   42cb7:	48 8b 0a             	mov    (%rdx),%rcx
   42cba:	48 89 08             	mov    %rcx,(%rax)
   42cbd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42cc1:	48 89 48 08          	mov    %rcx,0x8(%rax)
   42cc5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   42cc9:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42ccd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42cd1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42cd5:	48 89 d6             	mov    %rdx,%rsi
   42cd8:	48 89 c7             	mov    %rax,%rdi
   42cdb:	e8 38 ff ff ff       	callq  42c18 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42ce0:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42ce4:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42ce8:	8b 75 d8             	mov    -0x28(%rbp),%esi
   42ceb:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42cee:	89 c7                	mov    %eax,%edi
   42cf0:	e8 ef 16 00 00       	callq  443e4 <console_vprintf>
}
   42cf5:	c9                   	leaveq 
   42cf6:	c3                   	retq   

0000000000042cf7 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   42cf7:	55                   	push   %rbp
   42cf8:	48 89 e5             	mov    %rsp,%rbp
   42cfb:	48 83 ec 60          	sub    $0x60,%rsp
   42cff:	89 7d ac             	mov    %edi,-0x54(%rbp)
   42d02:	89 75 a8             	mov    %esi,-0x58(%rbp)
   42d05:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   42d09:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42d0d:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42d11:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42d15:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42d1c:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42d20:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42d24:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42d28:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42d2c:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42d30:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   42d34:	8b 75 a8             	mov    -0x58(%rbp),%esi
   42d37:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d3a:	89 c7                	mov    %eax,%edi
   42d3c:	e8 58 ff ff ff       	callq  42c99 <error_vprintf>
   42d41:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   42d44:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   42d47:	c9                   	leaveq 
   42d48:	c3                   	retq   

0000000000042d49 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42d49:	55                   	push   %rbp
   42d4a:	48 89 e5             	mov    %rsp,%rbp
   42d4d:	53                   	push   %rbx
   42d4e:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   42d52:	e8 ac fb ff ff       	callq  42903 <keyboard_readc>
   42d57:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42d5a:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42d5e:	74 1c                	je     42d7c <check_keyboard+0x33>
   42d60:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   42d64:	74 16                	je     42d7c <check_keyboard+0x33>
   42d66:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42d6a:	74 10                	je     42d7c <check_keyboard+0x33>
   42d6c:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42d70:	74 0a                	je     42d7c <check_keyboard+0x33>
   42d72:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42d76:	0f 85 e9 00 00 00    	jne    42e65 <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42d7c:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   42d83:	00 
        memset(pt, 0, PAGESIZE * 3);
   42d84:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42d88:	ba 00 30 00 00       	mov    $0x3000,%edx
   42d8d:	be 00 00 00 00       	mov    $0x0,%esi
   42d92:	48 89 c7             	mov    %rax,%rdi
   42d95:	e8 5a 0e 00 00       	callq  43bf4 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42d9a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42d9e:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   42da5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42da9:	48 05 00 10 00 00    	add    $0x1000,%rax
   42daf:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   42db6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42dba:	48 05 00 20 00 00    	add    $0x2000,%rax
   42dc0:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   42dc7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42dcb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42dcf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42dd3:	0f 22 d8             	mov    %rax,%cr3
}
   42dd6:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   42dd7:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42dde:	48 c7 45 e8 98 4a 04 	movq   $0x44a98,-0x18(%rbp)
   42de5:	00 
        if (c == 'a') {
   42de6:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42dea:	75 0a                	jne    42df6 <check_keyboard+0xad>
            argument = "allocator";
   42dec:	48 c7 45 e8 9d 4a 04 	movq   $0x44a9d,-0x18(%rbp)
   42df3:	00 
   42df4:	eb 2e                	jmp    42e24 <check_keyboard+0xdb>
        } else if (c == 'e') {
   42df6:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42dfa:	75 0a                	jne    42e06 <check_keyboard+0xbd>
            argument = "forkexit";
   42dfc:	48 c7 45 e8 a7 4a 04 	movq   $0x44aa7,-0x18(%rbp)
   42e03:	00 
   42e04:	eb 1e                	jmp    42e24 <check_keyboard+0xdb>
        }
        else if (c == 't'){
   42e06:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42e0a:	75 0a                	jne    42e16 <check_keyboard+0xcd>
            argument = "test";
   42e0c:	48 c7 45 e8 b0 4a 04 	movq   $0x44ab0,-0x18(%rbp)
   42e13:	00 
   42e14:	eb 0e                	jmp    42e24 <check_keyboard+0xdb>
        }
        else if(c == '2'){
   42e16:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42e1a:	75 08                	jne    42e24 <check_keyboard+0xdb>
            argument = "test2";
   42e1c:	48 c7 45 e8 b5 4a 04 	movq   $0x44ab5,-0x18(%rbp)
   42e23:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   42e24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e28:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   42e2c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42e31:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   42e35:	76 14                	jbe    42e4b <check_keyboard+0x102>
   42e37:	ba bb 4a 04 00       	mov    $0x44abb,%edx
   42e3c:	be 5c 02 00 00       	mov    $0x25c,%esi
   42e41:	bf d7 4a 04 00       	mov    $0x44ad7,%edi
   42e46:	e8 1f 01 00 00       	callq  42f6a <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42e4b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42e4f:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42e52:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   42e56:	48 89 c3             	mov    %rax,%rbx
   42e59:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42e5e:	e9 9d d1 ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42e63:	eb 11                	jmp    42e76 <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   42e65:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   42e69:	74 06                	je     42e71 <check_keyboard+0x128>
   42e6b:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42e6f:	75 05                	jne    42e76 <check_keyboard+0x12d>
        poweroff();
   42e71:	e8 ae f8 ff ff       	callq  42724 <poweroff>
    }
    return c;
   42e76:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   42e79:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42e7d:	c9                   	leaveq 
   42e7e:	c3                   	retq   

0000000000042e7f <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42e7f:	55                   	push   %rbp
   42e80:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   42e83:	e8 c1 fe ff ff       	callq  42d49 <check_keyboard>
   42e88:	eb f9                	jmp    42e83 <fail+0x4>

0000000000042e8a <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42e8a:	55                   	push   %rbp
   42e8b:	48 89 e5             	mov    %rsp,%rbp
   42e8e:	48 83 ec 60          	sub    $0x60,%rsp
   42e92:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42e96:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42e9a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42e9e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42ea2:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42ea6:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42eaa:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42eb1:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42eb5:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42eb9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42ebd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42ec1:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   42ec6:	0f 84 80 00 00 00    	je     42f4c <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42ecc:	ba e4 4a 04 00       	mov    $0x44ae4,%edx
   42ed1:	be 00 c0 00 00       	mov    $0xc000,%esi
   42ed6:	bf 30 07 00 00       	mov    $0x730,%edi
   42edb:	b8 00 00 00 00       	mov    $0x0,%eax
   42ee0:	e8 12 fe ff ff       	callq  42cf7 <error_printf>
   42ee5:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   42ee8:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42eec:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42ef0:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42ef3:	be 00 c0 00 00       	mov    $0xc000,%esi
   42ef8:	89 c7                	mov    %eax,%edi
   42efa:	e8 9a fd ff ff       	callq  42c99 <error_vprintf>
   42eff:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42f02:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   42f05:	48 63 c1             	movslq %ecx,%rax
   42f08:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42f0f:	48 c1 e8 20          	shr    $0x20,%rax
   42f13:	c1 f8 05             	sar    $0x5,%eax
   42f16:	89 ce                	mov    %ecx,%esi
   42f18:	c1 fe 1f             	sar    $0x1f,%esi
   42f1b:	29 f0                	sub    %esi,%eax
   42f1d:	89 c2                	mov    %eax,%edx
   42f1f:	89 d0                	mov    %edx,%eax
   42f21:	c1 e0 02             	shl    $0x2,%eax
   42f24:	01 d0                	add    %edx,%eax
   42f26:	c1 e0 04             	shl    $0x4,%eax
   42f29:	29 c1                	sub    %eax,%ecx
   42f2b:	89 ca                	mov    %ecx,%edx
   42f2d:	85 d2                	test   %edx,%edx
   42f2f:	74 34                	je     42f65 <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   42f31:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42f34:	ba ec 4a 04 00       	mov    $0x44aec,%edx
   42f39:	be 00 c0 00 00       	mov    $0xc000,%esi
   42f3e:	89 c7                	mov    %eax,%edi
   42f40:	b8 00 00 00 00       	mov    $0x0,%eax
   42f45:	e8 ad fd ff ff       	callq  42cf7 <error_printf>
   42f4a:	eb 19                	jmp    42f65 <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42f4c:	ba ee 4a 04 00       	mov    $0x44aee,%edx
   42f51:	be 00 c0 00 00       	mov    $0xc000,%esi
   42f56:	bf 30 07 00 00       	mov    $0x730,%edi
   42f5b:	b8 00 00 00 00       	mov    $0x0,%eax
   42f60:	e8 92 fd ff ff       	callq  42cf7 <error_printf>
    }

    va_end(val);
    fail();
   42f65:	e8 15 ff ff ff       	callq  42e7f <fail>

0000000000042f6a <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42f6a:	55                   	push   %rbp
   42f6b:	48 89 e5             	mov    %rsp,%rbp
   42f6e:	48 83 ec 20          	sub    $0x20,%rsp
   42f72:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42f76:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42f79:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42f7d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42f81:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42f84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42f88:	48 89 c6             	mov    %rax,%rsi
   42f8b:	bf f4 4a 04 00       	mov    $0x44af4,%edi
   42f90:	b8 00 00 00 00       	mov    $0x0,%eax
   42f95:	e8 f0 fe ff ff       	callq  42e8a <panic>

0000000000042f9a <default_exception>:
}

void default_exception(proc* p){
   42f9a:	55                   	push   %rbp
   42f9b:	48 89 e5             	mov    %rsp,%rbp
   42f9e:	48 83 ec 20          	sub    $0x20,%rsp
   42fa2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   42fa6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42faa:	48 83 c0 08          	add    $0x8,%rax
   42fae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42fb2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42fb6:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42fbd:	48 89 c6             	mov    %rax,%rsi
   42fc0:	bf 12 4b 04 00       	mov    $0x44b12,%edi
   42fc5:	b8 00 00 00 00       	mov    $0x0,%eax
   42fca:	e8 bb fe ff ff       	callq  42e8a <panic>

0000000000042fcf <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42fcf:	55                   	push   %rbp
   42fd0:	48 89 e5             	mov    %rsp,%rbp
   42fd3:	48 83 ec 10          	sub    $0x10,%rsp
   42fd7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42fdb:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42fde:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42fe2:	78 06                	js     42fea <pageindex+0x1b>
   42fe4:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   42fe8:	7e 14                	jle    42ffe <pageindex+0x2f>
   42fea:	ba 30 4b 04 00       	mov    $0x44b30,%edx
   42fef:	be 1e 00 00 00       	mov    $0x1e,%esi
   42ff4:	bf 49 4b 04 00       	mov    $0x44b49,%edi
   42ff9:	e8 6c ff ff ff       	callq  42f6a <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42ffe:	b8 03 00 00 00       	mov    $0x3,%eax
   43003:	2b 45 f4             	sub    -0xc(%rbp),%eax
   43006:	89 c2                	mov    %eax,%edx
   43008:	89 d0                	mov    %edx,%eax
   4300a:	c1 e0 03             	shl    $0x3,%eax
   4300d:	01 d0                	add    %edx,%eax
   4300f:	83 c0 0c             	add    $0xc,%eax
   43012:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43016:	89 c1                	mov    %eax,%ecx
   43018:	48 d3 ea             	shr    %cl,%rdx
   4301b:	48 89 d0             	mov    %rdx,%rax
   4301e:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   43023:	c9                   	leaveq 
   43024:	c3                   	retq   

0000000000043025 <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   43025:	55                   	push   %rbp
   43026:	48 89 e5             	mov    %rsp,%rbp
   43029:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   4302d:	48 c7 05 c8 ef 00 00 	movq   $0x53000,0xefc8(%rip)        # 52000 <kernel_pagetable>
   43034:	00 30 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   43038:	ba 00 50 00 00       	mov    $0x5000,%edx
   4303d:	be 00 00 00 00       	mov    $0x0,%esi
   43042:	bf 00 30 05 00       	mov    $0x53000,%edi
   43047:	e8 a8 0b 00 00       	callq  43bf4 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   4304c:	b8 00 40 05 00       	mov    $0x54000,%eax
   43051:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   43055:	48 89 05 a4 ff 00 00 	mov    %rax,0xffa4(%rip)        # 53000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   4305c:	b8 00 50 05 00       	mov    $0x55000,%eax
   43061:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   43065:	48 89 05 94 0f 01 00 	mov    %rax,0x10f94(%rip)        # 54000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   4306c:	b8 00 60 05 00       	mov    $0x56000,%eax
   43071:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   43075:	48 89 05 84 1f 01 00 	mov    %rax,0x11f84(%rip)        # 55000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   4307c:	b8 00 70 05 00       	mov    $0x57000,%eax
   43081:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   43085:	48 89 05 7c 1f 01 00 	mov    %rax,0x11f7c(%rip)        # 55008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   4308c:	48 8b 05 6d ef 00 00 	mov    0xef6d(%rip),%rax        # 52000 <kernel_pagetable>
   43093:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43099:	b9 00 00 20 00       	mov    $0x200000,%ecx
   4309e:	ba 00 00 00 00       	mov    $0x0,%edx
   430a3:	be 00 00 00 00       	mov    $0x0,%esi
   430a8:	48 89 c7             	mov    %rax,%rdi
   430ab:	e8 b9 01 00 00       	callq  43269 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   430b0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   430b7:	00 
   430b8:	eb 62                	jmp    4311c <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   430ba:	48 8b 0d 3f ef 00 00 	mov    0xef3f(%rip),%rcx        # 52000 <kernel_pagetable>
   430c1:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   430c5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   430c9:	48 89 ce             	mov    %rcx,%rsi
   430cc:	48 89 c7             	mov    %rax,%rdi
   430cf:	e8 66 05 00 00       	callq  4363a <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   430d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430d8:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   430dc:	74 14                	je     430f2 <virtual_memory_init+0xcd>
   430de:	ba 52 4b 04 00       	mov    $0x44b52,%edx
   430e3:	be 2d 00 00 00       	mov    $0x2d,%esi
   430e8:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   430ed:	e8 78 fe ff ff       	callq  42f6a <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   430f2:	8b 45 f0             	mov    -0x10(%rbp),%eax
   430f5:	48 98                	cltq   
   430f7:	83 e0 03             	and    $0x3,%eax
   430fa:	48 83 f8 03          	cmp    $0x3,%rax
   430fe:	74 14                	je     43114 <virtual_memory_init+0xef>
   43100:	ba 68 4b 04 00       	mov    $0x44b68,%edx
   43105:	be 2e 00 00 00       	mov    $0x2e,%esi
   4310a:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   4310f:	e8 56 fe ff ff       	callq  42f6a <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   43114:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4311b:	00 
   4311c:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   43123:	00 
   43124:	76 94                	jbe    430ba <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   43126:	48 8b 05 d3 ee 00 00 	mov    0xeed3(%rip),%rax        # 52000 <kernel_pagetable>
   4312d:	48 89 c7             	mov    %rax,%rdi
   43130:	e8 03 00 00 00       	callq  43138 <set_pagetable>
}
   43135:	90                   	nop
   43136:	c9                   	leaveq 
   43137:	c3                   	retq   

0000000000043138 <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   43138:	55                   	push   %rbp
   43139:	48 89 e5             	mov    %rsp,%rbp
   4313c:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43140:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   43144:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43148:	25 ff 0f 00 00       	and    $0xfff,%eax
   4314d:	48 85 c0             	test   %rax,%rax
   43150:	74 14                	je     43166 <set_pagetable+0x2e>
   43152:	ba 95 4b 04 00       	mov    $0x44b95,%edx
   43157:	be 3d 00 00 00       	mov    $0x3d,%esi
   4315c:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43161:	e8 04 fe ff ff       	callq  42f6a <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   43166:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   4316b:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   4316f:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43173:	48 89 ce             	mov    %rcx,%rsi
   43176:	48 89 c7             	mov    %rax,%rdi
   43179:	e8 bc 04 00 00       	callq  4363a <virtual_memory_lookup>
   4317e:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43182:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   43187:	48 39 d0             	cmp    %rdx,%rax
   4318a:	74 14                	je     431a0 <set_pagetable+0x68>
   4318c:	ba b0 4b 04 00       	mov    $0x44bb0,%edx
   43191:	be 3f 00 00 00       	mov    $0x3f,%esi
   43196:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   4319b:	e8 ca fd ff ff       	callq  42f6a <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   431a0:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   431a4:	48 8b 0d 55 ee 00 00 	mov    0xee55(%rip),%rcx        # 52000 <kernel_pagetable>
   431ab:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   431af:	48 89 ce             	mov    %rcx,%rsi
   431b2:	48 89 c7             	mov    %rax,%rdi
   431b5:	e8 80 04 00 00       	callq  4363a <virtual_memory_lookup>
   431ba:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   431be:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   431c2:	48 39 c2             	cmp    %rax,%rdx
   431c5:	74 14                	je     431db <set_pagetable+0xa3>
   431c7:	ba 18 4c 04 00       	mov    $0x44c18,%edx
   431cc:	be 41 00 00 00       	mov    $0x41,%esi
   431d1:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   431d6:	e8 8f fd ff ff       	callq  42f6a <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   431db:	48 8b 05 1e ee 00 00 	mov    0xee1e(%rip),%rax        # 52000 <kernel_pagetable>
   431e2:	48 89 c2             	mov    %rax,%rdx
   431e5:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   431e9:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   431ed:	48 89 ce             	mov    %rcx,%rsi
   431f0:	48 89 c7             	mov    %rax,%rdi
   431f3:	e8 42 04 00 00       	callq  4363a <virtual_memory_lookup>
   431f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   431fc:	48 8b 15 fd ed 00 00 	mov    0xedfd(%rip),%rdx        # 52000 <kernel_pagetable>
   43203:	48 39 d0             	cmp    %rdx,%rax
   43206:	74 14                	je     4321c <set_pagetable+0xe4>
   43208:	ba 78 4c 04 00       	mov    $0x44c78,%edx
   4320d:	be 43 00 00 00       	mov    $0x43,%esi
   43212:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43217:	e8 4e fd ff ff       	callq  42f6a <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   4321c:	ba 69 32 04 00       	mov    $0x43269,%edx
   43221:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   43225:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43229:	48 89 ce             	mov    %rcx,%rsi
   4322c:	48 89 c7             	mov    %rax,%rdi
   4322f:	e8 06 04 00 00       	callq  4363a <virtual_memory_lookup>
   43234:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43238:	ba 69 32 04 00       	mov    $0x43269,%edx
   4323d:	48 39 d0             	cmp    %rdx,%rax
   43240:	74 14                	je     43256 <set_pagetable+0x11e>
   43242:	ba e0 4c 04 00       	mov    $0x44ce0,%edx
   43247:	be 45 00 00 00       	mov    $0x45,%esi
   4324c:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43251:	e8 14 fd ff ff       	callq  42f6a <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   43256:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   4325a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   4325e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43262:	0f 22 d8             	mov    %rax,%cr3
}
   43265:	90                   	nop
}
   43266:	90                   	nop
   43267:	c9                   	leaveq 
   43268:	c3                   	retq   

0000000000043269 <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   43269:	55                   	push   %rbp
   4326a:	48 89 e5             	mov    %rsp,%rbp
   4326d:	53                   	push   %rbx
   4326e:	48 83 ec 58          	sub    $0x58,%rsp
   43272:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43276:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   4327a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   4327e:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   43282:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   43286:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4328a:	25 ff 0f 00 00       	and    $0xfff,%eax
   4328f:	48 85 c0             	test   %rax,%rax
   43292:	74 14                	je     432a8 <virtual_memory_map+0x3f>
   43294:	ba 46 4d 04 00       	mov    $0x44d46,%edx
   43299:	be 63 00 00 00       	mov    $0x63,%esi
   4329e:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   432a3:	e8 c2 fc ff ff       	callq  42f6a <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   432a8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432ac:	25 ff 0f 00 00       	and    $0xfff,%eax
   432b1:	48 85 c0             	test   %rax,%rax
   432b4:	74 14                	je     432ca <virtual_memory_map+0x61>
   432b6:	ba 59 4d 04 00       	mov    $0x44d59,%edx
   432bb:	be 64 00 00 00       	mov    $0x64,%esi
   432c0:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   432c5:	e8 a0 fc ff ff       	callq  42f6a <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   432ca:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   432ce:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432d2:	48 01 d0             	add    %rdx,%rax
   432d5:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   432d9:	76 24                	jbe    432ff <virtual_memory_map+0x96>
   432db:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   432df:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   432e3:	48 01 d0             	add    %rdx,%rax
   432e6:	48 85 c0             	test   %rax,%rax
   432e9:	74 14                	je     432ff <virtual_memory_map+0x96>
   432eb:	ba 6c 4d 04 00       	mov    $0x44d6c,%edx
   432f0:	be 65 00 00 00       	mov    $0x65,%esi
   432f5:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   432fa:	e8 6b fc ff ff       	callq  42f6a <assert_fail>
    if (perm & PTE_P) {
   432ff:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43302:	48 98                	cltq   
   43304:	83 e0 01             	and    $0x1,%eax
   43307:	48 85 c0             	test   %rax,%rax
   4330a:	74 6e                	je     4337a <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   4330c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43310:	25 ff 0f 00 00       	and    $0xfff,%eax
   43315:	48 85 c0             	test   %rax,%rax
   43318:	74 14                	je     4332e <virtual_memory_map+0xc5>
   4331a:	ba 8a 4d 04 00       	mov    $0x44d8a,%edx
   4331f:	be 67 00 00 00       	mov    $0x67,%esi
   43324:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43329:	e8 3c fc ff ff       	callq  42f6a <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   4332e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43332:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43336:	48 01 d0             	add    %rdx,%rax
   43339:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   4333d:	76 14                	jbe    43353 <virtual_memory_map+0xea>
   4333f:	ba 9d 4d 04 00       	mov    $0x44d9d,%edx
   43344:	be 68 00 00 00       	mov    $0x68,%esi
   43349:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   4334e:	e8 17 fc ff ff       	callq  42f6a <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   43353:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43357:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4335b:	48 01 d0             	add    %rdx,%rax
   4335e:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   43364:	76 14                	jbe    4337a <virtual_memory_map+0x111>
   43366:	ba ab 4d 04 00       	mov    $0x44dab,%edx
   4336b:	be 69 00 00 00       	mov    $0x69,%esi
   43370:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43375:	e8 f0 fb ff ff       	callq  42f6a <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   4337a:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   4337e:	78 09                	js     43389 <virtual_memory_map+0x120>
   43380:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   43387:	7e 14                	jle    4339d <virtual_memory_map+0x134>
   43389:	ba c7 4d 04 00       	mov    $0x44dc7,%edx
   4338e:	be 6b 00 00 00       	mov    $0x6b,%esi
   43393:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43398:	e8 cd fb ff ff       	callq  42f6a <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   4339d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   433a1:	25 ff 0f 00 00       	and    $0xfff,%eax
   433a6:	48 85 c0             	test   %rax,%rax
   433a9:	74 14                	je     433bf <virtual_memory_map+0x156>
   433ab:	ba e8 4d 04 00       	mov    $0x44de8,%edx
   433b0:	be 6c 00 00 00       	mov    $0x6c,%esi
   433b5:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   433ba:	e8 ab fb ff ff       	callq  42f6a <assert_fail>

    int last_index123 = -1;
   433bf:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   433c6:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   433cd:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   433ce:	e9 e1 00 00 00       	jmpq   434b4 <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   433d3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   433d7:	48 c1 e8 15          	shr    $0x15,%rax
   433db:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   433de:	8b 45 dc             	mov    -0x24(%rbp),%eax
   433e1:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   433e4:	74 20                	je     43406 <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   433e6:	8b 55 ac             	mov    -0x54(%rbp),%edx
   433e9:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   433ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   433f1:	48 89 ce             	mov    %rcx,%rsi
   433f4:	48 89 c7             	mov    %rax,%rdi
   433f7:	e8 ce 00 00 00       	callq  434ca <lookup_l4pagetable>
   433fc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   43400:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43403:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   43406:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43409:	48 98                	cltq   
   4340b:	83 e0 01             	and    $0x1,%eax
   4340e:	48 85 c0             	test   %rax,%rax
   43411:	74 34                	je     43447 <virtual_memory_map+0x1de>
   43413:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43418:	74 2d                	je     43447 <virtual_memory_map+0x1de>
            // TODO
            // map `pa` at appropriate entry with permissions `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   4341a:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4341d:	48 63 d8             	movslq %eax,%rbx
   43420:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43424:	be 03 00 00 00       	mov    $0x3,%esi
   43429:	48 89 c7             	mov    %rax,%rdi
   4342c:	e8 9e fb ff ff       	callq  42fcf <pageindex>
   43431:	89 c2                	mov    %eax,%edx
   43433:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   43437:	48 89 d9             	mov    %rbx,%rcx
   4343a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4343e:	48 63 d2             	movslq %edx,%rdx
   43441:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43445:	eb 55                	jmp    4349c <virtual_memory_map+0x233>
        } else if (l4pagetable) { // if page is NOT marked present
   43447:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4344c:	74 26                	je     43474 <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   4344e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43452:	be 03 00 00 00       	mov    $0x3,%esi
   43457:	48 89 c7             	mov    %rax,%rdi
   4345a:	e8 70 fb ff ff       	callq  42fcf <pageindex>
   4345f:	89 c2                	mov    %eax,%edx
   43461:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43464:	48 63 c8             	movslq %eax,%rcx
   43467:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4346b:	48 63 d2             	movslq %edx,%rdx
   4346e:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43472:	eb 28                	jmp    4349c <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   43474:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43477:	48 98                	cltq   
   43479:	83 e0 01             	and    $0x1,%eax
   4347c:	48 85 c0             	test   %rax,%rax
   4347f:	74 1b                	je     4349c <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   43481:	be 84 00 00 00       	mov    $0x84,%esi
   43486:	bf 10 4e 04 00       	mov    $0x44e10,%edi
   4348b:	b8 00 00 00 00       	mov    $0x0,%eax
   43490:	e8 b7 f7 ff ff       	callq  42c4c <log_printf>
            return -1;
   43495:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4349a:	eb 28                	jmp    434c4 <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   4349c:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   434a3:	00 
   434a4:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   434ab:	00 
   434ac:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   434b3:	00 
   434b4:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   434b9:	0f 85 14 ff ff ff    	jne    433d3 <virtual_memory_map+0x16a>
        }
    }
    return 0;
   434bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
   434c4:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   434c8:	c9                   	leaveq 
   434c9:	c3                   	retq   

00000000000434ca <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   434ca:	55                   	push   %rbp
   434cb:	48 89 e5             	mov    %rsp,%rbp
   434ce:	48 83 ec 40          	sub    $0x40,%rsp
   434d2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   434d6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   434da:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   434dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   434e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   434e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   434ec:	e9 39 01 00 00       	jmpq   4362a <lookup_l4pagetable+0x160>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   434f1:	8b 55 f4             	mov    -0xc(%rbp),%edx
   434f4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   434f8:	89 d6                	mov    %edx,%esi
   434fa:	48 89 c7             	mov    %rax,%rdi
   434fd:	e8 cd fa ff ff       	callq  42fcf <pageindex>
   43502:	89 c2                	mov    %eax,%edx
   43504:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43508:	48 63 d2             	movslq %edx,%rdx
   4350b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4350f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   43513:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43517:	83 e0 01             	and    $0x1,%eax
   4351a:	48 85 c0             	test   %rax,%rax
   4351d:	75 63                	jne    43582 <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   4351f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   43522:	8d 48 02             	lea    0x2(%rax),%ecx
   43525:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43529:	25 ff 0f 00 00       	and    $0xfff,%eax
   4352e:	48 89 c2             	mov    %rax,%rdx
   43531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43535:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4353b:	48 89 c6             	mov    %rax,%rsi
   4353e:	bf 50 4e 04 00       	mov    $0x44e50,%edi
   43543:	b8 00 00 00 00       	mov    $0x0,%eax
   43548:	e8 ff f6 ff ff       	callq  42c4c <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   4354d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43550:	48 98                	cltq   
   43552:	83 e0 01             	and    $0x1,%eax
   43555:	48 85 c0             	test   %rax,%rax
   43558:	75 0a                	jne    43564 <lookup_l4pagetable+0x9a>
                return NULL;
   4355a:	b8 00 00 00 00       	mov    $0x0,%eax
   4355f:	e9 d4 00 00 00       	jmpq   43638 <lookup_l4pagetable+0x16e>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   43564:	be a7 00 00 00       	mov    $0xa7,%esi
   43569:	bf b8 4e 04 00       	mov    $0x44eb8,%edi
   4356e:	b8 00 00 00 00       	mov    $0x0,%eax
   43573:	e8 d4 f6 ff ff       	callq  42c4c <log_printf>
            return NULL;
   43578:	b8 00 00 00 00       	mov    $0x0,%eax
   4357d:	e9 b6 00 00 00       	jmpq   43638 <lookup_l4pagetable+0x16e>
        }

        // sanity-check page entry and permissions
        log_printf("PE: %d\n", pe);
   43582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43586:	48 89 c6             	mov    %rax,%rsi
   43589:	bf f2 4e 04 00       	mov    $0x44ef2,%edi
   4358e:	b8 00 00 00 00       	mov    $0x0,%eax
   43593:	e8 b4 f6 ff ff       	callq  42c4c <log_printf>
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   43598:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4359c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   435a2:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   435a8:	76 14                	jbe    435be <lookup_l4pagetable+0xf4>
   435aa:	ba 00 4f 04 00       	mov    $0x44f00,%edx
   435af:	be ad 00 00 00       	mov    $0xad,%esi
   435b4:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   435b9:	e8 ac f9 ff ff       	callq  42f6a <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   435be:	8b 45 cc             	mov    -0x34(%rbp),%eax
   435c1:	48 98                	cltq   
   435c3:	83 e0 02             	and    $0x2,%eax
   435c6:	48 85 c0             	test   %rax,%rax
   435c9:	74 20                	je     435eb <lookup_l4pagetable+0x121>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   435cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435cf:	83 e0 02             	and    $0x2,%eax
   435d2:	48 85 c0             	test   %rax,%rax
   435d5:	75 14                	jne    435eb <lookup_l4pagetable+0x121>
   435d7:	ba 20 4f 04 00       	mov    $0x44f20,%edx
   435dc:	be af 00 00 00       	mov    $0xaf,%esi
   435e1:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   435e6:	e8 7f f9 ff ff       	callq  42f6a <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   435eb:	8b 45 cc             	mov    -0x34(%rbp),%eax
   435ee:	48 98                	cltq   
   435f0:	83 e0 04             	and    $0x4,%eax
   435f3:	48 85 c0             	test   %rax,%rax
   435f6:	74 20                	je     43618 <lookup_l4pagetable+0x14e>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   435f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435fc:	83 e0 04             	and    $0x4,%eax
   435ff:	48 85 c0             	test   %rax,%rax
   43602:	75 14                	jne    43618 <lookup_l4pagetable+0x14e>
   43604:	ba 2b 4f 04 00       	mov    $0x44f2b,%edx
   43609:	be b2 00 00 00       	mov    $0xb2,%esi
   4360e:	bf 62 4b 04 00       	mov    $0x44b62,%edi
   43613:	e8 52 f9 ff ff       	callq  42f6a <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   43618:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4361c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43622:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   43626:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4362a:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   4362e:	0f 8e bd fe ff ff    	jle    434f1 <lookup_l4pagetable+0x27>
    }
    return pt;
   43634:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   43638:	c9                   	leaveq 
   43639:	c3                   	retq   

000000000004363a <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   4363a:	55                   	push   %rbp
   4363b:	48 89 e5             	mov    %rsp,%rbp
   4363e:	48 83 ec 50          	sub    $0x50,%rsp
   43642:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43646:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   4364a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   4364e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43652:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   43656:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   4365d:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   4365e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   43665:	eb 41                	jmp    436a8 <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   43667:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4366a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4366e:	89 d6                	mov    %edx,%esi
   43670:	48 89 c7             	mov    %rax,%rdi
   43673:	e8 57 f9 ff ff       	callq  42fcf <pageindex>
   43678:	89 c2                	mov    %eax,%edx
   4367a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4367e:	48 63 d2             	movslq %edx,%rdx
   43681:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   43685:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43689:	83 e0 06             	and    $0x6,%eax
   4368c:	48 f7 d0             	not    %rax
   4368f:	48 21 d0             	and    %rdx,%rax
   43692:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   43696:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4369a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   436a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   436a4:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   436a8:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   436ac:	7f 0c                	jg     436ba <virtual_memory_lookup+0x80>
   436ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436b2:	83 e0 01             	and    $0x1,%eax
   436b5:	48 85 c0             	test   %rax,%rax
   436b8:	75 ad                	jne    43667 <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   436ba:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   436c1:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   436c8:	ff 
   436c9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   436d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436d4:	83 e0 01             	and    $0x1,%eax
   436d7:	48 85 c0             	test   %rax,%rax
   436da:	74 34                	je     43710 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   436dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436e0:	48 c1 e8 0c          	shr    $0xc,%rax
   436e4:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   436e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436eb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   436f1:	48 89 c2             	mov    %rax,%rdx
   436f4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   436f8:	25 ff 0f 00 00       	and    $0xfff,%eax
   436fd:	48 09 d0             	or     %rdx,%rax
   43700:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   43704:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43708:	25 ff 0f 00 00       	and    $0xfff,%eax
   4370d:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   43710:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43714:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43718:	48 89 10             	mov    %rdx,(%rax)
   4371b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   4371f:	48 89 50 08          	mov    %rdx,0x8(%rax)
   43723:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43727:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   4372b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4372f:	c9                   	leaveq 
   43730:	c3                   	retq   

0000000000043731 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43731:	55                   	push   %rbp
   43732:	48 89 e5             	mov    %rsp,%rbp
   43735:	48 83 ec 40          	sub    $0x40,%rsp
   43739:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   4373d:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43740:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   43744:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   4374b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   4374f:	78 08                	js     43759 <program_load+0x28>
   43751:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43754:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   43757:	7c 14                	jl     4376d <program_load+0x3c>
   43759:	ba 38 4f 04 00       	mov    $0x44f38,%edx
   4375e:	be 37 00 00 00       	mov    $0x37,%esi
   43763:	bf 68 4f 04 00       	mov    $0x44f68,%edi
   43768:	e8 fd f7 ff ff       	callq  42f6a <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   4376d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43770:	48 98                	cltq   
   43772:	48 c1 e0 04          	shl    $0x4,%rax
   43776:	48 05 20 60 04 00    	add    $0x46020,%rax
   4377c:	48 8b 00             	mov    (%rax),%rax
   4377f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   43783:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43787:	8b 00                	mov    (%rax),%eax
   43789:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   4378e:	74 14                	je     437a4 <program_load+0x73>
   43790:	ba 73 4f 04 00       	mov    $0x44f73,%edx
   43795:	be 39 00 00 00       	mov    $0x39,%esi
   4379a:	bf 68 4f 04 00       	mov    $0x44f68,%edi
   4379f:	e8 c6 f7 ff ff       	callq  42f6a <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   437a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437a8:	48 8b 50 20          	mov    0x20(%rax),%rdx
   437ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437b0:	48 01 d0             	add    %rdx,%rax
   437b3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   437b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   437be:	e9 94 00 00 00       	jmpq   43857 <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   437c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   437c6:	48 63 d0             	movslq %eax,%rdx
   437c9:	48 89 d0             	mov    %rdx,%rax
   437cc:	48 c1 e0 03          	shl    $0x3,%rax
   437d0:	48 29 d0             	sub    %rdx,%rax
   437d3:	48 c1 e0 03          	shl    $0x3,%rax
   437d7:	48 89 c2             	mov    %rax,%rdx
   437da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   437de:	48 01 d0             	add    %rdx,%rax
   437e1:	8b 00                	mov    (%rax),%eax
   437e3:	83 f8 01             	cmp    $0x1,%eax
   437e6:	75 6b                	jne    43853 <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   437e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   437eb:	48 63 d0             	movslq %eax,%rdx
   437ee:	48 89 d0             	mov    %rdx,%rax
   437f1:	48 c1 e0 03          	shl    $0x3,%rax
   437f5:	48 29 d0             	sub    %rdx,%rax
   437f8:	48 c1 e0 03          	shl    $0x3,%rax
   437fc:	48 89 c2             	mov    %rax,%rdx
   437ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43803:	48 01 d0             	add    %rdx,%rax
   43806:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4380a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4380e:	48 01 d0             	add    %rdx,%rax
   43811:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   43815:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43818:	48 63 d0             	movslq %eax,%rdx
   4381b:	48 89 d0             	mov    %rdx,%rax
   4381e:	48 c1 e0 03          	shl    $0x3,%rax
   43822:	48 29 d0             	sub    %rdx,%rax
   43825:	48 c1 e0 03          	shl    $0x3,%rax
   43829:	48 89 c2             	mov    %rax,%rdx
   4382c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43830:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43834:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43838:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4383c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43840:	48 89 c7             	mov    %rax,%rdi
   43843:	e8 3d 00 00 00       	callq  43885 <program_load_segment>
   43848:	85 c0                	test   %eax,%eax
   4384a:	79 07                	jns    43853 <program_load+0x122>
                return -1;
   4384c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43851:	eb 30                	jmp    43883 <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43853:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43857:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4385b:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   4385f:	0f b7 c0             	movzwl %ax,%eax
   43862:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43865:	0f 8c 58 ff ff ff    	jl     437c3 <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4386b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4386f:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43873:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43877:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   4387e:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43883:	c9                   	leaveq 
   43884:	c3                   	retq   

0000000000043885 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43885:	55                   	push   %rbp
   43886:	48 89 e5             	mov    %rsp,%rbp
   43889:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   4388d:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
   43891:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
   43895:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   43899:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   4389d:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438a1:	48 8b 40 10          	mov    0x10(%rax),%rax
   438a5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   438a9:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438ad:	48 8b 50 20          	mov    0x20(%rax),%rdx
   438b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   438b5:	48 01 d0             	add    %rdx,%rax
   438b8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   438bc:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438c0:	48 8b 50 28          	mov    0x28(%rax),%rdx
   438c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   438c8:	48 01 d0             	add    %rdx,%rax
   438cb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   438cf:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   438d6:	ff 

    int read_only = (ph->p_flags & ELF_PFLAG_WRITE) == 0;
   438d7:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   438db:	8b 40 04             	mov    0x4(%rax),%eax
   438de:	83 e0 02             	and    $0x2,%eax
   438e1:	85 c0                	test   %eax,%eax
   438e3:	0f 94 c0             	sete   %al
   438e6:	0f b6 c0             	movzbl %al,%eax
   438e9:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    int perm = read_only ? PTE_P | PTE_U : PTE_P | PTE_W | PTE_U;
   438ec:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   438f0:	74 07                	je     438f9 <program_load_segment+0x74>
   438f2:	b8 05 00 00 00       	mov    $0x5,%eax
   438f7:	eb 05                	jmp    438fe <program_load_segment+0x79>
   438f9:	b8 07 00 00 00       	mov    $0x7,%eax
   438fe:	89 45 d0             	mov    %eax,-0x30(%rbp)
    vamapping map;

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43901:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43905:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43909:	e9 10 01 00 00       	jmpq   43a1e <program_load_segment+0x199>
        int free_page_number = get_free_page_number();
   4390e:	b8 00 00 00 00       	mov    $0x0,%eax
   43913:	e8 eb ca ff ff       	callq  40403 <get_free_page_number>
   43918:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (free_page_number < 0) {
   4391b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
   4391f:	79 4d                	jns    4396e <program_load_segment+0xe9>
            free_process_pages(p->p_pid, p->p_pagetable);
   43921:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43925:	48 8b 90 d0 00 00 00 	mov    0xd0(%rax),%rdx
   4392c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43930:	8b 00                	mov    (%rax),%eax
   43932:	48 89 d6             	mov    %rdx,%rsi
   43935:	89 c7                	mov    %eax,%edi
   43937:	e8 e8 d2 ff ff       	callq  40c24 <free_process_pages>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   4393c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43940:	8b 00                	mov    (%rax),%eax
   43942:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43946:	49 89 d0             	mov    %rdx,%r8
   43949:	89 c1                	mov    %eax,%ecx
   4394b:	ba 90 4f 04 00       	mov    $0x44f90,%edx
   43950:	be 00 c0 00 00       	mov    $0xc000,%esi
   43955:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4395a:	b8 00 00 00 00       	mov    $0x0,%eax
   4395f:	e8 c5 0a 00 00       	callq  44429 <console_printf>
            return -1;
   43964:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43969:	e9 7f 01 00 00       	jmpq   43aed <program_load_segment+0x268>
        }

        uintptr_t new_addr = PAGEADDRESS(free_page_number);
   4396e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43971:	48 98                	cltq   
   43973:	48 c1 e0 0c          	shl    $0xc,%rax
   43977:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        int assign_status = assign_physical_page(new_addr, p->p_pid);
   4397b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4397f:	8b 00                	mov    (%rax),%eax
   43981:	0f be d0             	movsbl %al,%edx
   43984:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43988:	89 d6                	mov    %edx,%esi
   4398a:	48 89 c7             	mov    %rax,%rdi
   4398d:	e8 a5 d0 ff ff       	callq  40a37 <assign_physical_page>
   43992:	89 45 bc             	mov    %eax,-0x44(%rbp)
        if (assign_status < 0) {
   43995:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   43999:	79 4d                	jns    439e8 <program_load_segment+0x163>
            free_process_pages(p->p_pid, p->p_pagetable);
   4399b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4399f:	48 8b 90 d0 00 00 00 	mov    0xd0(%rax),%rdx
   439a6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439aa:	8b 00                	mov    (%rax),%eax
   439ac:	48 89 d6             	mov    %rdx,%rsi
   439af:	89 c7                	mov    %eax,%edi
   439b1:	e8 6e d2 ff ff       	callq  40c24 <free_process_pages>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   439b6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439ba:	8b 00                	mov    (%rax),%eax
   439bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   439c0:	49 89 d0             	mov    %rdx,%r8
   439c3:	89 c1                	mov    %eax,%ecx
   439c5:	ba 90 4f 04 00       	mov    $0x44f90,%edx
   439ca:	be 00 c0 00 00       	mov    $0xc000,%esi
   439cf:	bf e0 06 00 00       	mov    $0x6e0,%edi
   439d4:	b8 00 00 00 00       	mov    $0x0,%eax
   439d9:	e8 4b 0a 00 00       	callq  44429 <console_printf>
            return -1;
   439de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   439e3:	e9 05 01 00 00       	jmpq   43aed <program_load_segment+0x268>
        }

        virtual_memory_map(p->p_pagetable, addr, PAGEADDRESS(free_page_number), PAGESIZE, PTE_U | PTE_W | PTE_P);
   439e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
   439eb:	48 98                	cltq   
   439ed:	48 c1 e0 0c          	shl    $0xc,%rax
   439f1:	48 89 c2             	mov    %rax,%rdx
   439f4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   439f8:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   439ff:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43a03:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43a09:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43a0e:	48 89 c7             	mov    %rax,%rdi
   43a11:	e8 53 f8 ff ff       	callq  43269 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43a16:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43a1d:	00 
   43a1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43a22:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43a26:	0f 82 e2 fe ff ff    	jb     4390e <program_load_segment+0x89>
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   43a2c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43a30:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43a37:	48 89 c7             	mov    %rax,%rdi
   43a3a:	e8 f9 f6 ff ff       	callq  43138 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   43a3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43a43:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43a47:	48 89 c2             	mov    %rax,%rdx
   43a4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a4e:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43a52:	48 89 ce             	mov    %rcx,%rsi
   43a55:	48 89 c7             	mov    %rax,%rdi
   43a58:	e8 2e 01 00 00       	callq  43b8b <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   43a5d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43a61:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   43a65:	48 89 c2             	mov    %rax,%rdx
   43a68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43a6c:	be 00 00 00 00       	mov    $0x0,%esi
   43a71:	48 89 c7             	mov    %rax,%rdi
   43a74:	e8 7b 01 00 00       	callq  43bf4 <memset>

    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43a79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a7d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43a81:	eb 4c                	jmp    43acf <program_load_segment+0x24a>
        map = virtual_memory_lookup(p->p_pagetable, addr);
   43a83:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43a87:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   43a8e:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   43a92:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   43a96:	48 89 ce             	mov    %rcx,%rsi
   43a99:	48 89 c7             	mov    %rax,%rdi
   43a9c:	e8 99 fb ff ff       	callq  4363a <virtual_memory_lookup>
        virtual_memory_map(p->p_pagetable, addr, map.pa, PAGESIZE, perm);
   43aa1:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   43aa5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43aa9:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43ab0:	8b 4d d0             	mov    -0x30(%rbp),%ecx
   43ab3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   43ab7:	41 89 c8             	mov    %ecx,%r8d
   43aba:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43abf:	48 89 c7             	mov    %rax,%rdi
   43ac2:	e8 a2 f7 ff ff       	callq  43269 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43ac7:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   43ace:	00 
   43acf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43ad3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43ad7:	72 aa                	jb     43a83 <program_load_segment+0x1fe>
    }

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   43ad9:	48 8b 05 20 e5 00 00 	mov    0xe520(%rip),%rax        # 52000 <kernel_pagetable>
   43ae0:	48 89 c7             	mov    %rax,%rdi
   43ae3:	e8 50 f6 ff ff       	callq  43138 <set_pagetable>
    return 0;
   43ae8:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43aed:	c9                   	leaveq 
   43aee:	c3                   	retq   

0000000000043aef <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   43aef:	48 89 f9             	mov    %rdi,%rcx
   43af2:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43af4:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   43afb:	00 
   43afc:	72 08                	jb     43b06 <console_putc+0x17>
        cp->cursor = console;
   43afe:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   43b05:	00 
    }
    if (c == '\n') {
   43b06:	40 80 fe 0a          	cmp    $0xa,%sil
   43b0a:	74 16                	je     43b22 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   43b0c:	48 8b 41 08          	mov    0x8(%rcx),%rax
   43b10:	48 8d 50 02          	lea    0x2(%rax),%rdx
   43b14:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   43b18:	40 0f b6 f6          	movzbl %sil,%esi
   43b1c:	09 fe                	or     %edi,%esi
   43b1e:	66 89 30             	mov    %si,(%rax)
    }
}
   43b21:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   43b22:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   43b26:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   43b2d:	4c 89 c6             	mov    %r8,%rsi
   43b30:	48 d1 fe             	sar    %rsi
   43b33:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43b3a:	66 66 66 
   43b3d:	48 89 f0             	mov    %rsi,%rax
   43b40:	48 f7 ea             	imul   %rdx
   43b43:	48 c1 fa 05          	sar    $0x5,%rdx
   43b47:	49 c1 f8 3f          	sar    $0x3f,%r8
   43b4b:	4c 29 c2             	sub    %r8,%rdx
   43b4e:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   43b52:	48 c1 e2 04          	shl    $0x4,%rdx
   43b56:	89 f0                	mov    %esi,%eax
   43b58:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   43b5a:	83 cf 20             	or     $0x20,%edi
   43b5d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43b61:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   43b65:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   43b69:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   43b6c:	83 c0 01             	add    $0x1,%eax
   43b6f:	83 f8 50             	cmp    $0x50,%eax
   43b72:	75 e9                	jne    43b5d <console_putc+0x6e>
   43b74:	c3                   	retq   

0000000000043b75 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43b75:	48 8b 47 08          	mov    0x8(%rdi),%rax
   43b79:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   43b7d:	73 0b                	jae    43b8a <string_putc+0x15>
        *sp->s++ = c;
   43b7f:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43b83:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   43b87:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   43b8a:	c3                   	retq   

0000000000043b8b <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   43b8b:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43b8e:	48 85 d2             	test   %rdx,%rdx
   43b91:	74 17                	je     43baa <memcpy+0x1f>
   43b93:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   43b98:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   43b9d:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43ba1:	48 83 c1 01          	add    $0x1,%rcx
   43ba5:	48 39 d1             	cmp    %rdx,%rcx
   43ba8:	75 ee                	jne    43b98 <memcpy+0xd>
}
   43baa:	c3                   	retq   

0000000000043bab <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   43bab:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   43bae:	48 39 fe             	cmp    %rdi,%rsi
   43bb1:	72 1d                	jb     43bd0 <memmove+0x25>
        while (n-- > 0) {
   43bb3:	b9 00 00 00 00       	mov    $0x0,%ecx
   43bb8:	48 85 d2             	test   %rdx,%rdx
   43bbb:	74 12                	je     43bcf <memmove+0x24>
            *d++ = *s++;
   43bbd:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   43bc1:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43bc5:	48 83 c1 01          	add    $0x1,%rcx
   43bc9:	48 39 ca             	cmp    %rcx,%rdx
   43bcc:	75 ef                	jne    43bbd <memmove+0x12>
}
   43bce:	c3                   	retq   
   43bcf:	c3                   	retq   
    if (s < d && s + n > d) {
   43bd0:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   43bd4:	48 39 cf             	cmp    %rcx,%rdi
   43bd7:	73 da                	jae    43bb3 <memmove+0x8>
        while (n-- > 0) {
   43bd9:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   43bdd:	48 85 d2             	test   %rdx,%rdx
   43be0:	74 ec                	je     43bce <memmove+0x23>
            *--d = *--s;
   43be2:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   43be6:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   43be9:	48 83 e9 01          	sub    $0x1,%rcx
   43bed:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43bf1:	75 ef                	jne    43be2 <memmove+0x37>
   43bf3:	c3                   	retq   

0000000000043bf4 <memset>:
void* memset(void* v, int c, size_t n) {
   43bf4:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43bf7:	48 85 d2             	test   %rdx,%rdx
   43bfa:	74 12                	je     43c0e <memset+0x1a>
   43bfc:	48 01 fa             	add    %rdi,%rdx
   43bff:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   43c02:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43c05:	48 83 c1 01          	add    $0x1,%rcx
   43c09:	48 39 ca             	cmp    %rcx,%rdx
   43c0c:	75 f4                	jne    43c02 <memset+0xe>
}
   43c0e:	c3                   	retq   

0000000000043c0f <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   43c0f:	80 3f 00             	cmpb   $0x0,(%rdi)
   43c12:	74 10                	je     43c24 <strlen+0x15>
   43c14:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43c19:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   43c1d:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   43c21:	75 f6                	jne    43c19 <strlen+0xa>
   43c23:	c3                   	retq   
   43c24:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43c29:	c3                   	retq   

0000000000043c2a <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   43c2a:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43c2d:	ba 00 00 00 00       	mov    $0x0,%edx
   43c32:	48 85 f6             	test   %rsi,%rsi
   43c35:	74 11                	je     43c48 <strnlen+0x1e>
   43c37:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   43c3b:	74 0c                	je     43c49 <strnlen+0x1f>
        ++n;
   43c3d:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43c41:	48 39 d0             	cmp    %rdx,%rax
   43c44:	75 f1                	jne    43c37 <strnlen+0xd>
   43c46:	eb 04                	jmp    43c4c <strnlen+0x22>
   43c48:	c3                   	retq   
   43c49:	48 89 d0             	mov    %rdx,%rax
}
   43c4c:	c3                   	retq   

0000000000043c4d <strcpy>:
char* strcpy(char* dst, const char* src) {
   43c4d:	48 89 f8             	mov    %rdi,%rax
   43c50:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   43c55:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   43c59:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   43c5c:	48 83 c2 01          	add    $0x1,%rdx
   43c60:	84 c9                	test   %cl,%cl
   43c62:	75 f1                	jne    43c55 <strcpy+0x8>
}
   43c64:	c3                   	retq   

0000000000043c65 <strcmp>:
    while (*a && *b && *a == *b) {
   43c65:	0f b6 07             	movzbl (%rdi),%eax
   43c68:	84 c0                	test   %al,%al
   43c6a:	74 1a                	je     43c86 <strcmp+0x21>
   43c6c:	0f b6 16             	movzbl (%rsi),%edx
   43c6f:	38 c2                	cmp    %al,%dl
   43c71:	75 13                	jne    43c86 <strcmp+0x21>
   43c73:	84 d2                	test   %dl,%dl
   43c75:	74 0f                	je     43c86 <strcmp+0x21>
        ++a, ++b;
   43c77:	48 83 c7 01          	add    $0x1,%rdi
   43c7b:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   43c7f:	0f b6 07             	movzbl (%rdi),%eax
   43c82:	84 c0                	test   %al,%al
   43c84:	75 e6                	jne    43c6c <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   43c86:	3a 06                	cmp    (%rsi),%al
   43c88:	0f 97 c0             	seta   %al
   43c8b:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   43c8e:	83 d8 00             	sbb    $0x0,%eax
}
   43c91:	c3                   	retq   

0000000000043c92 <strchr>:
    while (*s && *s != (char) c) {
   43c92:	0f b6 07             	movzbl (%rdi),%eax
   43c95:	84 c0                	test   %al,%al
   43c97:	74 10                	je     43ca9 <strchr+0x17>
   43c99:	40 38 f0             	cmp    %sil,%al
   43c9c:	74 18                	je     43cb6 <strchr+0x24>
        ++s;
   43c9e:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   43ca2:	0f b6 07             	movzbl (%rdi),%eax
   43ca5:	84 c0                	test   %al,%al
   43ca7:	75 f0                	jne    43c99 <strchr+0x7>
        return NULL;
   43ca9:	40 84 f6             	test   %sil,%sil
   43cac:	b8 00 00 00 00       	mov    $0x0,%eax
   43cb1:	48 0f 44 c7          	cmove  %rdi,%rax
}
   43cb5:	c3                   	retq   
   43cb6:	48 89 f8             	mov    %rdi,%rax
   43cb9:	c3                   	retq   

0000000000043cba <rand>:
    if (!rand_seed_set) {
   43cba:	83 3d 43 43 01 00 00 	cmpl   $0x0,0x14343(%rip)        # 58004 <rand_seed_set>
   43cc1:	74 1b                	je     43cde <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43cc3:	69 05 33 43 01 00 0d 	imul   $0x19660d,0x14333(%rip),%eax        # 58000 <rand_seed>
   43cca:	66 19 00 
   43ccd:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43cd2:	89 05 28 43 01 00    	mov    %eax,0x14328(%rip)        # 58000 <rand_seed>
    return rand_seed & RAND_MAX;
   43cd8:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   43cdd:	c3                   	retq   
    rand_seed = seed;
   43cde:	c7 05 18 43 01 00 9e 	movl   $0x30d4879e,0x14318(%rip)        # 58000 <rand_seed>
   43ce5:	87 d4 30 
    rand_seed_set = 1;
   43ce8:	c7 05 12 43 01 00 01 	movl   $0x1,0x14312(%rip)        # 58004 <rand_seed_set>
   43cef:	00 00 00 
}
   43cf2:	eb cf                	jmp    43cc3 <rand+0x9>

0000000000043cf4 <srand>:
    rand_seed = seed;
   43cf4:	89 3d 06 43 01 00    	mov    %edi,0x14306(%rip)        # 58000 <rand_seed>
    rand_seed_set = 1;
   43cfa:	c7 05 00 43 01 00 01 	movl   $0x1,0x14300(%rip)        # 58004 <rand_seed_set>
   43d01:	00 00 00 
}
   43d04:	c3                   	retq   

0000000000043d05 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43d05:	55                   	push   %rbp
   43d06:	48 89 e5             	mov    %rsp,%rbp
   43d09:	41 57                	push   %r15
   43d0b:	41 56                	push   %r14
   43d0d:	41 55                	push   %r13
   43d0f:	41 54                	push   %r12
   43d11:	53                   	push   %rbx
   43d12:	48 83 ec 58          	sub    $0x58,%rsp
   43d16:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   43d1a:	0f b6 02             	movzbl (%rdx),%eax
   43d1d:	84 c0                	test   %al,%al
   43d1f:	0f 84 b0 06 00 00    	je     443d5 <printer_vprintf+0x6d0>
   43d25:	49 89 fe             	mov    %rdi,%r14
   43d28:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   43d2b:	41 89 f7             	mov    %esi,%r15d
   43d2e:	e9 a4 04 00 00       	jmpq   441d7 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   43d33:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   43d38:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   43d3e:	45 84 e4             	test   %r12b,%r12b
   43d41:	0f 84 82 06 00 00    	je     443c9 <printer_vprintf+0x6c4>
        int flags = 0;
   43d47:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   43d4d:	41 0f be f4          	movsbl %r12b,%esi
   43d51:	bf d1 51 04 00       	mov    $0x451d1,%edi
   43d56:	e8 37 ff ff ff       	callq  43c92 <strchr>
   43d5b:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   43d5e:	48 85 c0             	test   %rax,%rax
   43d61:	74 55                	je     43db8 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   43d63:	48 81 e9 d1 51 04 00 	sub    $0x451d1,%rcx
   43d6a:	b8 01 00 00 00       	mov    $0x1,%eax
   43d6f:	d3 e0                	shl    %cl,%eax
   43d71:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43d74:	48 83 c3 01          	add    $0x1,%rbx
   43d78:	44 0f b6 23          	movzbl (%rbx),%r12d
   43d7c:	45 84 e4             	test   %r12b,%r12b
   43d7f:	75 cc                	jne    43d4d <printer_vprintf+0x48>
   43d81:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   43d85:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   43d8b:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   43d92:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   43d95:	0f 84 a9 00 00 00    	je     43e44 <printer_vprintf+0x13f>
        int length = 0;
   43d9b:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   43da0:	0f b6 13             	movzbl (%rbx),%edx
   43da3:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43da6:	3c 37                	cmp    $0x37,%al
   43da8:	0f 87 c4 04 00 00    	ja     44272 <printer_vprintf+0x56d>
   43dae:	0f b6 c0             	movzbl %al,%eax
   43db1:	ff 24 c5 e0 4f 04 00 	jmpq   *0x44fe0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   43db8:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   43dbc:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   43dc1:	3c 08                	cmp    $0x8,%al
   43dc3:	77 2f                	ja     43df4 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43dc5:	0f b6 03             	movzbl (%rbx),%eax
   43dc8:	8d 50 d0             	lea    -0x30(%rax),%edx
   43dcb:	80 fa 09             	cmp    $0x9,%dl
   43dce:	77 5e                	ja     43e2e <printer_vprintf+0x129>
   43dd0:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43dd6:	48 83 c3 01          	add    $0x1,%rbx
   43dda:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   43ddf:	0f be c0             	movsbl %al,%eax
   43de2:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43de7:	0f b6 03             	movzbl (%rbx),%eax
   43dea:	8d 50 d0             	lea    -0x30(%rax),%edx
   43ded:	80 fa 09             	cmp    $0x9,%dl
   43df0:	76 e4                	jbe    43dd6 <printer_vprintf+0xd1>
   43df2:	eb 97                	jmp    43d8b <printer_vprintf+0x86>
        } else if (*format == '*') {
   43df4:	41 80 fc 2a          	cmp    $0x2a,%r12b
   43df8:	75 3f                	jne    43e39 <printer_vprintf+0x134>
            width = va_arg(val, int);
   43dfa:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43dfe:	8b 07                	mov    (%rdi),%eax
   43e00:	83 f8 2f             	cmp    $0x2f,%eax
   43e03:	77 17                	ja     43e1c <printer_vprintf+0x117>
   43e05:	89 c2                	mov    %eax,%edx
   43e07:	48 03 57 10          	add    0x10(%rdi),%rdx
   43e0b:	83 c0 08             	add    $0x8,%eax
   43e0e:	89 07                	mov    %eax,(%rdi)
   43e10:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43e13:	48 83 c3 01          	add    $0x1,%rbx
   43e17:	e9 6f ff ff ff       	jmpq   43d8b <printer_vprintf+0x86>
            width = va_arg(val, int);
   43e1c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43e20:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43e24:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43e28:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43e2c:	eb e2                	jmp    43e10 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43e2e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43e34:	e9 52 ff ff ff       	jmpq   43d8b <printer_vprintf+0x86>
        int width = -1;
   43e39:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   43e3f:	e9 47 ff ff ff       	jmpq   43d8b <printer_vprintf+0x86>
            ++format;
   43e44:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   43e48:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   43e4c:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43e4f:	80 f9 09             	cmp    $0x9,%cl
   43e52:	76 13                	jbe    43e67 <printer_vprintf+0x162>
            } else if (*format == '*') {
   43e54:	3c 2a                	cmp    $0x2a,%al
   43e56:	74 33                	je     43e8b <printer_vprintf+0x186>
            ++format;
   43e58:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   43e5b:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   43e62:	e9 34 ff ff ff       	jmpq   43d9b <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43e67:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   43e6c:	48 83 c2 01          	add    $0x1,%rdx
   43e70:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43e73:	0f be c0             	movsbl %al,%eax
   43e76:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43e7a:	0f b6 02             	movzbl (%rdx),%eax
   43e7d:	8d 70 d0             	lea    -0x30(%rax),%esi
   43e80:	40 80 fe 09          	cmp    $0x9,%sil
   43e84:	76 e6                	jbe    43e6c <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   43e86:	48 89 d3             	mov    %rdx,%rbx
   43e89:	eb 1c                	jmp    43ea7 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   43e8b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43e8f:	8b 07                	mov    (%rdi),%eax
   43e91:	83 f8 2f             	cmp    $0x2f,%eax
   43e94:	77 23                	ja     43eb9 <printer_vprintf+0x1b4>
   43e96:	89 c2                	mov    %eax,%edx
   43e98:	48 03 57 10          	add    0x10(%rdi),%rdx
   43e9c:	83 c0 08             	add    $0x8,%eax
   43e9f:	89 07                	mov    %eax,(%rdi)
   43ea1:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43ea3:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   43ea7:	85 c9                	test   %ecx,%ecx
   43ea9:	b8 00 00 00 00       	mov    $0x0,%eax
   43eae:	0f 49 c1             	cmovns %ecx,%eax
   43eb1:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43eb4:	e9 e2 fe ff ff       	jmpq   43d9b <printer_vprintf+0x96>
                precision = va_arg(val, int);
   43eb9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ebd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43ec1:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43ec5:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43ec9:	eb d6                	jmp    43ea1 <printer_vprintf+0x19c>
        switch (*format) {
   43ecb:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43ed0:	e9 f3 00 00 00       	jmpq   43fc8 <printer_vprintf+0x2c3>
            ++format;
   43ed5:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   43ed9:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   43ede:	e9 bd fe ff ff       	jmpq   43da0 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43ee3:	85 c9                	test   %ecx,%ecx
   43ee5:	74 55                	je     43f3c <printer_vprintf+0x237>
   43ee7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43eeb:	8b 07                	mov    (%rdi),%eax
   43eed:	83 f8 2f             	cmp    $0x2f,%eax
   43ef0:	77 38                	ja     43f2a <printer_vprintf+0x225>
   43ef2:	89 c2                	mov    %eax,%edx
   43ef4:	48 03 57 10          	add    0x10(%rdi),%rdx
   43ef8:	83 c0 08             	add    $0x8,%eax
   43efb:	89 07                	mov    %eax,(%rdi)
   43efd:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43f00:	48 89 d0             	mov    %rdx,%rax
   43f03:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43f07:	49 89 d0             	mov    %rdx,%r8
   43f0a:	49 f7 d8             	neg    %r8
   43f0d:	25 80 00 00 00       	and    $0x80,%eax
   43f12:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43f16:	0b 45 a8             	or     -0x58(%rbp),%eax
   43f19:	83 c8 60             	or     $0x60,%eax
   43f1c:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   43f1f:	41 bc cf 4f 04 00    	mov    $0x44fcf,%r12d
            break;
   43f25:	e9 35 01 00 00       	jmpq   4405f <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43f2a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f2e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f32:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f36:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f3a:	eb c1                	jmp    43efd <printer_vprintf+0x1f8>
   43f3c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f40:	8b 07                	mov    (%rdi),%eax
   43f42:	83 f8 2f             	cmp    $0x2f,%eax
   43f45:	77 10                	ja     43f57 <printer_vprintf+0x252>
   43f47:	89 c2                	mov    %eax,%edx
   43f49:	48 03 57 10          	add    0x10(%rdi),%rdx
   43f4d:	83 c0 08             	add    $0x8,%eax
   43f50:	89 07                	mov    %eax,(%rdi)
   43f52:	48 63 12             	movslq (%rdx),%rdx
   43f55:	eb a9                	jmp    43f00 <printer_vprintf+0x1fb>
   43f57:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f5b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43f5f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f63:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43f67:	eb e9                	jmp    43f52 <printer_vprintf+0x24d>
        int base = 10;
   43f69:	be 0a 00 00 00       	mov    $0xa,%esi
   43f6e:	eb 58                	jmp    43fc8 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43f70:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f74:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f78:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f7c:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f80:	eb 60                	jmp    43fe2 <printer_vprintf+0x2dd>
   43f82:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f86:	8b 07                	mov    (%rdi),%eax
   43f88:	83 f8 2f             	cmp    $0x2f,%eax
   43f8b:	77 10                	ja     43f9d <printer_vprintf+0x298>
   43f8d:	89 c2                	mov    %eax,%edx
   43f8f:	48 03 57 10          	add    0x10(%rdi),%rdx
   43f93:	83 c0 08             	add    $0x8,%eax
   43f96:	89 07                	mov    %eax,(%rdi)
   43f98:	44 8b 02             	mov    (%rdx),%r8d
   43f9b:	eb 48                	jmp    43fe5 <printer_vprintf+0x2e0>
   43f9d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43fa1:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43fa5:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43fa9:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43fad:	eb e9                	jmp    43f98 <printer_vprintf+0x293>
   43faf:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43fb2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   43fb9:	bf c0 51 04 00       	mov    $0x451c0,%edi
   43fbe:	e9 e2 02 00 00       	jmpq   442a5 <printer_vprintf+0x5a0>
            base = 16;
   43fc3:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43fc8:	85 c9                	test   %ecx,%ecx
   43fca:	74 b6                	je     43f82 <printer_vprintf+0x27d>
   43fcc:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43fd0:	8b 01                	mov    (%rcx),%eax
   43fd2:	83 f8 2f             	cmp    $0x2f,%eax
   43fd5:	77 99                	ja     43f70 <printer_vprintf+0x26b>
   43fd7:	89 c2                	mov    %eax,%edx
   43fd9:	48 03 51 10          	add    0x10(%rcx),%rdx
   43fdd:	83 c0 08             	add    $0x8,%eax
   43fe0:	89 01                	mov    %eax,(%rcx)
   43fe2:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43fe5:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   43fe9:	85 f6                	test   %esi,%esi
   43feb:	79 c2                	jns    43faf <printer_vprintf+0x2aa>
        base = -base;
   43fed:	41 89 f1             	mov    %esi,%r9d
   43ff0:	f7 de                	neg    %esi
   43ff2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   43ff9:	bf a0 51 04 00       	mov    $0x451a0,%edi
   43ffe:	e9 a2 02 00 00       	jmpq   442a5 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   44003:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44007:	8b 07                	mov    (%rdi),%eax
   44009:	83 f8 2f             	cmp    $0x2f,%eax
   4400c:	77 1c                	ja     4402a <printer_vprintf+0x325>
   4400e:	89 c2                	mov    %eax,%edx
   44010:	48 03 57 10          	add    0x10(%rdi),%rdx
   44014:	83 c0 08             	add    $0x8,%eax
   44017:	89 07                	mov    %eax,(%rdi)
   44019:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   4401c:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   44023:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   44028:	eb c3                	jmp    43fed <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   4402a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4402e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44032:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44036:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4403a:	eb dd                	jmp    44019 <printer_vprintf+0x314>
            data = va_arg(val, char*);
   4403c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44040:	8b 01                	mov    (%rcx),%eax
   44042:	83 f8 2f             	cmp    $0x2f,%eax
   44045:	0f 87 a5 01 00 00    	ja     441f0 <printer_vprintf+0x4eb>
   4404b:	89 c2                	mov    %eax,%edx
   4404d:	48 03 51 10          	add    0x10(%rcx),%rdx
   44051:	83 c0 08             	add    $0x8,%eax
   44054:	89 01                	mov    %eax,(%rcx)
   44056:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   44059:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   4405f:	8b 45 a8             	mov    -0x58(%rbp),%eax
   44062:	83 e0 20             	and    $0x20,%eax
   44065:	89 45 8c             	mov    %eax,-0x74(%rbp)
   44068:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   4406e:	0f 85 21 02 00 00    	jne    44295 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   44074:	8b 45 a8             	mov    -0x58(%rbp),%eax
   44077:	89 45 88             	mov    %eax,-0x78(%rbp)
   4407a:	83 e0 60             	and    $0x60,%eax
   4407d:	83 f8 60             	cmp    $0x60,%eax
   44080:	0f 84 54 02 00 00    	je     442da <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44086:	8b 45 a8             	mov    -0x58(%rbp),%eax
   44089:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   4408c:	48 c7 45 a0 cf 4f 04 	movq   $0x44fcf,-0x60(%rbp)
   44093:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44094:	83 f8 21             	cmp    $0x21,%eax
   44097:	0f 84 79 02 00 00    	je     44316 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   4409d:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   440a0:	89 f8                	mov    %edi,%eax
   440a2:	f7 d0                	not    %eax
   440a4:	c1 e8 1f             	shr    $0x1f,%eax
   440a7:	89 45 84             	mov    %eax,-0x7c(%rbp)
   440aa:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   440ae:	0f 85 9e 02 00 00    	jne    44352 <printer_vprintf+0x64d>
   440b4:	84 c0                	test   %al,%al
   440b6:	0f 84 96 02 00 00    	je     44352 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   440bc:	48 63 f7             	movslq %edi,%rsi
   440bf:	4c 89 e7             	mov    %r12,%rdi
   440c2:	e8 63 fb ff ff       	callq  43c2a <strnlen>
   440c7:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   440ca:	8b 45 88             	mov    -0x78(%rbp),%eax
   440cd:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   440d0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   440d7:	83 f8 22             	cmp    $0x22,%eax
   440da:	0f 84 aa 02 00 00    	je     4438a <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   440e0:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   440e4:	e8 26 fb ff ff       	callq  43c0f <strlen>
   440e9:	8b 55 9c             	mov    -0x64(%rbp),%edx
   440ec:	03 55 98             	add    -0x68(%rbp),%edx
   440ef:	44 89 e9             	mov    %r13d,%ecx
   440f2:	29 d1                	sub    %edx,%ecx
   440f4:	29 c1                	sub    %eax,%ecx
   440f6:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   440f9:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   440fc:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   44100:	75 2d                	jne    4412f <printer_vprintf+0x42a>
   44102:	85 c9                	test   %ecx,%ecx
   44104:	7e 29                	jle    4412f <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   44106:	44 89 fa             	mov    %r15d,%edx
   44109:	be 20 00 00 00       	mov    $0x20,%esi
   4410e:	4c 89 f7             	mov    %r14,%rdi
   44111:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44114:	41 83 ed 01          	sub    $0x1,%r13d
   44118:	45 85 ed             	test   %r13d,%r13d
   4411b:	7f e9                	jg     44106 <printer_vprintf+0x401>
   4411d:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   44120:	85 ff                	test   %edi,%edi
   44122:	b8 01 00 00 00       	mov    $0x1,%eax
   44127:	0f 4f c7             	cmovg  %edi,%eax
   4412a:	29 c7                	sub    %eax,%edi
   4412c:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   4412f:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   44133:	0f b6 07             	movzbl (%rdi),%eax
   44136:	84 c0                	test   %al,%al
   44138:	74 22                	je     4415c <printer_vprintf+0x457>
   4413a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4413e:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   44141:	0f b6 f0             	movzbl %al,%esi
   44144:	44 89 fa             	mov    %r15d,%edx
   44147:	4c 89 f7             	mov    %r14,%rdi
   4414a:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   4414d:	48 83 c3 01          	add    $0x1,%rbx
   44151:	0f b6 03             	movzbl (%rbx),%eax
   44154:	84 c0                	test   %al,%al
   44156:	75 e9                	jne    44141 <printer_vprintf+0x43c>
   44158:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   4415c:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4415f:	85 c0                	test   %eax,%eax
   44161:	7e 1d                	jle    44180 <printer_vprintf+0x47b>
   44163:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44167:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   44169:	44 89 fa             	mov    %r15d,%edx
   4416c:	be 30 00 00 00       	mov    $0x30,%esi
   44171:	4c 89 f7             	mov    %r14,%rdi
   44174:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   44177:	83 eb 01             	sub    $0x1,%ebx
   4417a:	75 ed                	jne    44169 <printer_vprintf+0x464>
   4417c:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   44180:	8b 45 98             	mov    -0x68(%rbp),%eax
   44183:	85 c0                	test   %eax,%eax
   44185:	7e 27                	jle    441ae <printer_vprintf+0x4a9>
   44187:	89 c0                	mov    %eax,%eax
   44189:	4c 01 e0             	add    %r12,%rax
   4418c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44190:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   44193:	41 0f b6 34 24       	movzbl (%r12),%esi
   44198:	44 89 fa             	mov    %r15d,%edx
   4419b:	4c 89 f7             	mov    %r14,%rdi
   4419e:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   441a1:	49 83 c4 01          	add    $0x1,%r12
   441a5:	49 39 dc             	cmp    %rbx,%r12
   441a8:	75 e9                	jne    44193 <printer_vprintf+0x48e>
   441aa:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   441ae:	45 85 ed             	test   %r13d,%r13d
   441b1:	7e 14                	jle    441c7 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   441b3:	44 89 fa             	mov    %r15d,%edx
   441b6:	be 20 00 00 00       	mov    $0x20,%esi
   441bb:	4c 89 f7             	mov    %r14,%rdi
   441be:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   441c1:	41 83 ed 01          	sub    $0x1,%r13d
   441c5:	75 ec                	jne    441b3 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   441c7:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   441cb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   441cf:	84 c0                	test   %al,%al
   441d1:	0f 84 fe 01 00 00    	je     443d5 <printer_vprintf+0x6d0>
        if (*format != '%') {
   441d7:	3c 25                	cmp    $0x25,%al
   441d9:	0f 84 54 fb ff ff    	je     43d33 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   441df:	0f b6 f0             	movzbl %al,%esi
   441e2:	44 89 fa             	mov    %r15d,%edx
   441e5:	4c 89 f7             	mov    %r14,%rdi
   441e8:	41 ff 16             	callq  *(%r14)
            continue;
   441eb:	4c 89 e3             	mov    %r12,%rbx
   441ee:	eb d7                	jmp    441c7 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   441f0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   441f4:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   441f8:	48 8d 42 08          	lea    0x8(%rdx),%rax
   441fc:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44200:	e9 51 fe ff ff       	jmpq   44056 <printer_vprintf+0x351>
            color = va_arg(val, int);
   44205:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44209:	8b 07                	mov    (%rdi),%eax
   4420b:	83 f8 2f             	cmp    $0x2f,%eax
   4420e:	77 10                	ja     44220 <printer_vprintf+0x51b>
   44210:	89 c2                	mov    %eax,%edx
   44212:	48 03 57 10          	add    0x10(%rdi),%rdx
   44216:	83 c0 08             	add    $0x8,%eax
   44219:	89 07                	mov    %eax,(%rdi)
   4421b:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   4421e:	eb a7                	jmp    441c7 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   44220:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44224:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44228:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4422c:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44230:	eb e9                	jmp    4421b <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   44232:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44236:	8b 01                	mov    (%rcx),%eax
   44238:	83 f8 2f             	cmp    $0x2f,%eax
   4423b:	77 23                	ja     44260 <printer_vprintf+0x55b>
   4423d:	89 c2                	mov    %eax,%edx
   4423f:	48 03 51 10          	add    0x10(%rcx),%rdx
   44243:	83 c0 08             	add    $0x8,%eax
   44246:	89 01                	mov    %eax,(%rcx)
   44248:	8b 02                	mov    (%rdx),%eax
   4424a:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   4424d:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   44251:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   44255:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   4425b:	e9 ff fd ff ff       	jmpq   4405f <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   44260:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44264:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44268:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4426c:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44270:	eb d6                	jmp    44248 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   44272:	84 d2                	test   %dl,%dl
   44274:	0f 85 39 01 00 00    	jne    443b3 <printer_vprintf+0x6ae>
   4427a:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   4427e:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   44282:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   44286:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   4428a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   44290:	e9 ca fd ff ff       	jmpq   4405f <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   44295:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   4429b:	bf c0 51 04 00       	mov    $0x451c0,%edi
        if (flags & FLAG_NUMERIC) {
   442a0:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   442a5:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   442a9:	4c 89 c1             	mov    %r8,%rcx
   442ac:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   442b0:	48 63 f6             	movslq %esi,%rsi
   442b3:	49 83 ec 01          	sub    $0x1,%r12
   442b7:	48 89 c8             	mov    %rcx,%rax
   442ba:	ba 00 00 00 00       	mov    $0x0,%edx
   442bf:	48 f7 f6             	div    %rsi
   442c2:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   442c6:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   442ca:	48 89 ca             	mov    %rcx,%rdx
   442cd:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   442d0:	48 39 d6             	cmp    %rdx,%rsi
   442d3:	76 de                	jbe    442b3 <printer_vprintf+0x5ae>
   442d5:	e9 9a fd ff ff       	jmpq   44074 <printer_vprintf+0x36f>
                prefix = "-";
   442da:	48 c7 45 a0 cc 4f 04 	movq   $0x44fcc,-0x60(%rbp)
   442e1:	00 
            if (flags & FLAG_NEGATIVE) {
   442e2:	8b 45 a8             	mov    -0x58(%rbp),%eax
   442e5:	a8 80                	test   $0x80,%al
   442e7:	0f 85 b0 fd ff ff    	jne    4409d <printer_vprintf+0x398>
                prefix = "+";
   442ed:	48 c7 45 a0 c7 4f 04 	movq   $0x44fc7,-0x60(%rbp)
   442f4:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   442f5:	a8 10                	test   $0x10,%al
   442f7:	0f 85 a0 fd ff ff    	jne    4409d <printer_vprintf+0x398>
                prefix = " ";
   442fd:	a8 08                	test   $0x8,%al
   442ff:	ba cf 4f 04 00       	mov    $0x44fcf,%edx
   44304:	b8 ce 4f 04 00       	mov    $0x44fce,%eax
   44309:	48 0f 44 c2          	cmove  %rdx,%rax
   4430d:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   44311:	e9 87 fd ff ff       	jmpq   4409d <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   44316:	41 8d 41 10          	lea    0x10(%r9),%eax
   4431a:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   4431f:	0f 85 78 fd ff ff    	jne    4409d <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   44325:	4d 85 c0             	test   %r8,%r8
   44328:	75 0d                	jne    44337 <printer_vprintf+0x632>
   4432a:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   44331:	0f 84 66 fd ff ff    	je     4409d <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   44337:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   4433b:	ba d0 4f 04 00       	mov    $0x44fd0,%edx
   44340:	b8 c9 4f 04 00       	mov    $0x44fc9,%eax
   44345:	48 0f 44 c2          	cmove  %rdx,%rax
   44349:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   4434d:	e9 4b fd ff ff       	jmpq   4409d <printer_vprintf+0x398>
            len = strlen(data);
   44352:	4c 89 e7             	mov    %r12,%rdi
   44355:	e8 b5 f8 ff ff       	callq  43c0f <strlen>
   4435a:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   4435d:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   44361:	0f 84 63 fd ff ff    	je     440ca <printer_vprintf+0x3c5>
   44367:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   4436b:	0f 84 59 fd ff ff    	je     440ca <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   44371:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   44374:	89 ca                	mov    %ecx,%edx
   44376:	29 c2                	sub    %eax,%edx
   44378:	39 c1                	cmp    %eax,%ecx
   4437a:	b8 00 00 00 00       	mov    $0x0,%eax
   4437f:	0f 4e d0             	cmovle %eax,%edx
   44382:	89 55 9c             	mov    %edx,-0x64(%rbp)
   44385:	e9 56 fd ff ff       	jmpq   440e0 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   4438a:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   4438e:	e8 7c f8 ff ff       	callq  43c0f <strlen>
   44393:	8b 7d 98             	mov    -0x68(%rbp),%edi
   44396:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   44399:	44 89 e9             	mov    %r13d,%ecx
   4439c:	29 f9                	sub    %edi,%ecx
   4439e:	29 c1                	sub    %eax,%ecx
   443a0:	44 39 ea             	cmp    %r13d,%edx
   443a3:	b8 00 00 00 00       	mov    $0x0,%eax
   443a8:	0f 4d c8             	cmovge %eax,%ecx
   443ab:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   443ae:	e9 2d fd ff ff       	jmpq   440e0 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   443b3:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   443b6:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   443ba:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   443be:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   443c4:	e9 96 fc ff ff       	jmpq   4405f <printer_vprintf+0x35a>
        int flags = 0;
   443c9:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   443d0:	e9 b0 f9 ff ff       	jmpq   43d85 <printer_vprintf+0x80>
}
   443d5:	48 83 c4 58          	add    $0x58,%rsp
   443d9:	5b                   	pop    %rbx
   443da:	41 5c                	pop    %r12
   443dc:	41 5d                	pop    %r13
   443de:	41 5e                	pop    %r14
   443e0:	41 5f                	pop    %r15
   443e2:	5d                   	pop    %rbp
   443e3:	c3                   	retq   

00000000000443e4 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   443e4:	55                   	push   %rbp
   443e5:	48 89 e5             	mov    %rsp,%rbp
   443e8:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   443ec:	48 c7 45 f0 ef 3a 04 	movq   $0x43aef,-0x10(%rbp)
   443f3:	00 
        cpos = 0;
   443f4:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   443fa:	b8 00 00 00 00       	mov    $0x0,%eax
   443ff:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   44402:	48 63 ff             	movslq %edi,%rdi
   44405:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   4440c:	00 
   4440d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   44411:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   44415:	e8 eb f8 ff ff       	callq  43d05 <printer_vprintf>
    return cp.cursor - console;
   4441a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4441e:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   44424:	48 d1 f8             	sar    %rax
}
   44427:	c9                   	leaveq 
   44428:	c3                   	retq   

0000000000044429 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   44429:	55                   	push   %rbp
   4442a:	48 89 e5             	mov    %rsp,%rbp
   4442d:	48 83 ec 50          	sub    $0x50,%rsp
   44431:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44435:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44439:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   4443d:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44444:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44448:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4444c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44450:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   44454:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44458:	e8 87 ff ff ff       	callq  443e4 <console_vprintf>
}
   4445d:	c9                   	leaveq 
   4445e:	c3                   	retq   

000000000004445f <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   4445f:	55                   	push   %rbp
   44460:	48 89 e5             	mov    %rsp,%rbp
   44463:	53                   	push   %rbx
   44464:	48 83 ec 28          	sub    $0x28,%rsp
   44468:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   4446b:	48 c7 45 d8 75 3b 04 	movq   $0x43b75,-0x28(%rbp)
   44472:	00 
    sp.s = s;
   44473:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   44477:	48 85 f6             	test   %rsi,%rsi
   4447a:	75 0b                	jne    44487 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   4447c:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4447f:	29 d8                	sub    %ebx,%eax
}
   44481:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   44485:	c9                   	leaveq 
   44486:	c3                   	retq   
        sp.end = s + size - 1;
   44487:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   4448c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   44490:	be 00 00 00 00       	mov    $0x0,%esi
   44495:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   44499:	e8 67 f8 ff ff       	callq  43d05 <printer_vprintf>
        *sp.s = 0;
   4449e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   444a2:	c6 00 00             	movb   $0x0,(%rax)
   444a5:	eb d5                	jmp    4447c <vsnprintf+0x1d>

00000000000444a7 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   444a7:	55                   	push   %rbp
   444a8:	48 89 e5             	mov    %rsp,%rbp
   444ab:	48 83 ec 50          	sub    $0x50,%rsp
   444af:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   444b3:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   444b7:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   444bb:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   444c2:	48 8d 45 10          	lea    0x10(%rbp),%rax
   444c6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   444ca:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   444ce:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   444d2:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   444d6:	e8 84 ff ff ff       	callq  4445f <vsnprintf>
    va_end(val);
    return n;
}
   444db:	c9                   	leaveq 
   444dc:	c3                   	retq   

00000000000444dd <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   444dd:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   444e2:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   444e7:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   444ec:	48 83 c0 02          	add    $0x2,%rax
   444f0:	48 39 d0             	cmp    %rdx,%rax
   444f3:	75 f2                	jne    444e7 <console_clear+0xa>
    }
    cursorpos = 0;
   444f5:	c7 05 fd 4a 07 00 00 	movl   $0x0,0x74afd(%rip)        # b8ffc <cursorpos>
   444fc:	00 00 00 
}
   444ff:	c3                   	retq   
