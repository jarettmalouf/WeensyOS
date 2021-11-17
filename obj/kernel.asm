
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
   40028:	e9 ee 01 00 00       	jmpq   4021b <kernel>
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
   400be:	e8 4a 0b 00 00       	callq  40c0d <exception>

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

000000000004019b <free_pt>:

void free_pt(x86_64_pagetable *pt) {
   4019b:	55                   	push   %rbp
   4019c:	48 89 e5             	mov    %rsp,%rbp
   4019f:	48 83 ec 38          	sub    $0x38,%rsp
   401a3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    x86_64_pagetable *l1 = pt;
   401a7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   401ab:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pagetable *l2 = (x86_64_pagetable *) l1->entry[0];
   401af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   401b3:	48 8b 00             	mov    (%rax),%rax
   401b6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    x86_64_pagetable *l3 = (x86_64_pagetable *) l2->entry[0];
   401ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   401be:	48 8b 00             	mov    (%rax),%rax
   401c1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    x86_64_pagetable *l4i = (x86_64_pagetable *) l3->entry[0];
   401c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   401c9:	48 8b 00             	mov    (%rax),%rax
   401cc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    x86_64_pagetable *l4j = (x86_64_pagetable *) l3->entry[1];
   401d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   401d4:	48 8b 40 08          	mov    0x8(%rax),%rax
   401d8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    free_page((uintptr_t) l1);
   401dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   401e0:	48 89 c7             	mov    %rax,%rdi
   401e3:	e8 7f ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l2);
   401e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   401ec:	48 89 c7             	mov    %rax,%rdi
   401ef:	e8 73 ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l3);
   401f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   401f8:	48 89 c7             	mov    %rax,%rdi
   401fb:	e8 67 ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l4i);
   40200:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40204:	48 89 c7             	mov    %rax,%rdi
   40207:	e8 5b ff ff ff       	callq  40167 <free_page>
    free_page((uintptr_t) l4j);
   4020c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40210:	48 89 c7             	mov    %rax,%rdi
   40213:	e8 4f ff ff ff       	callq  40167 <free_page>
}
   40218:	90                   	nop
   40219:	c9                   	leaveq 
   4021a:	c3                   	retq   

000000000004021b <kernel>:

void kernel(const char* command) {
   4021b:	55                   	push   %rbp
   4021c:	48 89 e5             	mov    %rsp,%rbp
   4021f:	48 83 ec 20          	sub    $0x20,%rsp
   40223:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   40227:	e8 0d 1b 00 00       	callq  41d39 <hardware_init>
    pageinfo_init();
   4022c:	e8 b5 11 00 00       	callq  413e6 <pageinfo_init>
    console_clear();
   40231:	e8 69 3f 00 00       	callq  4419f <console_clear>
    timer_init(HZ);
   40236:	bf 64 00 00 00       	mov    $0x64,%edi
   4023b:	e8 e9 1f 00 00       	callq  42229 <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   40240:	48 8b 05 b9 0d 01 00 	mov    0x10db9(%rip),%rax        # 51000 <kernel_pagetable>
   40247:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   4024d:	b9 00 00 10 00       	mov    $0x100000,%ecx
   40252:	ba 00 00 00 00       	mov    $0x0,%edx
   40257:	be 00 00 00 00       	mov    $0x0,%esi
   4025c:	48 89 c7             	mov    %rax,%rdi
   4025f:	e8 13 2d 00 00       	callq  42f77 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40264:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   40269:	be 00 80 0b 00       	mov    $0xb8000,%esi
   4026e:	48 8b 05 8b 0d 01 00 	mov    0x10d8b(%rip),%rax        # 51000 <kernel_pagetable>
   40275:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4027b:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40280:	48 89 c7             	mov    %rax,%rdi
   40283:	e8 ef 2c 00 00       	callq  42f77 <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40288:	ba 00 0e 00 00       	mov    $0xe00,%edx
   4028d:	be 00 00 00 00       	mov    $0x0,%esi
   40292:	bf 20 e0 04 00       	mov    $0x4e020,%edi
   40297:	e8 1a 36 00 00       	callq  438b6 <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   4029c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   402a3:	eb 44                	jmp    402e9 <kernel+0xce>
        processes[i].p_pid = i;
   402a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402a8:	48 63 d0             	movslq %eax,%rdx
   402ab:	48 89 d0             	mov    %rdx,%rax
   402ae:	48 c1 e0 03          	shl    $0x3,%rax
   402b2:	48 29 d0             	sub    %rdx,%rax
   402b5:	48 c1 e0 05          	shl    $0x5,%rax
   402b9:	48 8d 90 20 e0 04 00 	lea    0x4e020(%rax),%rdx
   402c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402c3:	89 02                	mov    %eax,(%rdx)
        processes[i].p_state = P_FREE;
   402c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   402c8:	48 63 d0             	movslq %eax,%rdx
   402cb:	48 89 d0             	mov    %rdx,%rax
   402ce:	48 c1 e0 03          	shl    $0x3,%rax
   402d2:	48 29 d0             	sub    %rdx,%rax
   402d5:	48 c1 e0 05          	shl    $0x5,%rax
   402d9:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   402df:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    for (pid_t i = 0; i < NPROC; i++) {
   402e5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   402e9:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   402ed:	7e b6                	jle    402a5 <kernel+0x8a>
    }

    if (command && strcmp(command, "fork") == 0) {
   402ef:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402f4:	74 29                	je     4031f <kernel+0x104>
   402f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402fa:	be e0 41 04 00       	mov    $0x441e0,%esi
   402ff:	48 89 c7             	mov    %rax,%rdi
   40302:	e8 20 36 00 00       	callq  43927 <strcmp>
   40307:	85 c0                	test   %eax,%eax
   40309:	75 14                	jne    4031f <kernel+0x104>
        process_setup(1, 4);
   4030b:	be 04 00 00 00       	mov    $0x4,%esi
   40310:	bf 01 00 00 00       	mov    $0x1,%edi
   40315:	e8 85 04 00 00       	callq  4079f <process_setup>
   4031a:	e9 c2 00 00 00       	jmpq   403e1 <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   4031f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40324:	74 29                	je     4034f <kernel+0x134>
   40326:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4032a:	be e5 41 04 00       	mov    $0x441e5,%esi
   4032f:	48 89 c7             	mov    %rax,%rdi
   40332:	e8 f0 35 00 00       	callq  43927 <strcmp>
   40337:	85 c0                	test   %eax,%eax
   40339:	75 14                	jne    4034f <kernel+0x134>
        process_setup(1, 5);
   4033b:	be 05 00 00 00       	mov    $0x5,%esi
   40340:	bf 01 00 00 00       	mov    $0x1,%edi
   40345:	e8 55 04 00 00       	callq  4079f <process_setup>
   4034a:	e9 92 00 00 00       	jmpq   403e1 <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   4034f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40354:	74 26                	je     4037c <kernel+0x161>
   40356:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4035a:	be ee 41 04 00       	mov    $0x441ee,%esi
   4035f:	48 89 c7             	mov    %rax,%rdi
   40362:	e8 c0 35 00 00       	callq  43927 <strcmp>
   40367:	85 c0                	test   %eax,%eax
   40369:	75 11                	jne    4037c <kernel+0x161>
        process_setup(1, 6);
   4036b:	be 06 00 00 00       	mov    $0x6,%esi
   40370:	bf 01 00 00 00       	mov    $0x1,%edi
   40375:	e8 25 04 00 00       	callq  4079f <process_setup>
   4037a:	eb 65                	jmp    403e1 <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   4037c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40381:	74 39                	je     403bc <kernel+0x1a1>
   40383:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40387:	be f3 41 04 00       	mov    $0x441f3,%esi
   4038c:	48 89 c7             	mov    %rax,%rdi
   4038f:	e8 93 35 00 00       	callq  43927 <strcmp>
   40394:	85 c0                	test   %eax,%eax
   40396:	75 24                	jne    403bc <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   40398:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   4039f:	eb 13                	jmp    403b4 <kernel+0x199>
            process_setup(i, 6);
   403a1:	8b 45 f8             	mov    -0x8(%rbp),%eax
   403a4:	be 06 00 00 00       	mov    $0x6,%esi
   403a9:	89 c7                	mov    %eax,%edi
   403ab:	e8 ef 03 00 00       	callq  4079f <process_setup>
        for (pid_t i = 1; i <= 2; ++i) {
   403b0:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   403b4:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   403b8:	7e e7                	jle    403a1 <kernel+0x186>
   403ba:	eb 25                	jmp    403e1 <kernel+0x1c6>
        }
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   403bc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   403c3:	eb 16                	jmp    403db <kernel+0x1c0>
            process_setup(i, i - 1);
   403c5:	8b 45 f4             	mov    -0xc(%rbp),%eax
   403c8:	8d 50 ff             	lea    -0x1(%rax),%edx
   403cb:	8b 45 f4             	mov    -0xc(%rbp),%eax
   403ce:	89 d6                	mov    %edx,%esi
   403d0:	89 c7                	mov    %eax,%edi
   403d2:	e8 c8 03 00 00       	callq  4079f <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   403d7:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   403db:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   403df:	7e e4                	jle    403c5 <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   403e1:	bf 00 e1 04 00       	mov    $0x4e100,%edi
   403e6:	e8 9e 0f 00 00       	callq  41389 <run>

00000000000403eb <get_free_page_number>:
}

int get_free_page_number() {
   403eb:	55                   	push   %rbp
   403ec:	48 89 e5             	mov    %rsp,%rbp
   403ef:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   403f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   403fa:	eb 1a                	jmp    40416 <get_free_page_number+0x2b>
        if (pageinfo[i].owner == PO_FREE) return i;
   403fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403ff:	48 98                	cltq   
   40401:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   40408:	00 
   40409:	84 c0                	test   %al,%al
   4040b:	75 05                	jne    40412 <get_free_page_number+0x27>
   4040d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40410:	eb 12                	jmp    40424 <get_free_page_number+0x39>
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++) {
   40412:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40416:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   4041d:	7e dd                	jle    403fc <get_free_page_number+0x11>
    }
    return -1;
   4041f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40424:	c9                   	leaveq 
   40425:	c3                   	retq   

0000000000040426 <copy_kernel_mapping>:

void copy_kernel_mapping(x86_64_pagetable *pt) {
   40426:	55                   	push   %rbp
   40427:	48 89 e5             	mov    %rsp,%rbp
   4042a:	48 83 ec 30          	sub    $0x30,%rsp
   4042e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   40432:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40439:	eb 44                	jmp    4047f <copy_kernel_mapping+0x59>
        vamapping map = virtual_memory_lookup(kernel_pagetable, va);
   4043b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4043e:	48 63 d0             	movslq %eax,%rdx
   40441:	48 8b 0d b8 0b 01 00 	mov    0x10bb8(%rip),%rcx        # 51000 <kernel_pagetable>
   40448:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   4044c:	48 89 ce             	mov    %rcx,%rsi
   4044f:	48 89 c7             	mov    %rax,%rdi
   40452:	e8 db 2e 00 00       	callq  43332 <virtual_memory_lookup>
        virtual_memory_map(pt, va, map.pa, PAGESIZE, map.perm);
   40457:	8b 4d f0             	mov    -0x10(%rbp),%ecx
   4045a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4045e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40461:	48 63 f0             	movslq %eax,%rsi
   40464:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40468:	41 89 c8             	mov    %ecx,%r8d
   4046b:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40470:	48 89 c7             	mov    %rax,%rdi
   40473:	e8 ff 2a 00 00       	callq  42f77 <virtual_memory_map>
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   40478:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
   4047f:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%rbp)
   40486:	7e b3                	jle    4043b <copy_kernel_mapping+0x15>
    }
}
   40488:	90                   	nop
   40489:	90                   	nop
   4048a:	c9                   	leaveq 
   4048b:	c3                   	retq   

000000000004048c <alloc_pt>:

x86_64_pagetable *alloc_pt(pid_t pid) {
   4048c:	55                   	push   %rbp
   4048d:	48 89 e5             	mov    %rsp,%rbp
   40490:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   40494:	89 7d 8c             	mov    %edi,-0x74(%rbp)
    size_t sz_pt = sizeof(struct x86_64_pagetable);
   40497:	48 c7 45 f8 00 10 00 	movq   $0x1000,-0x8(%rbp)
   4049e:	00 
    int i = 5;
   4049f:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%rbp)

// L1
    int page_number = get_free_page_number();
   404a6:	b8 00 00 00 00       	mov    $0x0,%eax
   404ab:	e8 3b ff ff ff       	callq  403eb <get_free_page_number>
   404b0:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) return NULL;
   404b3:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   404b7:	75 0a                	jne    404c3 <alloc_pt+0x37>
   404b9:	b8 00 00 00 00       	mov    $0x0,%eax
   404be:	e9 da 02 00 00       	jmpq   4079d <alloc_pt+0x311>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   404c3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   404c6:	48 98                	cltq   
   404c8:	48 c1 e0 0c          	shl    $0xc,%rax
   404cc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   404d0:	8b 45 8c             	mov    -0x74(%rbp),%eax
   404d3:	0f be d0             	movsbl %al,%edx
   404d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   404da:	89 d6                	mov    %edx,%esi
   404dc:	48 89 c7             	mov    %rax,%rdi
   404df:	e8 8e 04 00 00       	callq  40972 <assign_physical_page>
   404e4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   404e7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   404eb:	75 0a                	jne    404f7 <alloc_pt+0x6b>
   404ed:	b8 00 00 00 00       	mov    $0x0,%eax
   404f2:	e9 a6 02 00 00       	jmpq   4079d <alloc_pt+0x311>

    memset((void *) l1_addr, 0, sz_pt);
   404f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   404fb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   404ff:	be 00 00 00 00       	mov    $0x0,%esi
   40504:	48 89 c7             	mov    %rax,%rdi
   40507:	e8 aa 33 00 00       	callq  438b6 <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   4050c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40510:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    
// L2
    page_number = get_free_page_number();
   40514:	b8 00 00 00 00       	mov    $0x0,%eax
   40519:	e8 cd fe ff ff       	callq  403eb <get_free_page_number>
   4051e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40521:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40525:	75 16                	jne    4053d <alloc_pt+0xb1>
        free_page(l1_addr);
   40527:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4052b:	48 89 c7             	mov    %rax,%rdi
   4052e:	e8 34 fc ff ff       	callq  40167 <free_page>
        return NULL;
   40533:	b8 00 00 00 00       	mov    $0x0,%eax
   40538:	e9 60 02 00 00       	jmpq   4079d <alloc_pt+0x311>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   4053d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40540:	48 98                	cltq   
   40542:	48 c1 e0 0c          	shl    $0xc,%rax
   40546:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

    page_result = assign_physical_page(l2_addr, pid);
   4054a:	8b 45 8c             	mov    -0x74(%rbp),%eax
   4054d:	0f be d0             	movsbl %al,%edx
   40550:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40554:	89 d6                	mov    %edx,%esi
   40556:	48 89 c7             	mov    %rax,%rdi
   40559:	e8 14 04 00 00       	callq  40972 <assign_physical_page>
   4055e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40561:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40565:	75 0a                	jne    40571 <alloc_pt+0xe5>
   40567:	b8 00 00 00 00       	mov    $0x0,%eax
   4056c:	e9 2c 02 00 00       	jmpq   4079d <alloc_pt+0x311>

    memset((void *) l2_addr, 0, sz_pt);
   40571:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40575:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40579:	be 00 00 00 00       	mov    $0x0,%esi
   4057e:	48 89 c7             	mov    %rax,%rdi
   40581:	e8 30 33 00 00       	callq  438b6 <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   40586:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4058a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

// L3
    page_number = get_free_page_number();
   4058e:	b8 00 00 00 00       	mov    $0x0,%eax
   40593:	e8 53 fe ff ff       	callq  403eb <get_free_page_number>
   40598:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   4059b:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   4059f:	75 22                	jne    405c3 <alloc_pt+0x137>
        free_page(l1_addr); free_page(l2_addr);
   405a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   405a5:	48 89 c7             	mov    %rax,%rdi
   405a8:	e8 ba fb ff ff       	callq  40167 <free_page>
   405ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405b1:	48 89 c7             	mov    %rax,%rdi
   405b4:	e8 ae fb ff ff       	callq  40167 <free_page>
        return NULL;
   405b9:	b8 00 00 00 00       	mov    $0x0,%eax
   405be:	e9 da 01 00 00       	jmpq   4079d <alloc_pt+0x311>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   405c3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   405c6:	48 98                	cltq   
   405c8:	48 c1 e0 0c          	shl    $0xc,%rax
   405cc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    page_result = assign_physical_page(l3_addr, pid);
   405d0:	8b 45 8c             	mov    -0x74(%rbp),%eax
   405d3:	0f be d0             	movsbl %al,%edx
   405d6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   405da:	89 d6                	mov    %edx,%esi
   405dc:	48 89 c7             	mov    %rax,%rdi
   405df:	e8 8e 03 00 00       	callq  40972 <assign_physical_page>
   405e4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   405e7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   405eb:	75 0a                	jne    405f7 <alloc_pt+0x16b>
   405ed:	b8 00 00 00 00       	mov    $0x0,%eax
   405f2:	e9 a6 01 00 00       	jmpq   4079d <alloc_pt+0x311>

    memset((void *) l3_addr, 0, sz_pt);
   405f7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   405fb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   405ff:	be 00 00 00 00       	mov    $0x0,%esi
   40604:	48 89 c7             	mov    %rax,%rdi
   40607:	e8 aa 32 00 00       	callq  438b6 <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   4060c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40610:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

// L4i
    page_number = get_free_page_number();
   40614:	b8 00 00 00 00       	mov    $0x0,%eax
   40619:	e8 cd fd ff ff       	callq  403eb <get_free_page_number>
   4061e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   40621:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40625:	75 2e                	jne    40655 <alloc_pt+0x1c9>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr);
   40627:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4062b:	48 89 c7             	mov    %rax,%rdi
   4062e:	e8 34 fb ff ff       	callq  40167 <free_page>
   40633:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40637:	48 89 c7             	mov    %rax,%rdi
   4063a:	e8 28 fb ff ff       	callq  40167 <free_page>
   4063f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40643:	48 89 c7             	mov    %rax,%rdi
   40646:	e8 1c fb ff ff       	callq  40167 <free_page>
        return NULL;
   4064b:	b8 00 00 00 00       	mov    $0x0,%eax
   40650:	e9 48 01 00 00       	jmpq   4079d <alloc_pt+0x311>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   40655:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40658:	48 98                	cltq   
   4065a:	48 c1 e0 0c          	shl    $0xc,%rax
   4065e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

    page_result = assign_physical_page(l4i_addr, pid);
   40662:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40665:	0f be d0             	movsbl %al,%edx
   40668:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4066c:	89 d6                	mov    %edx,%esi
   4066e:	48 89 c7             	mov    %rax,%rdi
   40671:	e8 fc 02 00 00       	callq  40972 <assign_physical_page>
   40676:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40679:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4067d:	75 0a                	jne    40689 <alloc_pt+0x1fd>
   4067f:	b8 00 00 00 00       	mov    $0x0,%eax
   40684:	e9 14 01 00 00       	jmpq   4079d <alloc_pt+0x311>

    memset((void *) l4i_addr, 0, sz_pt);
   40689:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4068d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40691:	be 00 00 00 00       	mov    $0x0,%esi
   40696:	48 89 c7             	mov    %rax,%rdi
   40699:	e8 18 32 00 00       	callq  438b6 <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   4069e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406a2:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

// L4j
    page_number = get_free_page_number();
   406a6:	b8 00 00 00 00       	mov    $0x0,%eax
   406ab:	e8 3b fd ff ff       	callq  403eb <get_free_page_number>
   406b0:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (page_number == -1) {
   406b3:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   406b7:	75 3a                	jne    406f3 <alloc_pt+0x267>
        free_page(l1_addr); free_page(l2_addr); free_page(l3_addr); free_page(l4i_addr);
   406b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406bd:	48 89 c7             	mov    %rax,%rdi
   406c0:	e8 a2 fa ff ff       	callq  40167 <free_page>
   406c5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   406c9:	48 89 c7             	mov    %rax,%rdi
   406cc:	e8 96 fa ff ff       	callq  40167 <free_page>
   406d1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   406d5:	48 89 c7             	mov    %rax,%rdi
   406d8:	e8 8a fa ff ff       	callq  40167 <free_page>
   406dd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   406e1:	48 89 c7             	mov    %rax,%rdi
   406e4:	e8 7e fa ff ff       	callq  40167 <free_page>
        return NULL;
   406e9:	b8 00 00 00 00       	mov    $0x0,%eax
   406ee:	e9 aa 00 00 00       	jmpq   4079d <alloc_pt+0x311>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   406f3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   406f6:	48 98                	cltq   
   406f8:	48 c1 e0 0c          	shl    $0xc,%rax
   406fc:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

    page_result = assign_physical_page(l4j_addr, pid);
   40700:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40703:	0f be d0             	movsbl %al,%edx
   40706:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4070a:	89 d6                	mov    %edx,%esi
   4070c:	48 89 c7             	mov    %rax,%rdi
   4070f:	e8 5e 02 00 00       	callq  40972 <assign_physical_page>
   40714:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (page_result == -1) return NULL;
   40717:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   4071b:	75 07                	jne    40724 <alloc_pt+0x298>
   4071d:	b8 00 00 00 00       	mov    $0x0,%eax
   40722:	eb 79                	jmp    4079d <alloc_pt+0x311>

    memset((void *) l4j_addr, 0, sz_pt);
   40724:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40728:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4072c:	be 00 00 00 00       	mov    $0x0,%esi
   40731:	48 89 c7             	mov    %rax,%rdi
   40734:	e8 7d 31 00 00       	callq  438b6 <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   40739:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4073d:	48 89 45 98          	mov    %rax,-0x68(%rbp)

// Linking

    int perm = PTE_U | PTE_P | PTE_W;
   40741:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%rbp)

    l1->entry[0] = (x86_64_pageentry_t) l2 | perm;
   40748:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4074b:	48 63 d0             	movslq %eax,%rdx
   4074e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40752:	48 09 c2             	or     %rax,%rdx
   40755:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40759:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = (x86_64_pageentry_t) l3 | perm;
   4075c:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4075f:	48 63 d0             	movslq %eax,%rdx
   40762:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40766:	48 09 c2             	or     %rax,%rdx
   40769:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4076d:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = (x86_64_pageentry_t) l4i | perm;
   40770:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40773:	48 63 d0             	movslq %eax,%rdx
   40776:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4077a:	48 09 c2             	or     %rax,%rdx
   4077d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40781:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = (x86_64_pageentry_t) l4j | perm;
   40784:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40787:	48 63 d0             	movslq %eax,%rdx
   4078a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4078e:	48 09 c2             	or     %rax,%rdx
   40791:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40795:	48 89 50 08          	mov    %rdx,0x8(%rax)

    return l1;
   40799:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
}
   4079d:	c9                   	leaveq 
   4079e:	c3                   	retq   

000000000004079f <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   4079f:	55                   	push   %rbp
   407a0:	48 89 e5             	mov    %rsp,%rbp
   407a3:	48 83 ec 40          	sub    $0x40,%rsp
   407a7:	89 7d cc             	mov    %edi,-0x34(%rbp)
   407aa:	89 75 c8             	mov    %esi,-0x38(%rbp)
    process_init(&processes[pid], 0);
   407ad:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407b0:	48 63 d0             	movslq %eax,%rdx
   407b3:	48 89 d0             	mov    %rdx,%rax
   407b6:	48 c1 e0 03          	shl    $0x3,%rax
   407ba:	48 29 d0             	sub    %rdx,%rax
   407bd:	48 c1 e0 05          	shl    $0x5,%rax
   407c1:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   407c7:	be 00 00 00 00       	mov    $0x0,%esi
   407cc:	48 89 c7             	mov    %rax,%rdi
   407cf:	e8 e7 1c 00 00       	callq  424bb <process_init>

    x86_64_pagetable *pt = alloc_pt(pid);
   407d4:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407d7:	89 c7                	mov    %eax,%edi
   407d9:	e8 ae fc ff ff       	callq  4048c <alloc_pt>
   407de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   407e2:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   407e7:	0f 84 82 01 00 00    	je     4096f <process_setup+0x1d0>

    processes[pid].p_pagetable = pt;
   407ed:	8b 45 cc             	mov    -0x34(%rbp),%eax
   407f0:	48 63 d0             	movslq %eax,%rdx
   407f3:	48 89 d0             	mov    %rdx,%rax
   407f6:	48 c1 e0 03          	shl    $0x3,%rax
   407fa:	48 29 d0             	sub    %rdx,%rax
   407fd:	48 c1 e0 05          	shl    $0x5,%rax
   40801:	48 8d 90 f0 e0 04 00 	lea    0x4e0f0(%rax),%rdx
   40808:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4080c:	48 89 02             	mov    %rax,(%rdx)
    copy_kernel_mapping(pt);
   4080f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40813:	48 89 c7             	mov    %rax,%rdi
   40816:	e8 0b fc ff ff       	callq  40426 <copy_kernel_mapping>
    int r = program_load(&processes[pid], program_number, NULL);
   4081b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4081e:	48 63 d0             	movslq %eax,%rdx
   40821:	48 89 d0             	mov    %rdx,%rax
   40824:	48 c1 e0 03          	shl    $0x3,%rax
   40828:	48 29 d0             	sub    %rdx,%rax
   4082b:	48 c1 e0 05          	shl    $0x5,%rax
   4082f:	48 8d 88 20 e0 04 00 	lea    0x4e020(%rax),%rcx
   40836:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40839:	ba 00 00 00 00       	mov    $0x0,%edx
   4083e:	89 c6                	mov    %eax,%esi
   40840:	48 89 cf             	mov    %rcx,%rdi
   40843:	e8 e1 2b 00 00       	callq  43429 <program_load>
   40848:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   4084b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   4084f:	79 14                	jns    40865 <process_setup+0xc6>
   40851:	ba f9 41 04 00       	mov    $0x441f9,%edx
   40856:	be 06 01 00 00       	mov    $0x106,%esi
   4085b:	bf 00 42 04 00       	mov    $0x44200,%edi
   40860:	e8 13 24 00 00       	callq  42c78 <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   40865:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40868:	48 63 d0             	movslq %eax,%rdx
   4086b:	48 89 d0             	mov    %rdx,%rax
   4086e:	48 c1 e0 03          	shl    $0x3,%rax
   40872:	48 29 d0             	sub    %rdx,%rax
   40875:	48 c1 e0 05          	shl    $0x5,%rax
   40879:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   4087f:	48 c7 00 00 00 30 00 	movq   $0x300000,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40886:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40889:	48 63 d0             	movslq %eax,%rdx
   4088c:	48 89 d0             	mov    %rdx,%rax
   4088f:	48 c1 e0 03          	shl    $0x3,%rax
   40893:	48 29 d0             	sub    %rdx,%rax
   40896:	48 c1 e0 05          	shl    $0x5,%rax
   4089a:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   408a0:	48 8b 00             	mov    (%rax),%rax
   408a3:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   408a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

    int stack_page_number = get_free_page_number();
   408ad:	b8 00 00 00 00       	mov    $0x0,%eax
   408b2:	e8 34 fb ff ff       	callq  403eb <get_free_page_number>
   408b7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (stack_page_number == -1) {
   408ba:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   408be:	75 11                	jne    408d1 <process_setup+0x132>
        free_pt(pt);
   408c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408c4:	48 89 c7             	mov    %rax,%rdi
   408c7:	e8 cf f8 ff ff       	callq  4019b <free_pt>
        return;
   408cc:	e9 9f 00 00 00       	jmpq   40970 <process_setup+0x1d1>
    }
    uintptr_t stack_addr = PAGEADDRESS(stack_page_number);
   408d1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   408d4:	48 98                	cltq   
   408d6:	48 c1 e0 0c          	shl    $0xc,%rax
   408da:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int assign_status = assign_physical_page(stack_addr, pid);
   408de:	8b 45 cc             	mov    -0x34(%rbp),%eax
   408e1:	0f be d0             	movsbl %al,%edx
   408e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   408e8:	89 d6                	mov    %edx,%esi
   408ea:	48 89 c7             	mov    %rax,%rdi
   408ed:	e8 80 00 00 00       	callq  40972 <assign_physical_page>
   408f2:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (assign_status == -1) {
   408f5:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   408f9:	75 1a                	jne    40915 <process_setup+0x176>
        free_pt(pt); free_page(stack_addr);
   408fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408ff:	48 89 c7             	mov    %rax,%rdi
   40902:	e8 94 f8 ff ff       	callq  4019b <free_pt>
   40907:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4090b:	48 89 c7             	mov    %rax,%rdi
   4090e:	e8 54 f8 ff ff       	callq  40167 <free_page>
        return;
   40913:	eb 5b                	jmp    40970 <process_setup+0x1d1>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_addr,
   40915:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40918:	48 63 d0             	movslq %eax,%rdx
   4091b:	48 89 d0             	mov    %rdx,%rax
   4091e:	48 c1 e0 03          	shl    $0x3,%rax
   40922:	48 29 d0             	sub    %rdx,%rax
   40925:	48 c1 e0 05          	shl    $0x5,%rax
   40929:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4092f:	48 8b 00             	mov    (%rax),%rax
   40932:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40936:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   4093a:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40940:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40945:	48 89 c7             	mov    %rax,%rdi
   40948:	e8 2a 26 00 00       	callq  42f77 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   4094d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40950:	48 63 d0             	movslq %eax,%rdx
   40953:	48 89 d0             	mov    %rdx,%rax
   40956:	48 c1 e0 03          	shl    $0x3,%rax
   4095a:	48 29 d0             	sub    %rdx,%rax
   4095d:	48 c1 e0 05          	shl    $0x5,%rax
   40961:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40967:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   4096d:	eb 01                	jmp    40970 <process_setup+0x1d1>
    if (pt == NULL) return;
   4096f:	90                   	nop
}
   40970:	c9                   	leaveq 
   40971:	c3                   	retq   

0000000000040972 <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   40972:	55                   	push   %rbp
   40973:	48 89 e5             	mov    %rsp,%rbp
   40976:	48 83 ec 10          	sub    $0x10,%rsp
   4097a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4097e:	89 f0                	mov    %esi,%eax
   40980:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   40983:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40987:	25 ff 0f 00 00       	and    $0xfff,%eax
   4098c:	48 85 c0             	test   %rax,%rax
   4098f:	75 20                	jne    409b1 <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   40991:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40998:	00 
   40999:	77 16                	ja     409b1 <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   4099b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4099f:	48 c1 e8 0c          	shr    $0xc,%rax
   409a3:	48 98                	cltq   
   409a5:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   409ac:	00 
   409ad:	84 c0                	test   %al,%al
   409af:	74 07                	je     409b8 <assign_physical_page+0x46>
        return -1;
   409b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   409b6:	eb 2c                	jmp    409e4 <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   409b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409bc:	48 c1 e8 0c          	shr    $0xc,%rax
   409c0:	48 98                	cltq   
   409c2:	c6 84 00 41 ee 04 00 	movb   $0x1,0x4ee41(%rax,%rax,1)
   409c9:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   409ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409ce:	48 c1 e8 0c          	shr    $0xc,%rax
   409d2:	48 98                	cltq   
   409d4:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   409d8:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        return 0;
   409df:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   409e4:	c9                   	leaveq 
   409e5:	c3                   	retq   

00000000000409e6 <syscall_mapping>:

void syscall_mapping(proc* p){
   409e6:	55                   	push   %rbp
   409e7:	48 89 e5             	mov    %rsp,%rbp
   409ea:	48 83 ec 70          	sub    $0x70,%rsp
   409ee:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   409f2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   409f6:	48 8b 40 38          	mov    0x38(%rax),%rax
   409fa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   409fe:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a02:	48 8b 40 30          	mov    0x30(%rax),%rax
   40a06:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40a0a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a0e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a15:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40a19:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40a1d:	48 89 ce             	mov    %rcx,%rsi
   40a20:	48 89 c7             	mov    %rax,%rdi
   40a23:	e8 0a 29 00 00       	callq  43332 <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   40a28:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40a2b:	48 98                	cltq   
   40a2d:	83 e0 06             	and    $0x6,%eax
   40a30:	48 83 f8 06          	cmp    $0x6,%rax
   40a34:	75 73                	jne    40aa9 <syscall_mapping+0xc3>
	return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   40a36:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40a3a:	48 83 c0 17          	add    $0x17,%rax
   40a3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40a42:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a46:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a4d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40a51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40a55:	48 89 ce             	mov    %rcx,%rsi
   40a58:	48 89 c7             	mov    %rax,%rdi
   40a5b:	e8 d2 28 00 00       	callq  43332 <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   40a60:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40a63:	48 98                	cltq   
   40a65:	83 e0 03             	and    $0x3,%eax
   40a68:	48 83 f8 03          	cmp    $0x3,%rax
   40a6c:	75 3e                	jne    40aac <syscall_mapping+0xc6>
	return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40a6e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a72:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a79:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a7d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40a81:	48 89 ce             	mov    %rcx,%rsi
   40a84:	48 89 c7             	mov    %rax,%rdi
   40a87:	e8 a6 28 00 00       	callq  43332 <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40a8c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40a90:	48 89 c1             	mov    %rax,%rcx
   40a93:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a97:	ba 18 00 00 00       	mov    $0x18,%edx
   40a9c:	48 89 c6             	mov    %rax,%rsi
   40a9f:	48 89 cf             	mov    %rcx,%rdi
   40aa2:	e8 a6 2d 00 00       	callq  4384d <memcpy>
   40aa7:	eb 04                	jmp    40aad <syscall_mapping+0xc7>
	return;
   40aa9:	90                   	nop
   40aaa:	eb 01                	jmp    40aad <syscall_mapping+0xc7>
	return;
   40aac:	90                   	nop
}
   40aad:	c9                   	leaveq 
   40aae:	c3                   	retq   

0000000000040aaf <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40aaf:	55                   	push   %rbp
   40ab0:	48 89 e5             	mov    %rsp,%rbp
   40ab3:	48 83 ec 18          	sub    $0x18,%rsp
   40ab7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40abb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40abf:	48 8b 40 38          	mov    0x38(%rax),%rax
   40ac3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   40ac6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40aca:	75 14                	jne    40ae0 <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   40acc:	0f b6 05 2d 45 00 00 	movzbl 0x452d(%rip),%eax        # 45000 <disp_global>
   40ad3:	84 c0                	test   %al,%al
   40ad5:	0f 94 c0             	sete   %al
   40ad8:	88 05 22 45 00 00    	mov    %al,0x4522(%rip)        # 45000 <disp_global>
   40ade:	eb 36                	jmp    40b16 <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   40ae0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40ae4:	78 2f                	js     40b15 <syscall_mem_tog+0x66>
   40ae6:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40aea:	7f 29                	jg     40b15 <syscall_mem_tog+0x66>
   40aec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40af0:	8b 00                	mov    (%rax),%eax
   40af2:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40af5:	75 1e                	jne    40b15 <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   40af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40afb:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40b02:	84 c0                	test   %al,%al
   40b04:	0f 94 c0             	sete   %al
   40b07:	89 c2                	mov    %eax,%edx
   40b09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b0d:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40b13:	eb 01                	jmp    40b16 <syscall_mem_tog+0x67>
            return;
   40b15:	90                   	nop
    }
}
   40b16:	c9                   	leaveq 
   40b17:	c3                   	retq   

0000000000040b18 <get_free_process_slot>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

int get_free_process_slot() {
   40b18:	55                   	push   %rbp
   40b19:	48 89 e5             	mov    %rsp,%rbp
   40b1c:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 1; i < NPROC; i++) {
   40b20:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40b27:	eb 29                	jmp    40b52 <get_free_process_slot+0x3a>
        if (processes[i].p_state == P_FREE) return i;
   40b29:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40b2c:	48 63 d0             	movslq %eax,%rdx
   40b2f:	48 89 d0             	mov    %rdx,%rax
   40b32:	48 c1 e0 03          	shl    $0x3,%rax
   40b36:	48 29 d0             	sub    %rdx,%rax
   40b39:	48 c1 e0 05          	shl    $0x5,%rax
   40b3d:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40b43:	8b 00                	mov    (%rax),%eax
   40b45:	85 c0                	test   %eax,%eax
   40b47:	75 05                	jne    40b4e <get_free_process_slot+0x36>
   40b49:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40b4c:	eb 0f                	jmp    40b5d <get_free_process_slot+0x45>
    for (int i = 1; i < NPROC; i++) {
   40b4e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40b52:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40b56:	7e d1                	jle    40b29 <get_free_process_slot+0x11>
    }
    return -1;
   40b58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40b5d:	c9                   	leaveq 
   40b5e:	c3                   	retq   

0000000000040b5f <free_child_pages>:

void free_child_pages(int child_pid) {
   40b5f:	55                   	push   %rbp
   40b60:	48 89 e5             	mov    %rsp,%rbp
   40b63:	48 83 ec 18          	sub    $0x18,%rsp
   40b67:	89 7d ec             	mov    %edi,-0x14(%rbp)
    for (uintptr_t va = 0; va < MEMSIZE_PHYSICAL; va += PAGESIZE) {
   40b6a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40b71:	00 
   40b72:	eb 2e                	jmp    40ba2 <free_child_pages+0x43>
        if (pageinfo[PAGENUMBER(va)].owner == child_pid) free_page(va);
   40b74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b78:	48 c1 e8 0c          	shr    $0xc,%rax
   40b7c:	48 98                	cltq   
   40b7e:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   40b85:	00 
   40b86:	0f be c0             	movsbl %al,%eax
   40b89:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   40b8c:	75 0c                	jne    40b9a <free_child_pages+0x3b>
   40b8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b92:	48 89 c7             	mov    %rax,%rdi
   40b95:	e8 cd f5 ff ff       	callq  40167 <free_page>
    for (uintptr_t va = 0; va < MEMSIZE_PHYSICAL; va += PAGESIZE) {
   40b9a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40ba1:	00 
   40ba2:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40ba9:	00 
   40baa:	76 c8                	jbe    40b74 <free_child_pages+0x15>
    }
}
   40bac:	90                   	nop
   40bad:	90                   	nop
   40bae:	c9                   	leaveq 
   40baf:	c3                   	retq   

0000000000040bb0 <copy_registers>:

void copy_registers(int parent_pid, int child_pid) {
   40bb0:	55                   	push   %rbp
   40bb1:	48 89 e5             	mov    %rsp,%rbp
   40bb4:	48 83 ec 08          	sub    $0x8,%rsp
   40bb8:	89 7d fc             	mov    %edi,-0x4(%rbp)
   40bbb:	89 75 f8             	mov    %esi,-0x8(%rbp)

    processes[child_pid].p_registers = processes[parent_pid].p_registers;
   40bbe:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40bc1:	48 63 d0             	movslq %eax,%rdx
   40bc4:	48 89 d0             	mov    %rdx,%rax
   40bc7:	48 c1 e0 03          	shl    $0x3,%rax
   40bcb:	48 29 d0             	sub    %rdx,%rax
   40bce:	48 c1 e0 05          	shl    $0x5,%rax
   40bd2:	48 8d 88 20 e0 04 00 	lea    0x4e020(%rax),%rcx
   40bd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40bdc:	48 63 d0             	movslq %eax,%rdx
   40bdf:	48 89 d0             	mov    %rdx,%rax
   40be2:	48 c1 e0 03          	shl    $0x3,%rax
   40be6:	48 29 d0             	sub    %rdx,%rax
   40be9:	48 c1 e0 05          	shl    $0x5,%rax
   40bed:	48 8d 90 20 e0 04 00 	lea    0x4e020(%rax),%rdx
   40bf4:	48 8d 41 08          	lea    0x8(%rcx),%rax
   40bf8:	48 83 c2 08          	add    $0x8,%rdx
   40bfc:	b9 18 00 00 00       	mov    $0x18,%ecx
   40c01:	48 89 c7             	mov    %rax,%rdi
   40c04:	48 89 d6             	mov    %rdx,%rsi
   40c07:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    // processes[child_pid].p_registers.reg_ss = processes[parent_pid].p_registers.reg_ss;
    // for (int i = 0; i < 3; i++) {
    //     processes[child_pid].p_registers.reg_padding2[i] = processes[parent_pid].p_registers.reg_padding2[i];
    //     processes[child_pid].p_registers.reg_padding3[i] = processes[parent_pid].p_registers.reg_padding3[i];
    // }
}
   40c0a:	90                   	nop
   40c0b:	c9                   	leaveq 
   40c0c:	c3                   	retq   

0000000000040c0d <exception>:

void exception(x86_64_registers* reg) {
   40c0d:	55                   	push   %rbp
   40c0e:	48 89 e5             	mov    %rsp,%rbp
   40c11:	48 81 ec 60 01 00 00 	sub    $0x160,%rsp
   40c18:	48 89 bd a8 fe ff ff 	mov    %rdi,-0x158(%rbp)
    current->p_registers = *reg;
   40c1f:	48 8b 05 da d3 00 00 	mov    0xd3da(%rip),%rax        # 4e000 <current>
   40c26:	48 8b 95 a8 fe ff ff 	mov    -0x158(%rbp),%rdx
   40c2d:	48 83 c0 08          	add    $0x8,%rax
   40c31:	48 89 d6             	mov    %rdx,%rsi
   40c34:	ba 18 00 00 00       	mov    $0x18,%edx
   40c39:	48 89 c7             	mov    %rax,%rdi
   40c3c:	48 89 d1             	mov    %rdx,%rcx
   40c3f:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40c42:	48 8b 05 b7 03 01 00 	mov    0x103b7(%rip),%rax        # 51000 <kernel_pagetable>
   40c49:	48 89 c7             	mov    %rax,%rdi
   40c4c:	e8 f5 21 00 00       	callq  42e46 <set_pagetable>
    console_show_cursor(cursorpos);
   40c51:	8b 05 a5 83 07 00    	mov    0x783a5(%rip),%eax        # b8ffc <cursorpos>
   40c57:	89 c7                	mov    %eax,%edi
   40c59:	e8 1c 19 00 00       	callq  4257a <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40c5e:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   40c65:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40c6c:	48 83 f8 0e          	cmp    $0xe,%rax
   40c70:	74 14                	je     40c86 <exception+0x79>
   40c72:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   40c79:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40c80:	48 83 f8 0d          	cmp    $0xd,%rax
   40c84:	75 16                	jne    40c9c <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40c86:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   40c8d:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40c94:	83 e0 04             	and    $0x4,%eax
   40c97:	48 85 c0             	test   %rax,%rax
   40c9a:	74 1a                	je     40cb6 <exception+0xa9>
    {
        check_virtual_memory();
   40c9c:	e8 dc 0a 00 00       	callq  4177d <check_virtual_memory>
        if(disp_global){
   40ca1:	0f b6 05 58 43 00 00 	movzbl 0x4358(%rip),%eax        # 45000 <disp_global>
   40ca8:	84 c0                	test   %al,%al
   40caa:	74 0a                	je     40cb6 <exception+0xa9>
            memshow_physical();
   40cac:	e8 44 0c 00 00       	callq  418f5 <memshow_physical>
            memshow_virtual_animate();
   40cb1:	e8 6a 0f 00 00       	callq  41c20 <memshow_virtual_animate>
        }
    }
    check_keyboard();
   40cb6:	e8 9c 1d 00 00       	callq  42a57 <check_keyboard>

    // Actually handle the exception.
    switch (reg->reg_intno) {
   40cbb:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   40cc2:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cc9:	48 83 e8 0e          	sub    $0xe,%rax
   40ccd:	48 83 f8 2a          	cmp    $0x2a,%rax
   40cd1:	0f 87 05 06 00 00    	ja     412dc <exception+0x6cf>
   40cd7:	48 8b 04 c5 98 42 04 	mov    0x44298(,%rax,8),%rax
   40cde:	00 
   40cdf:	ff e0                	jmpq   *%rax
    case INT_SYS_FORK:
        int child_pid = get_free_process_slot();
   40ce1:	b8 00 00 00 00       	mov    $0x0,%eax
   40ce6:	e8 2d fe ff ff       	callq  40b18 <get_free_process_slot>
   40ceb:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (child_pid == -1) {
   40cee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   40cf2:	75 14                	jne    40d08 <exception+0xfb>
            current->p_registers.reg_rax = -1; break;
   40cf4:	48 8b 05 05 d3 00 00 	mov    0xd305(%rip),%rax        # 4e000 <current>
   40cfb:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40d02:	ff 
   40d03:	e9 e6 05 00 00       	jmpq   412ee <exception+0x6e1>
        }
        process_init(&processes[child_pid], 0);
   40d08:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40d0b:	48 63 d0             	movslq %eax,%rdx
   40d0e:	48 89 d0             	mov    %rdx,%rax
   40d11:	48 c1 e0 03          	shl    $0x3,%rax
   40d15:	48 29 d0             	sub    %rdx,%rax
   40d18:	48 c1 e0 05          	shl    $0x5,%rax
   40d1c:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   40d22:	be 00 00 00 00       	mov    $0x0,%esi
   40d27:	48 89 c7             	mov    %rax,%rdi
   40d2a:	e8 8c 17 00 00       	callq  424bb <process_init>
        x86_64_pagetable *child_pt = alloc_pt(child_pid);
   40d2f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40d32:	89 c7                	mov    %eax,%edi
   40d34:	e8 53 f7 ff ff       	callq  4048c <alloc_pt>
   40d39:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        vamapping map_;

        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40d3d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40d44:	00 
   40d45:	e9 a6 01 00 00       	jmpq   40ef0 <exception+0x2e3>
            map_ = virtual_memory_lookup(current->p_pagetable, va);
   40d4a:	48 8b 05 af d2 00 00 	mov    0xd2af(%rip),%rax        # 4e000 <current>
   40d51:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40d58:	48 8d 85 68 ff ff ff 	lea    -0x98(%rbp),%rax
   40d5f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40d63:	48 89 ce             	mov    %rcx,%rsi
   40d66:	48 89 c7             	mov    %rax,%rdi
   40d69:	e8 c4 25 00 00       	callq  43332 <virtual_memory_lookup>
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) { 
   40d6e:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
   40d74:	48 98                	cltq   
   40d76:	83 e0 04             	and    $0x4,%eax
   40d79:	48 85 c0             	test   %rax,%rax
   40d7c:	0f 84 10 01 00 00    	je     40e92 <exception+0x285>
   40d82:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   40d87:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40d8b:	0f 84 01 01 00 00    	je     40e92 <exception+0x285>
                int free_page_number = get_free_page_number();
   40d91:	b8 00 00 00 00       	mov    $0x0,%eax
   40d96:	e8 50 f6 ff ff       	callq  403eb <get_free_page_number>
   40d9b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                if (free_page_number == -1) {
   40d9e:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40da2:	75 2a                	jne    40dce <exception+0x1c1>
                    free_child_pages(child_pid);
   40da4:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40da7:	89 c7                	mov    %eax,%edi
   40da9:	e8 b1 fd ff ff       	callq  40b5f <free_child_pages>
                    free_pt(child_pt);
   40dae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40db2:	48 89 c7             	mov    %rax,%rdi
   40db5:	e8 e1 f3 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40dba:	48 8b 05 3f d2 00 00 	mov    0xd23f(%rip),%rax        # 4e000 <current>
   40dc1:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40dc8:	ff 
                    break;
   40dc9:	e9 30 01 00 00       	jmpq   40efe <exception+0x2f1>
                }

                uintptr_t addr = PAGEADDRESS(free_page_number);
   40dce:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40dd1:	48 98                	cltq   
   40dd3:	48 c1 e0 0c          	shl    $0xc,%rax
   40dd7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
                int assign_status = assign_physical_page(addr, child_pid);
   40ddb:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40dde:	0f be d0             	movsbl %al,%edx
   40de1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40de5:	89 d6                	mov    %edx,%esi
   40de7:	48 89 c7             	mov    %rax,%rdi
   40dea:	e8 83 fb ff ff       	callq  40972 <assign_physical_page>
   40def:	89 45 d4             	mov    %eax,-0x2c(%rbp)
                if (assign_status == -1) {
   40df2:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   40df6:	75 2a                	jne    40e22 <exception+0x215>
                    free_child_pages(child_pid);
   40df8:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40dfb:	89 c7                	mov    %eax,%edi
   40dfd:	e8 5d fd ff ff       	callq  40b5f <free_child_pages>
                    free_pt(child_pt);
   40e02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40e06:	48 89 c7             	mov    %rax,%rdi
   40e09:	e8 8d f3 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40e0e:	48 8b 05 eb d1 00 00 	mov    0xd1eb(%rip),%rax        # 4e000 <current>
   40e15:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40e1c:	ff 
                    break;
   40e1d:	e9 dc 00 00 00       	jmpq   40efe <exception+0x2f1>
                }
                memcpy((void *) addr, (void *) map_.pa, PAGESIZE);
   40e22:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
   40e29:	48 89 c1             	mov    %rax,%rcx
   40e2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40e30:	ba 00 10 00 00       	mov    $0x1000,%edx
   40e35:	48 89 ce             	mov    %rcx,%rsi
   40e38:	48 89 c7             	mov    %rax,%rdi
   40e3b:	e8 0d 2a 00 00       	callq  4384d <memcpy>
                int map_status = virtual_memory_map(child_pt, va, addr, PAGESIZE, map_.perm);
   40e40:	8b 8d 78 ff ff ff    	mov    -0x88(%rbp),%ecx
   40e46:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40e4a:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40e52:	41 89 c8             	mov    %ecx,%r8d
   40e55:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40e5a:	48 89 c7             	mov    %rax,%rdi
   40e5d:	e8 15 21 00 00       	callq  42f77 <virtual_memory_map>
   40e62:	89 45 d0             	mov    %eax,-0x30(%rbp)
                if (map_status == -1) {
   40e65:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%rbp)
   40e69:	75 7c                	jne    40ee7 <exception+0x2da>
                    free_child_pages(child_pid);
   40e6b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40e6e:	89 c7                	mov    %eax,%edi
   40e70:	e8 ea fc ff ff       	callq  40b5f <free_child_pages>
                    free_pt(child_pt);
   40e75:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40e79:	48 89 c7             	mov    %rax,%rdi
   40e7c:	e8 1a f3 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40e81:	48 8b 05 78 d1 00 00 	mov    0xd178(%rip),%rax        # 4e000 <current>
   40e88:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40e8f:	ff 
                    break;
   40e90:	eb 6c                	jmp    40efe <exception+0x2f1>
                }
            } else {
                int map_status = virtual_memory_map(child_pt, va, map_.pa, PAGESIZE, map_.perm);
   40e92:	8b 8d 78 ff ff ff    	mov    -0x88(%rbp),%ecx
   40e98:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   40e9f:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40ea3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ea7:	41 89 c8             	mov    %ecx,%r8d
   40eaa:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40eaf:	48 89 c7             	mov    %rax,%rdi
   40eb2:	e8 c0 20 00 00       	callq  42f77 <virtual_memory_map>
   40eb7:	89 45 cc             	mov    %eax,-0x34(%rbp)
                if (map_status == -1) {
   40eba:	83 7d cc ff          	cmpl   $0xffffffff,-0x34(%rbp)
   40ebe:	75 28                	jne    40ee8 <exception+0x2db>
                    free_child_pages(child_pid);
   40ec0:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40ec3:	89 c7                	mov    %eax,%edi
   40ec5:	e8 95 fc ff ff       	callq  40b5f <free_child_pages>
                    free_pt(child_pt);
   40eca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ece:	48 89 c7             	mov    %rax,%rdi
   40ed1:	e8 c5 f2 ff ff       	callq  4019b <free_pt>
                    current->p_registers.reg_rax = -1; 
   40ed6:	48 8b 05 23 d1 00 00 	mov    0xd123(%rip),%rax        # 4e000 <current>
   40edd:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40ee4:	ff 
                    break;
   40ee5:	eb 17                	jmp    40efe <exception+0x2f1>
            if (map_.perm & PTE_U && va != CONSOLE_ADDR) { 
   40ee7:	90                   	nop
        for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40ee8:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40eef:	00 
   40ef0:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   40ef7:	00 
   40ef8:	0f 86 4c fe ff ff    	jbe    40d4a <exception+0x13d>
                }
                // pageinfo[PAGENUMBER(map_.pa)].refcount++; 
            }
        }

        copy_registers(current->p_pid, child_pid);
   40efe:	48 8b 05 fb d0 00 00 	mov    0xd0fb(%rip),%rax        # 4e000 <current>
   40f05:	8b 00                	mov    (%rax),%eax
   40f07:	8b 55 f4             	mov    -0xc(%rbp),%edx
   40f0a:	89 d6                	mov    %edx,%esi
   40f0c:	89 c7                	mov    %eax,%edi
   40f0e:	e8 9d fc ff ff       	callq  40bb0 <copy_registers>
        processes[child_pid].p_pid = child_pid;
   40f13:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f16:	48 63 d0             	movslq %eax,%rdx
   40f19:	48 89 d0             	mov    %rdx,%rax
   40f1c:	48 c1 e0 03          	shl    $0x3,%rax
   40f20:	48 29 d0             	sub    %rdx,%rax
   40f23:	48 c1 e0 05          	shl    $0x5,%rax
   40f27:	48 8d 90 20 e0 04 00 	lea    0x4e020(%rax),%rdx
   40f2e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f31:	89 02                	mov    %eax,(%rdx)
        processes[child_pid].p_pagetable = child_pt;
   40f33:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f36:	48 63 d0             	movslq %eax,%rdx
   40f39:	48 89 d0             	mov    %rdx,%rax
   40f3c:	48 c1 e0 03          	shl    $0x3,%rax
   40f40:	48 29 d0             	sub    %rdx,%rax
   40f43:	48 c1 e0 05          	shl    $0x5,%rax
   40f47:	48 8d 90 f0 e0 04 00 	lea    0x4e0f0(%rax),%rdx
   40f4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40f52:	48 89 02             	mov    %rax,(%rdx)

        processes[child_pid].p_registers.reg_rax = 0;
   40f55:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f58:	48 63 d0             	movslq %eax,%rdx
   40f5b:	48 89 d0             	mov    %rdx,%rax
   40f5e:	48 c1 e0 03          	shl    $0x3,%rax
   40f62:	48 29 d0             	sub    %rdx,%rax
   40f65:	48 c1 e0 05          	shl    $0x5,%rax
   40f69:	48 05 28 e0 04 00    	add    $0x4e028,%rax
   40f6f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        processes[current->p_pid].p_registers.reg_rax = child_pid;
   40f76:	48 8b 05 83 d0 00 00 	mov    0xd083(%rip),%rax        # 4e000 <current>
   40f7d:	8b 00                	mov    (%rax),%eax
   40f7f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   40f82:	48 63 d2             	movslq %edx,%rdx
   40f85:	48 63 c8             	movslq %eax,%rcx
   40f88:	48 89 c8             	mov    %rcx,%rax
   40f8b:	48 c1 e0 03          	shl    $0x3,%rax
   40f8f:	48 29 c8             	sub    %rcx,%rax
   40f92:	48 c1 e0 05          	shl    $0x5,%rax
   40f96:	48 05 28 e0 04 00    	add    $0x4e028,%rax
   40f9c:	48 89 10             	mov    %rdx,(%rax)

        processes[child_pid].p_state = processes[current->p_pid].p_state;
   40f9f:	48 8b 05 5a d0 00 00 	mov    0xd05a(%rip),%rax        # 4e000 <current>
   40fa6:	8b 00                	mov    (%rax),%eax
   40fa8:	48 63 d0             	movslq %eax,%rdx
   40fab:	48 89 d0             	mov    %rdx,%rax
   40fae:	48 c1 e0 03          	shl    $0x3,%rax
   40fb2:	48 29 d0             	sub    %rdx,%rax
   40fb5:	48 c1 e0 05          	shl    $0x5,%rax
   40fb9:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40fbf:	8b 10                	mov    (%rax),%edx
   40fc1:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40fc4:	48 63 c8             	movslq %eax,%rcx
   40fc7:	48 89 c8             	mov    %rcx,%rax
   40fca:	48 c1 e0 03          	shl    $0x3,%rax
   40fce:	48 29 c8             	sub    %rcx,%rax
   40fd1:	48 c1 e0 05          	shl    $0x5,%rax
   40fd5:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40fdb:	89 10                	mov    %edx,(%rax)
        processes[child_pid].display_status = processes[current->p_pid].display_status;
   40fdd:	48 8b 05 1c d0 00 00 	mov    0xd01c(%rip),%rax        # 4e000 <current>
   40fe4:	8b 00                	mov    (%rax),%eax
   40fe6:	48 63 d0             	movslq %eax,%rdx
   40fe9:	48 89 d0             	mov    %rdx,%rax
   40fec:	48 c1 e0 03          	shl    $0x3,%rax
   40ff0:	48 29 d0             	sub    %rdx,%rax
   40ff3:	48 c1 e0 05          	shl    $0x5,%rax
   40ff7:	48 05 f8 e0 04 00    	add    $0x4e0f8,%rax
   40ffd:	0f b6 10             	movzbl (%rax),%edx
   41000:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41003:	48 63 c8             	movslq %eax,%rcx
   41006:	48 89 c8             	mov    %rcx,%rax
   41009:	48 c1 e0 03          	shl    $0x3,%rax
   4100d:	48 29 c8             	sub    %rcx,%rax
   41010:	48 c1 e0 05          	shl    $0x5,%rax
   41014:	48 05 f8 e0 04 00    	add    $0x4e0f8,%rax
   4101a:	88 10                	mov    %dl,(%rax)

        break;
   4101c:	e9 cd 02 00 00       	jmpq   412ee <exception+0x6e1>
        break;
    case INT_SYS_PANIC:
	    // rdi stores pointer for msg string
	    {
		char msg[160];
		uintptr_t addr = current->p_registers.reg_rdi;
   41021:	48 8b 05 d8 cf 00 00 	mov    0xcfd8(%rip),%rax        # 4e000 <current>
   41028:	48 8b 40 38          	mov    0x38(%rax),%rax
   4102c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
		if((void *)addr == NULL)
   41030:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
   41035:	75 0f                	jne    41046 <exception+0x439>
		    panic(NULL);
   41037:	bf 00 00 00 00       	mov    $0x0,%edi
   4103c:	b8 00 00 00 00       	mov    $0x0,%eax
   41041:	e8 52 1b 00 00       	callq  42b98 <panic>
		vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   41046:	48 8b 05 b3 cf 00 00 	mov    0xcfb3(%rip),%rax        # 4e000 <current>
   4104d:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41054:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
   4105b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   4105f:	48 89 ce             	mov    %rcx,%rsi
   41062:	48 89 c7             	mov    %rax,%rdi
   41065:	e8 c8 22 00 00       	callq  43332 <virtual_memory_lookup>
		memcpy(msg, (void *)map.pa, 160);
   4106a:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   41071:	48 89 c1             	mov    %rax,%rcx
   41074:	48 8d 85 b0 fe ff ff 	lea    -0x150(%rbp),%rax
   4107b:	ba a0 00 00 00       	mov    $0xa0,%edx
   41080:	48 89 ce             	mov    %rcx,%rsi
   41083:	48 89 c7             	mov    %rax,%rdi
   41086:	e8 c2 27 00 00       	callq  4384d <memcpy>
		panic(msg);
   4108b:	48 8d 85 b0 fe ff ff 	lea    -0x150(%rbp),%rax
   41092:	48 89 c7             	mov    %rax,%rdi
   41095:	b8 00 00 00 00       	mov    $0x0,%eax
   4109a:	e8 f9 1a 00 00       	callq  42b98 <panic>
	    }
	    panic(NULL);
	    break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   4109f:	48 8b 05 5a cf 00 00 	mov    0xcf5a(%rip),%rax        # 4e000 <current>
   410a6:	8b 10                	mov    (%rax),%edx
   410a8:	48 8b 05 51 cf 00 00 	mov    0xcf51(%rip),%rax        # 4e000 <current>
   410af:	48 63 d2             	movslq %edx,%rdx
   410b2:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   410b6:	e9 33 02 00 00       	jmpq   412ee <exception+0x6e1>

    case INT_SYS_YIELD:
        schedule();
   410bb:	e8 57 02 00 00       	callq  41317 <schedule>
        break;                  /* will not be reached */
   410c0:	e9 29 02 00 00       	jmpq   412ee <exception+0x6e1>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   410c5:	48 8b 05 34 cf 00 00 	mov    0xcf34(%rip),%rax        # 4e000 <current>
   410cc:	48 8b 40 38          	mov    0x38(%rax),%rax
   410d0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        int pn = get_free_page_number();
   410d4:	b8 00 00 00 00       	mov    $0x0,%eax
   410d9:	e8 0d f3 ff ff       	callq  403eb <get_free_page_number>
   410de:	89 45 bc             	mov    %eax,-0x44(%rbp)
        if (pn == -1) {
   410e1:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%rbp)
   410e5:	75 14                	jne    410fb <exception+0x4ee>
            current->p_registers.reg_rax = -1; break;
   410e7:	48 8b 05 12 cf 00 00 	mov    0xcf12(%rip),%rax        # 4e000 <current>
   410ee:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   410f5:	ff 
   410f6:	e9 f3 01 00 00       	jmpq   412ee <exception+0x6e1>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   410fb:	8b 45 bc             	mov    -0x44(%rbp),%eax
   410fe:	48 98                	cltq   
   41100:	48 c1 e0 0c          	shl    $0xc,%rax
   41104:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
        if (addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   41108:	48 81 7d c0 ff ff 0f 	cmpq   $0xfffff,-0x40(%rbp)
   4110f:	00 
   41110:	76 18                	jbe    4112a <exception+0x51d>
   41112:	48 81 7d c0 ff ff 2f 	cmpq   $0x2fffff,-0x40(%rbp)
   41119:	00 
   4111a:	77 0e                	ja     4112a <exception+0x51d>
   4111c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41120:	25 ff 0f 00 00       	and    $0xfff,%eax
   41125:	48 85 c0             	test   %rax,%rax
   41128:	74 14                	je     4113e <exception+0x531>
            current->p_registers.reg_rax = -1; break;
   4112a:	48 8b 05 cf ce 00 00 	mov    0xcecf(%rip),%rax        # 4e000 <current>
   41131:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41138:	ff 
   41139:	e9 b0 01 00 00       	jmpq   412ee <exception+0x6e1>
        }
        
        int r = assign_physical_page(pa, current->p_pid);
   4113e:	48 8b 05 bb ce 00 00 	mov    0xcebb(%rip),%rax        # 4e000 <current>
   41145:	8b 00                	mov    (%rax),%eax
   41147:	0f be d0             	movsbl %al,%edx
   4114a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4114e:	89 d6                	mov    %edx,%esi
   41150:	48 89 c7             	mov    %rax,%rdi
   41153:	e8 1a f8 ff ff       	callq  40972 <assign_physical_page>
   41158:	89 45 ac             	mov    %eax,-0x54(%rbp)
        if (r >= 0) {
   4115b:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   4115f:	78 29                	js     4118a <exception+0x57d>
            virtual_memory_map(current->p_pagetable, addr, pa,
   41161:	48 8b 05 98 ce 00 00 	mov    0xce98(%rip),%rax        # 4e000 <current>
   41168:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   4116f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
   41173:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
   41177:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4117d:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41182:	48 89 c7             	mov    %rax,%rdi
   41185:	e8 ed 1d 00 00       	callq  42f77 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }
        current->p_registers.reg_rax = r;
   4118a:	48 8b 05 6f ce 00 00 	mov    0xce6f(%rip),%rax        # 4e000 <current>
   41191:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41194:	48 63 d2             	movslq %edx,%rdx
   41197:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   4119b:	e9 4e 01 00 00       	jmpq   412ee <exception+0x6e1>
    }

    case INT_SYS_MAPPING:
    {
	    syscall_mapping(current);
   411a0:	48 8b 05 59 ce 00 00 	mov    0xce59(%rip),%rax        # 4e000 <current>
   411a7:	48 89 c7             	mov    %rax,%rdi
   411aa:	e8 37 f8 ff ff       	callq  409e6 <syscall_mapping>
            break;
   411af:	e9 3a 01 00 00       	jmpq   412ee <exception+0x6e1>
    }

    case INT_SYS_MEM_TOG:
	{
	    syscall_mem_tog(current);
   411b4:	48 8b 05 45 ce 00 00 	mov    0xce45(%rip),%rax        # 4e000 <current>
   411bb:	48 89 c7             	mov    %rax,%rdi
   411be:	e8 ec f8 ff ff       	callq  40aaf <syscall_mem_tog>
	    break;
   411c3:	e9 26 01 00 00       	jmpq   412ee <exception+0x6e1>
	}

    case INT_TIMER:
        ++ticks;
   411c8:	8b 05 52 dc 00 00    	mov    0xdc52(%rip),%eax        # 4ee20 <ticks>
   411ce:	83 c0 01             	add    $0x1,%eax
   411d1:	89 05 49 dc 00 00    	mov    %eax,0xdc49(%rip)        # 4ee20 <ticks>
        schedule();
   411d7:	e8 3b 01 00 00       	callq  41317 <schedule>
        break;                  /* will not be reached */
   411dc:	e9 0d 01 00 00       	jmpq   412ee <exception+0x6e1>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   411e1:	0f 20 d0             	mov    %cr2,%rax
   411e4:	48 89 45 80          	mov    %rax,-0x80(%rbp)
    return val;
   411e8:	48 8b 45 80          	mov    -0x80(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   411ec:	48 89 45 98          	mov    %rax,-0x68(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   411f0:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   411f7:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   411fe:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   41201:	48 85 c0             	test   %rax,%rax
   41204:	74 07                	je     4120d <exception+0x600>
   41206:	b8 09 42 04 00       	mov    $0x44209,%eax
   4120b:	eb 05                	jmp    41212 <exception+0x605>
   4120d:	b8 0f 42 04 00       	mov    $0x4420f,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   41212:	48 89 45 90          	mov    %rax,-0x70(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   41216:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   4121d:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41224:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   41227:	48 85 c0             	test   %rax,%rax
   4122a:	74 07                	je     41233 <exception+0x626>
   4122c:	b8 14 42 04 00       	mov    $0x44214,%eax
   41231:	eb 05                	jmp    41238 <exception+0x62b>
   41233:	b8 27 42 04 00       	mov    $0x44227,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   41238:	48 89 45 88          	mov    %rax,-0x78(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   4123c:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   41243:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   4124a:	83 e0 04             	and    $0x4,%eax
   4124d:	48 85 c0             	test   %rax,%rax
   41250:	75 2f                	jne    41281 <exception+0x674>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   41252:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   41259:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   41260:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   41264:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
   41268:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4126c:	49 89 f0             	mov    %rsi,%r8
   4126f:	48 89 c6             	mov    %rax,%rsi
   41272:	bf 38 42 04 00       	mov    $0x44238,%edi
   41277:	b8 00 00 00 00       	mov    $0x0,%eax
   4127c:	e8 17 19 00 00       	callq  42b98 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   41281:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   41288:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   4128f:	48 8b 05 6a cd 00 00 	mov    0xcd6a(%rip),%rax        # 4e000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   41296:	8b 00                	mov    (%rax),%eax
   41298:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
   4129c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   412a0:	52                   	push   %rdx
   412a1:	ff 75 88             	pushq  -0x78(%rbp)
   412a4:	49 89 f1             	mov    %rsi,%r9
   412a7:	49 89 c8             	mov    %rcx,%r8
   412aa:	89 c1                	mov    %eax,%ecx
   412ac:	ba 68 42 04 00       	mov    $0x44268,%edx
   412b1:	be 00 0c 00 00       	mov    $0xc00,%esi
   412b6:	bf 80 07 00 00       	mov    $0x780,%edi
   412bb:	b8 00 00 00 00       	mov    $0x0,%eax
   412c0:	e8 26 2e 00 00       	callq  440eb <console_printf>
   412c5:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   412c9:	48 8b 05 30 cd 00 00 	mov    0xcd30(%rip),%rax        # 4e000 <current>
   412d0:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   412d7:	00 00 00 
        break;
   412da:	eb 12                	jmp    412ee <exception+0x6e1>
    }

    default:
        default_exception(current);
   412dc:	48 8b 05 1d cd 00 00 	mov    0xcd1d(%rip),%rax        # 4e000 <current>
   412e3:	48 89 c7             	mov    %rax,%rdi
   412e6:	e8 bd 19 00 00       	callq  42ca8 <default_exception>
        break;                  /* will not be reached */
   412eb:	eb 01                	jmp    412ee <exception+0x6e1>
        break;
   412ed:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   412ee:	48 8b 05 0b cd 00 00 	mov    0xcd0b(%rip),%rax        # 4e000 <current>
   412f5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   412fb:	83 f8 01             	cmp    $0x1,%eax
   412fe:	75 0f                	jne    4130f <exception+0x702>
        run(current);
   41300:	48 8b 05 f9 cc 00 00 	mov    0xccf9(%rip),%rax        # 4e000 <current>
   41307:	48 89 c7             	mov    %rax,%rdi
   4130a:	e8 7a 00 00 00       	callq  41389 <run>
    } else {
        schedule();
   4130f:	e8 03 00 00 00       	callq  41317 <schedule>
    }
}
   41314:	90                   	nop
   41315:	c9                   	leaveq 
   41316:	c3                   	retq   

0000000000041317 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   41317:	55                   	push   %rbp
   41318:	48 89 e5             	mov    %rsp,%rbp
   4131b:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   4131f:	48 8b 05 da cc 00 00 	mov    0xccda(%rip),%rax        # 4e000 <current>
   41326:	8b 00                	mov    (%rax),%eax
   41328:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   4132b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4132e:	83 c0 01             	add    $0x1,%eax
   41331:	99                   	cltd   
   41332:	c1 ea 1c             	shr    $0x1c,%edx
   41335:	01 d0                	add    %edx,%eax
   41337:	83 e0 0f             	and    $0xf,%eax
   4133a:	29 d0                	sub    %edx,%eax
   4133c:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   4133f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41342:	48 63 d0             	movslq %eax,%rdx
   41345:	48 89 d0             	mov    %rdx,%rax
   41348:	48 c1 e0 03          	shl    $0x3,%rax
   4134c:	48 29 d0             	sub    %rdx,%rax
   4134f:	48 c1 e0 05          	shl    $0x5,%rax
   41353:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41359:	8b 00                	mov    (%rax),%eax
   4135b:	83 f8 01             	cmp    $0x1,%eax
   4135e:	75 22                	jne    41382 <schedule+0x6b>
            run(&processes[pid]);
   41360:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41363:	48 63 d0             	movslq %eax,%rdx
   41366:	48 89 d0             	mov    %rdx,%rax
   41369:	48 c1 e0 03          	shl    $0x3,%rax
   4136d:	48 29 d0             	sub    %rdx,%rax
   41370:	48 c1 e0 05          	shl    $0x5,%rax
   41374:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   4137a:	48 89 c7             	mov    %rax,%rdi
   4137d:	e8 07 00 00 00       	callq  41389 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   41382:	e8 d0 16 00 00       	callq  42a57 <check_keyboard>
        pid = (pid + 1) % NPROC;
   41387:	eb a2                	jmp    4132b <schedule+0x14>

0000000000041389 <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   41389:	55                   	push   %rbp
   4138a:	48 89 e5             	mov    %rsp,%rbp
   4138d:	48 83 ec 10          	sub    $0x10,%rsp
   41391:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   41395:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41399:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   4139f:	83 f8 01             	cmp    $0x1,%eax
   413a2:	74 14                	je     413b8 <run+0x2f>
   413a4:	ba f0 43 04 00       	mov    $0x443f0,%edx
   413a9:	be 54 02 00 00       	mov    $0x254,%esi
   413ae:	bf 00 42 04 00       	mov    $0x44200,%edi
   413b3:	e8 c0 18 00 00       	callq  42c78 <assert_fail>
    current = p;
   413b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   413bc:	48 89 05 3d cc 00 00 	mov    %rax,0xcc3d(%rip)        # 4e000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   413c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   413c7:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   413ce:	48 89 c7             	mov    %rax,%rdi
   413d1:	e8 70 1a 00 00       	callq  42e46 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   413d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   413da:	48 83 c0 08          	add    $0x8,%rax
   413de:	48 89 c7             	mov    %rax,%rdi
   413e1:	e8 dd ec ff ff       	callq  400c3 <exception_return>

00000000000413e6 <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   413e6:	55                   	push   %rbp
   413e7:	48 89 e5             	mov    %rsp,%rbp
   413ea:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   413ee:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   413f5:	00 
   413f6:	e9 81 00 00 00       	jmpq   4147c <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   413fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   413ff:	48 89 c7             	mov    %rax,%rdi
   41402:	e8 ef 0e 00 00       	callq  422f6 <physical_memory_isreserved>
   41407:	85 c0                	test   %eax,%eax
   41409:	74 09                	je     41414 <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   4140b:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   41412:	eb 2f                	jmp    41443 <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   41414:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   4141b:	00 
   4141c:	76 0b                	jbe    41429 <pageinfo_init+0x43>
   4141e:	b8 08 70 05 00       	mov    $0x57008,%eax
   41423:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41427:	72 0a                	jb     41433 <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   41429:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   41430:	00 
   41431:	75 09                	jne    4143c <pageinfo_init+0x56>
            owner = PO_KERNEL;
   41433:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   4143a:	eb 07                	jmp    41443 <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   4143c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   41443:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41447:	48 c1 e8 0c          	shr    $0xc,%rax
   4144b:	89 c1                	mov    %eax,%ecx
   4144d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41450:	89 c2                	mov    %eax,%edx
   41452:	48 63 c1             	movslq %ecx,%rax
   41455:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   4145c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41460:	0f 95 c2             	setne  %dl
   41463:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41467:	48 c1 e8 0c          	shr    $0xc,%rax
   4146b:	48 98                	cltq   
   4146d:	88 94 00 41 ee 04 00 	mov    %dl,0x4ee41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41474:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4147b:	00 
   4147c:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   41483:	00 
   41484:	0f 86 71 ff ff ff    	jbe    413fb <pageinfo_init+0x15>
    }
}
   4148a:	90                   	nop
   4148b:	90                   	nop
   4148c:	c9                   	leaveq 
   4148d:	c3                   	retq   

000000000004148e <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   4148e:	55                   	push   %rbp
   4148f:	48 89 e5             	mov    %rsp,%rbp
   41492:	48 83 ec 50          	sub    $0x50,%rsp
   41496:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   4149a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4149e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   414a4:	48 89 c2             	mov    %rax,%rdx
   414a7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   414ab:	48 39 c2             	cmp    %rax,%rdx
   414ae:	74 14                	je     414c4 <check_page_table_mappings+0x36>
   414b0:	ba 10 44 04 00       	mov    $0x44410,%edx
   414b5:	be 7e 02 00 00       	mov    $0x27e,%esi
   414ba:	bf 00 42 04 00       	mov    $0x44200,%edi
   414bf:	e8 b4 17 00 00       	callq  42c78 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   414c4:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   414cb:	00 
   414cc:	e9 9a 00 00 00       	jmpq   4156b <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   414d1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   414d5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   414d9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   414dd:	48 89 ce             	mov    %rcx,%rsi
   414e0:	48 89 c7             	mov    %rax,%rdi
   414e3:	e8 4a 1e 00 00       	callq  43332 <virtual_memory_lookup>
        if (vam.pa != va) {
   414e8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   414ec:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   414f0:	74 27                	je     41519 <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   414f2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   414f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   414fa:	49 89 d0             	mov    %rdx,%r8
   414fd:	48 89 c1             	mov    %rax,%rcx
   41500:	ba 2f 44 04 00       	mov    $0x4442f,%edx
   41505:	be 00 c0 00 00       	mov    $0xc000,%esi
   4150a:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4150f:	b8 00 00 00 00       	mov    $0x0,%eax
   41514:	e8 d2 2b 00 00       	callq  440eb <console_printf>
        }
        assert(vam.pa == va);
   41519:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4151d:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41521:	74 14                	je     41537 <check_page_table_mappings+0xa9>
   41523:	ba 39 44 04 00       	mov    $0x44439,%edx
   41528:	be 87 02 00 00       	mov    $0x287,%esi
   4152d:	bf 00 42 04 00       	mov    $0x44200,%edi
   41532:	e8 41 17 00 00       	callq  42c78 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   41537:	b8 00 50 04 00       	mov    $0x45000,%eax
   4153c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41540:	72 21                	jb     41563 <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   41542:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41545:	48 98                	cltq   
   41547:	83 e0 02             	and    $0x2,%eax
   4154a:	48 85 c0             	test   %rax,%rax
   4154d:	75 14                	jne    41563 <check_page_table_mappings+0xd5>
   4154f:	ba 46 44 04 00       	mov    $0x44446,%edx
   41554:	be 89 02 00 00       	mov    $0x289,%esi
   41559:	bf 00 42 04 00       	mov    $0x44200,%edi
   4155e:	e8 15 17 00 00       	callq  42c78 <assert_fail>
         va += PAGESIZE) {
   41563:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4156a:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   4156b:	b8 08 70 05 00       	mov    $0x57008,%eax
   41570:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41574:	0f 82 57 ff ff ff    	jb     414d1 <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   4157a:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41581:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41582:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   41586:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4158a:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   4158e:	48 89 ce             	mov    %rcx,%rsi
   41591:	48 89 c7             	mov    %rax,%rdi
   41594:	e8 99 1d 00 00       	callq  43332 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   41599:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4159d:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   415a1:	74 14                	je     415b7 <check_page_table_mappings+0x129>
   415a3:	ba 57 44 04 00       	mov    $0x44457,%edx
   415a8:	be 90 02 00 00       	mov    $0x290,%esi
   415ad:	bf 00 42 04 00       	mov    $0x44200,%edi
   415b2:	e8 c1 16 00 00       	callq  42c78 <assert_fail>
    assert(vam.perm & PTE_W);
   415b7:	8b 45 e8             	mov    -0x18(%rbp),%eax
   415ba:	48 98                	cltq   
   415bc:	83 e0 02             	and    $0x2,%eax
   415bf:	48 85 c0             	test   %rax,%rax
   415c2:	75 14                	jne    415d8 <check_page_table_mappings+0x14a>
   415c4:	ba 46 44 04 00       	mov    $0x44446,%edx
   415c9:	be 91 02 00 00       	mov    $0x291,%esi
   415ce:	bf 00 42 04 00       	mov    $0x44200,%edi
   415d3:	e8 a0 16 00 00       	callq  42c78 <assert_fail>
}
   415d8:	90                   	nop
   415d9:	c9                   	leaveq 
   415da:	c3                   	retq   

00000000000415db <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   415db:	55                   	push   %rbp
   415dc:	48 89 e5             	mov    %rsp,%rbp
   415df:	48 83 ec 20          	sub    $0x20,%rsp
   415e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   415e7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   415ea:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   415ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   415f0:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   415f7:	48 8b 05 02 fa 00 00 	mov    0xfa02(%rip),%rax        # 51000 <kernel_pagetable>
   415fe:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   41602:	75 67                	jne    4166b <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   41604:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   4160b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41612:	eb 51                	jmp    41665 <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   41614:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41617:	48 63 d0             	movslq %eax,%rdx
   4161a:	48 89 d0             	mov    %rdx,%rax
   4161d:	48 c1 e0 03          	shl    $0x3,%rax
   41621:	48 29 d0             	sub    %rdx,%rax
   41624:	48 c1 e0 05          	shl    $0x5,%rax
   41628:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   4162e:	8b 00                	mov    (%rax),%eax
   41630:	85 c0                	test   %eax,%eax
   41632:	74 2d                	je     41661 <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   41634:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41637:	48 63 d0             	movslq %eax,%rdx
   4163a:	48 89 d0             	mov    %rdx,%rax
   4163d:	48 c1 e0 03          	shl    $0x3,%rax
   41641:	48 29 d0             	sub    %rdx,%rax
   41644:	48 c1 e0 05          	shl    $0x5,%rax
   41648:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4164e:	48 8b 10             	mov    (%rax),%rdx
   41651:	48 8b 05 a8 f9 00 00 	mov    0xf9a8(%rip),%rax        # 51000 <kernel_pagetable>
   41658:	48 39 c2             	cmp    %rax,%rdx
   4165b:	75 04                	jne    41661 <check_page_table_ownership+0x86>
                ++expected_refcount;
   4165d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41661:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41665:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   41669:	7e a9                	jle    41614 <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   4166b:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   4166e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41671:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41675:	be 00 00 00 00       	mov    $0x0,%esi
   4167a:	48 89 c7             	mov    %rax,%rdi
   4167d:	e8 03 00 00 00       	callq  41685 <check_page_table_ownership_level>
}
   41682:	90                   	nop
   41683:	c9                   	leaveq 
   41684:	c3                   	retq   

0000000000041685 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   41685:	55                   	push   %rbp
   41686:	48 89 e5             	mov    %rsp,%rbp
   41689:	48 83 ec 30          	sub    $0x30,%rsp
   4168d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41691:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   41694:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41697:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   4169a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4169e:	48 c1 e8 0c          	shr    $0xc,%rax
   416a2:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   416a7:	7e 14                	jle    416bd <check_page_table_ownership_level+0x38>
   416a9:	ba 68 44 04 00       	mov    $0x44468,%edx
   416ae:	be ae 02 00 00       	mov    $0x2ae,%esi
   416b3:	bf 00 42 04 00       	mov    $0x44200,%edi
   416b8:	e8 bb 15 00 00       	callq  42c78 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   416bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   416c1:	48 c1 e8 0c          	shr    $0xc,%rax
   416c5:	48 98                	cltq   
   416c7:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   416ce:	00 
   416cf:	0f be c0             	movsbl %al,%eax
   416d2:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   416d5:	74 14                	je     416eb <check_page_table_ownership_level+0x66>
   416d7:	ba 80 44 04 00       	mov    $0x44480,%edx
   416dc:	be af 02 00 00       	mov    $0x2af,%esi
   416e1:	bf 00 42 04 00       	mov    $0x44200,%edi
   416e6:	e8 8d 15 00 00       	callq  42c78 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   416eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   416ef:	48 c1 e8 0c          	shr    $0xc,%rax
   416f3:	48 98                	cltq   
   416f5:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   416fc:	00 
   416fd:	0f be c0             	movsbl %al,%eax
   41700:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   41703:	74 14                	je     41719 <check_page_table_ownership_level+0x94>
   41705:	ba a8 44 04 00       	mov    $0x444a8,%edx
   4170a:	be b0 02 00 00       	mov    $0x2b0,%esi
   4170f:	bf 00 42 04 00       	mov    $0x44200,%edi
   41714:	e8 5f 15 00 00       	callq  42c78 <assert_fail>
    if (level < 3) {
   41719:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   4171d:	7f 5b                	jg     4177a <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   4171f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41726:	eb 49                	jmp    41771 <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   41728:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4172c:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4172f:	48 63 d2             	movslq %edx,%rdx
   41732:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41736:	48 85 c0             	test   %rax,%rax
   41739:	74 32                	je     4176d <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   4173b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4173f:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41742:	48 63 d2             	movslq %edx,%rdx
   41745:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41749:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   4174f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   41753:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41756:	8d 70 01             	lea    0x1(%rax),%esi
   41759:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4175c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41760:	b9 01 00 00 00       	mov    $0x1,%ecx
   41765:	48 89 c7             	mov    %rax,%rdi
   41768:	e8 18 ff ff ff       	callq  41685 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   4176d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41771:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41778:	7e ae                	jle    41728 <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   4177a:	90                   	nop
   4177b:	c9                   	leaveq 
   4177c:	c3                   	retq   

000000000004177d <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   4177d:	55                   	push   %rbp
   4177e:	48 89 e5             	mov    %rsp,%rbp
   41781:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   41785:	8b 05 5d c9 00 00    	mov    0xc95d(%rip),%eax        # 4e0e8 <processes+0xc8>
   4178b:	85 c0                	test   %eax,%eax
   4178d:	74 14                	je     417a3 <check_virtual_memory+0x26>
   4178f:	ba d8 44 04 00       	mov    $0x444d8,%edx
   41794:	be c3 02 00 00       	mov    $0x2c3,%esi
   41799:	bf 00 42 04 00       	mov    $0x44200,%edi
   4179e:	e8 d5 14 00 00       	callq  42c78 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   417a3:	48 8b 05 56 f8 00 00 	mov    0xf856(%rip),%rax        # 51000 <kernel_pagetable>
   417aa:	48 89 c7             	mov    %rax,%rdi
   417ad:	e8 dc fc ff ff       	callq  4148e <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   417b2:	48 8b 05 47 f8 00 00 	mov    0xf847(%rip),%rax        # 51000 <kernel_pagetable>
   417b9:	be ff ff ff ff       	mov    $0xffffffff,%esi
   417be:	48 89 c7             	mov    %rax,%rdi
   417c1:	e8 15 fe ff ff       	callq  415db <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   417c6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   417cd:	e9 9c 00 00 00       	jmpq   4186e <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   417d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   417d5:	48 63 d0             	movslq %eax,%rdx
   417d8:	48 89 d0             	mov    %rdx,%rax
   417db:	48 c1 e0 03          	shl    $0x3,%rax
   417df:	48 29 d0             	sub    %rdx,%rax
   417e2:	48 c1 e0 05          	shl    $0x5,%rax
   417e6:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   417ec:	8b 00                	mov    (%rax),%eax
   417ee:	85 c0                	test   %eax,%eax
   417f0:	74 78                	je     4186a <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   417f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   417f5:	48 63 d0             	movslq %eax,%rdx
   417f8:	48 89 d0             	mov    %rdx,%rax
   417fb:	48 c1 e0 03          	shl    $0x3,%rax
   417ff:	48 29 d0             	sub    %rdx,%rax
   41802:	48 c1 e0 05          	shl    $0x5,%rax
   41806:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4180c:	48 8b 10             	mov    (%rax),%rdx
   4180f:	48 8b 05 ea f7 00 00 	mov    0xf7ea(%rip),%rax        # 51000 <kernel_pagetable>
   41816:	48 39 c2             	cmp    %rax,%rdx
   41819:	74 4f                	je     4186a <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   4181b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4181e:	48 63 d0             	movslq %eax,%rdx
   41821:	48 89 d0             	mov    %rdx,%rax
   41824:	48 c1 e0 03          	shl    $0x3,%rax
   41828:	48 29 d0             	sub    %rdx,%rax
   4182b:	48 c1 e0 05          	shl    $0x5,%rax
   4182f:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41835:	48 8b 00             	mov    (%rax),%rax
   41838:	48 89 c7             	mov    %rax,%rdi
   4183b:	e8 4e fc ff ff       	callq  4148e <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41840:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41843:	48 63 d0             	movslq %eax,%rdx
   41846:	48 89 d0             	mov    %rdx,%rax
   41849:	48 c1 e0 03          	shl    $0x3,%rax
   4184d:	48 29 d0             	sub    %rdx,%rax
   41850:	48 c1 e0 05          	shl    $0x5,%rax
   41854:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4185a:	48 8b 00             	mov    (%rax),%rax
   4185d:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41860:	89 d6                	mov    %edx,%esi
   41862:	48 89 c7             	mov    %rax,%rdi
   41865:	e8 71 fd ff ff       	callq  415db <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   4186a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4186e:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41872:	0f 8e 5a ff ff ff    	jle    417d2 <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41878:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   4187f:	eb 67                	jmp    418e8 <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   41881:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41884:	48 98                	cltq   
   41886:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4188d:	00 
   4188e:	84 c0                	test   %al,%al
   41890:	7e 52                	jle    418e4 <check_virtual_memory+0x167>
   41892:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41895:	48 98                	cltq   
   41897:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4189e:	00 
   4189f:	84 c0                	test   %al,%al
   418a1:	78 41                	js     418e4 <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   418a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
   418a6:	48 98                	cltq   
   418a8:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   418af:	00 
   418b0:	0f be c0             	movsbl %al,%eax
   418b3:	48 63 d0             	movslq %eax,%rdx
   418b6:	48 89 d0             	mov    %rdx,%rax
   418b9:	48 c1 e0 03          	shl    $0x3,%rax
   418bd:	48 29 d0             	sub    %rdx,%rax
   418c0:	48 c1 e0 05          	shl    $0x5,%rax
   418c4:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   418ca:	8b 00                	mov    (%rax),%eax
   418cc:	85 c0                	test   %eax,%eax
   418ce:	75 14                	jne    418e4 <check_virtual_memory+0x167>
   418d0:	ba f8 44 04 00       	mov    $0x444f8,%edx
   418d5:	be da 02 00 00       	mov    $0x2da,%esi
   418da:	bf 00 42 04 00       	mov    $0x44200,%edi
   418df:	e8 94 13 00 00       	callq  42c78 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   418e4:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   418e8:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   418ef:	7e 90                	jle    41881 <check_virtual_memory+0x104>
        }
    }
}
   418f1:	90                   	nop
   418f2:	90                   	nop
   418f3:	c9                   	leaveq 
   418f4:	c3                   	retq   

00000000000418f5 <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   418f5:	55                   	push   %rbp
   418f6:	48 89 e5             	mov    %rsp,%rbp
   418f9:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   418fd:	ba 66 45 04 00       	mov    $0x44566,%edx
   41902:	be 00 0f 00 00       	mov    $0xf00,%esi
   41907:	bf 20 00 00 00       	mov    $0x20,%edi
   4190c:	b8 00 00 00 00       	mov    $0x0,%eax
   41911:	e8 d5 27 00 00       	callq  440eb <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41916:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4191d:	e9 f4 00 00 00       	jmpq   41a16 <memshow_physical+0x121>
        if (pn % 64 == 0) {
   41922:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41925:	83 e0 3f             	and    $0x3f,%eax
   41928:	85 c0                	test   %eax,%eax
   4192a:	75 3e                	jne    4196a <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   4192c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4192f:	c1 e0 0c             	shl    $0xc,%eax
   41932:	89 c2                	mov    %eax,%edx
   41934:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41937:	8d 48 3f             	lea    0x3f(%rax),%ecx
   4193a:	85 c0                	test   %eax,%eax
   4193c:	0f 48 c1             	cmovs  %ecx,%eax
   4193f:	c1 f8 06             	sar    $0x6,%eax
   41942:	8d 48 01             	lea    0x1(%rax),%ecx
   41945:	89 c8                	mov    %ecx,%eax
   41947:	c1 e0 02             	shl    $0x2,%eax
   4194a:	01 c8                	add    %ecx,%eax
   4194c:	c1 e0 04             	shl    $0x4,%eax
   4194f:	83 c0 03             	add    $0x3,%eax
   41952:	89 d1                	mov    %edx,%ecx
   41954:	ba 76 45 04 00       	mov    $0x44576,%edx
   41959:	be 00 0f 00 00       	mov    $0xf00,%esi
   4195e:	89 c7                	mov    %eax,%edi
   41960:	b8 00 00 00 00       	mov    $0x0,%eax
   41965:	e8 81 27 00 00       	callq  440eb <console_printf>
        }

        int owner = pageinfo[pn].owner;
   4196a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4196d:	48 98                	cltq   
   4196f:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41976:	00 
   41977:	0f be c0             	movsbl %al,%eax
   4197a:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   4197d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41980:	48 98                	cltq   
   41982:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41989:	00 
   4198a:	84 c0                	test   %al,%al
   4198c:	75 07                	jne    41995 <memshow_physical+0xa0>
            owner = PO_FREE;
   4198e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41995:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41998:	83 c0 02             	add    $0x2,%eax
   4199b:	48 98                	cltq   
   4199d:	0f b7 84 00 40 45 04 	movzwl 0x44540(%rax,%rax,1),%eax
   419a4:	00 
   419a5:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   419a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   419ac:	48 98                	cltq   
   419ae:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   419b5:	00 
   419b6:	3c 01                	cmp    $0x1,%al
   419b8:	7e 1a                	jle    419d4 <memshow_physical+0xdf>
   419ba:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   419bf:	48 c1 e8 0c          	shr    $0xc,%rax
   419c3:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   419c6:	74 0c                	je     419d4 <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   419c8:	b8 53 00 00 00       	mov    $0x53,%eax
   419cd:	80 cc 0f             	or     $0xf,%ah
   419d0:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
	    color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   419d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   419d7:	8d 50 3f             	lea    0x3f(%rax),%edx
   419da:	85 c0                	test   %eax,%eax
   419dc:	0f 48 c2             	cmovs  %edx,%eax
   419df:	c1 f8 06             	sar    $0x6,%eax
   419e2:	8d 50 01             	lea    0x1(%rax),%edx
   419e5:	89 d0                	mov    %edx,%eax
   419e7:	c1 e0 02             	shl    $0x2,%eax
   419ea:	01 d0                	add    %edx,%eax
   419ec:	c1 e0 04             	shl    $0x4,%eax
   419ef:	89 c1                	mov    %eax,%ecx
   419f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   419f4:	99                   	cltd   
   419f5:	c1 ea 1a             	shr    $0x1a,%edx
   419f8:	01 d0                	add    %edx,%eax
   419fa:	83 e0 3f             	and    $0x3f,%eax
   419fd:	29 d0                	sub    %edx,%eax
   419ff:	83 c0 0c             	add    $0xc,%eax
   41a02:	01 c8                	add    %ecx,%eax
   41a04:	48 98                	cltq   
   41a06:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   41a0a:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   41a11:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41a12:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41a16:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41a1d:	0f 8e ff fe ff ff    	jle    41922 <memshow_physical+0x2d>
    }
}
   41a23:	90                   	nop
   41a24:	90                   	nop
   41a25:	c9                   	leaveq 
   41a26:	c3                   	retq   

0000000000041a27 <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   41a27:	55                   	push   %rbp
   41a28:	48 89 e5             	mov    %rsp,%rbp
   41a2b:	48 83 ec 40          	sub    $0x40,%rsp
   41a2f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   41a33:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   41a37:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41a3b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41a41:	48 89 c2             	mov    %rax,%rdx
   41a44:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41a48:	48 39 c2             	cmp    %rax,%rdx
   41a4b:	74 14                	je     41a61 <memshow_virtual+0x3a>
   41a4d:	ba 80 45 04 00       	mov    $0x44580,%edx
   41a52:	be 0b 03 00 00       	mov    $0x30b,%esi
   41a57:	bf 00 42 04 00       	mov    $0x44200,%edi
   41a5c:	e8 17 12 00 00       	callq  42c78 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41a61:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41a65:	48 89 c1             	mov    %rax,%rcx
   41a68:	ba ad 45 04 00       	mov    $0x445ad,%edx
   41a6d:	be 00 0f 00 00       	mov    $0xf00,%esi
   41a72:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41a77:	b8 00 00 00 00       	mov    $0x0,%eax
   41a7c:	e8 6a 26 00 00       	callq  440eb <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41a81:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41a88:	00 
   41a89:	e9 80 01 00 00       	jmpq   41c0e <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41a8e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   41a92:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41a96:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41a9a:	48 89 ce             	mov    %rcx,%rsi
   41a9d:	48 89 c7             	mov    %rax,%rdi
   41aa0:	e8 8d 18 00 00       	callq  43332 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   41aa5:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41aa8:	85 c0                	test   %eax,%eax
   41aaa:	79 0b                	jns    41ab7 <memshow_virtual+0x90>
            color = ' ';
   41aac:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   41ab2:	e9 d7 00 00 00       	jmpq   41b8e <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41ab7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41abb:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41ac1:	76 14                	jbe    41ad7 <memshow_virtual+0xb0>
   41ac3:	ba ca 45 04 00       	mov    $0x445ca,%edx
   41ac8:	be 14 03 00 00       	mov    $0x314,%esi
   41acd:	bf 00 42 04 00       	mov    $0x44200,%edi
   41ad2:	e8 a1 11 00 00       	callq  42c78 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41ad7:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41ada:	48 98                	cltq   
   41adc:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41ae3:	00 
   41ae4:	0f be c0             	movsbl %al,%eax
   41ae7:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41aea:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41aed:	48 98                	cltq   
   41aef:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41af6:	00 
   41af7:	84 c0                	test   %al,%al
   41af9:	75 07                	jne    41b02 <memshow_virtual+0xdb>
                owner = PO_FREE;
   41afb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41b02:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41b05:	83 c0 02             	add    $0x2,%eax
   41b08:	48 98                	cltq   
   41b0a:	0f b7 84 00 40 45 04 	movzwl 0x44540(%rax,%rax,1),%eax
   41b11:	00 
   41b12:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   41b16:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41b19:	48 98                	cltq   
   41b1b:	83 e0 04             	and    $0x4,%eax
   41b1e:	48 85 c0             	test   %rax,%rax
   41b21:	74 27                	je     41b4a <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41b23:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41b27:	c1 e0 04             	shl    $0x4,%eax
   41b2a:	66 25 00 f0          	and    $0xf000,%ax
   41b2e:	89 c2                	mov    %eax,%edx
   41b30:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41b34:	c1 f8 04             	sar    $0x4,%eax
   41b37:	66 25 00 0f          	and    $0xf00,%ax
   41b3b:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   41b3d:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41b41:	0f b6 c0             	movzbl %al,%eax
   41b44:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   41b46:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   41b4a:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41b4d:	48 98                	cltq   
   41b4f:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41b56:	00 
   41b57:	3c 01                	cmp    $0x1,%al
   41b59:	7e 33                	jle    41b8e <memshow_virtual+0x167>
   41b5b:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41b60:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41b64:	74 28                	je     41b8e <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41b66:	b8 53 00 00 00       	mov    $0x53,%eax
   41b6b:	89 c2                	mov    %eax,%edx
   41b6d:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41b71:	66 25 00 f0          	and    $0xf000,%ax
   41b75:	09 d0                	or     %edx,%eax
   41b77:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   41b7b:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41b7e:	48 98                	cltq   
   41b80:	83 e0 04             	and    $0x4,%eax
   41b83:	48 85 c0             	test   %rax,%rax
   41b86:	75 06                	jne    41b8e <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41b88:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
		color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41b8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41b92:	48 c1 e8 0c          	shr    $0xc,%rax
   41b96:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41b99:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41b9c:	83 e0 3f             	and    $0x3f,%eax
   41b9f:	85 c0                	test   %eax,%eax
   41ba1:	75 34                	jne    41bd7 <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   41ba3:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ba6:	c1 e8 06             	shr    $0x6,%eax
   41ba9:	89 c2                	mov    %eax,%edx
   41bab:	89 d0                	mov    %edx,%eax
   41bad:	c1 e0 02             	shl    $0x2,%eax
   41bb0:	01 d0                	add    %edx,%eax
   41bb2:	c1 e0 04             	shl    $0x4,%eax
   41bb5:	05 73 03 00 00       	add    $0x373,%eax
   41bba:	89 c7                	mov    %eax,%edi
   41bbc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41bc0:	48 89 c1             	mov    %rax,%rcx
   41bc3:	ba 76 45 04 00       	mov    $0x44576,%edx
   41bc8:	be 00 0f 00 00       	mov    $0xf00,%esi
   41bcd:	b8 00 00 00 00       	mov    $0x0,%eax
   41bd2:	e8 14 25 00 00       	callq  440eb <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41bd7:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41bda:	c1 e8 06             	shr    $0x6,%eax
   41bdd:	89 c2                	mov    %eax,%edx
   41bdf:	89 d0                	mov    %edx,%eax
   41be1:	c1 e0 02             	shl    $0x2,%eax
   41be4:	01 d0                	add    %edx,%eax
   41be6:	c1 e0 04             	shl    $0x4,%eax
   41be9:	89 c2                	mov    %eax,%edx
   41beb:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41bee:	83 e0 3f             	and    $0x3f,%eax
   41bf1:	01 d0                	add    %edx,%eax
   41bf3:	05 7c 03 00 00       	add    $0x37c,%eax
   41bf8:	89 c2                	mov    %eax,%edx
   41bfa:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41bfe:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   41c05:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41c06:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41c0d:	00 
   41c0e:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41c15:	00 
   41c16:	0f 86 72 fe ff ff    	jbe    41a8e <memshow_virtual+0x67>
    }
}
   41c1c:	90                   	nop
   41c1d:	90                   	nop
   41c1e:	c9                   	leaveq 
   41c1f:	c3                   	retq   

0000000000041c20 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41c20:	55                   	push   %rbp
   41c21:	48 89 e5             	mov    %rsp,%rbp
   41c24:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41c28:	8b 05 12 d6 00 00    	mov    0xd612(%rip),%eax        # 4f240 <last_ticks.1>
   41c2e:	85 c0                	test   %eax,%eax
   41c30:	74 13                	je     41c45 <memshow_virtual_animate+0x25>
   41c32:	8b 05 e8 d1 00 00    	mov    0xd1e8(%rip),%eax        # 4ee20 <ticks>
   41c38:	8b 15 02 d6 00 00    	mov    0xd602(%rip),%edx        # 4f240 <last_ticks.1>
   41c3e:	29 d0                	sub    %edx,%eax
   41c40:	83 f8 31             	cmp    $0x31,%eax
   41c43:	76 2c                	jbe    41c71 <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   41c45:	8b 05 d5 d1 00 00    	mov    0xd1d5(%rip),%eax        # 4ee20 <ticks>
   41c4b:	89 05 ef d5 00 00    	mov    %eax,0xd5ef(%rip)        # 4f240 <last_ticks.1>
        ++showing;
   41c51:	8b 05 ad 33 00 00    	mov    0x33ad(%rip),%eax        # 45004 <showing.0>
   41c57:	83 c0 01             	add    $0x1,%eax
   41c5a:	89 05 a4 33 00 00    	mov    %eax,0x33a4(%rip)        # 45004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   41c60:	eb 0f                	jmp    41c71 <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   41c62:	8b 05 9c 33 00 00    	mov    0x339c(%rip),%eax        # 45004 <showing.0>
   41c68:	83 c0 01             	add    $0x1,%eax
   41c6b:	89 05 93 33 00 00    	mov    %eax,0x3393(%rip)        # 45004 <showing.0>
    while (showing <= 2*NPROC
   41c71:	8b 05 8d 33 00 00    	mov    0x338d(%rip),%eax        # 45004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   41c77:	83 f8 20             	cmp    $0x20,%eax
   41c7a:	7f 2e                	jg     41caa <memshow_virtual_animate+0x8a>
   41c7c:	8b 05 82 33 00 00    	mov    0x3382(%rip),%eax        # 45004 <showing.0>
   41c82:	99                   	cltd   
   41c83:	c1 ea 1c             	shr    $0x1c,%edx
   41c86:	01 d0                	add    %edx,%eax
   41c88:	83 e0 0f             	and    $0xf,%eax
   41c8b:	29 d0                	sub    %edx,%eax
   41c8d:	48 63 d0             	movslq %eax,%rdx
   41c90:	48 89 d0             	mov    %rdx,%rax
   41c93:	48 c1 e0 03          	shl    $0x3,%rax
   41c97:	48 29 d0             	sub    %rdx,%rax
   41c9a:	48 c1 e0 05          	shl    $0x5,%rax
   41c9e:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41ca4:	8b 00                	mov    (%rax),%eax
   41ca6:	85 c0                	test   %eax,%eax
   41ca8:	74 b8                	je     41c62 <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41caa:	8b 05 54 33 00 00    	mov    0x3354(%rip),%eax        # 45004 <showing.0>
   41cb0:	99                   	cltd   
   41cb1:	c1 ea 1c             	shr    $0x1c,%edx
   41cb4:	01 d0                	add    %edx,%eax
   41cb6:	83 e0 0f             	and    $0xf,%eax
   41cb9:	29 d0                	sub    %edx,%eax
   41cbb:	89 05 43 33 00 00    	mov    %eax,0x3343(%rip)        # 45004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41cc1:	8b 05 3d 33 00 00    	mov    0x333d(%rip),%eax        # 45004 <showing.0>
   41cc7:	48 63 d0             	movslq %eax,%rdx
   41cca:	48 89 d0             	mov    %rdx,%rax
   41ccd:	48 c1 e0 03          	shl    $0x3,%rax
   41cd1:	48 29 d0             	sub    %rdx,%rax
   41cd4:	48 c1 e0 05          	shl    $0x5,%rax
   41cd8:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41cde:	8b 00                	mov    (%rax),%eax
   41ce0:	85 c0                	test   %eax,%eax
   41ce2:	74 52                	je     41d36 <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41ce4:	8b 15 1a 33 00 00    	mov    0x331a(%rip),%edx        # 45004 <showing.0>
   41cea:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41cee:	89 d1                	mov    %edx,%ecx
   41cf0:	ba e4 45 04 00       	mov    $0x445e4,%edx
   41cf5:	be 04 00 00 00       	mov    $0x4,%esi
   41cfa:	48 89 c7             	mov    %rax,%rdi
   41cfd:	b8 00 00 00 00       	mov    $0x0,%eax
   41d02:	e8 62 24 00 00       	callq  44169 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   41d07:	8b 05 f7 32 00 00    	mov    0x32f7(%rip),%eax        # 45004 <showing.0>
   41d0d:	48 63 d0             	movslq %eax,%rdx
   41d10:	48 89 d0             	mov    %rdx,%rax
   41d13:	48 c1 e0 03          	shl    $0x3,%rax
   41d17:	48 29 d0             	sub    %rdx,%rax
   41d1a:	48 c1 e0 05          	shl    $0x5,%rax
   41d1e:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41d24:	48 8b 00             	mov    (%rax),%rax
   41d27:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   41d2b:	48 89 d6             	mov    %rdx,%rsi
   41d2e:	48 89 c7             	mov    %rax,%rdi
   41d31:	e8 f1 fc ff ff       	callq  41a27 <memshow_virtual>
    }
}
   41d36:	90                   	nop
   41d37:	c9                   	leaveq 
   41d38:	c3                   	retq   

0000000000041d39 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   41d39:	55                   	push   %rbp
   41d3a:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   41d3d:	e8 53 01 00 00       	callq  41e95 <segments_init>
    interrupt_init();
   41d42:	e8 d4 03 00 00       	callq  4211b <interrupt_init>
    virtual_memory_init();
   41d47:	e8 e7 0f 00 00       	callq  42d33 <virtual_memory_init>
}
   41d4c:	90                   	nop
   41d4d:	5d                   	pop    %rbp
   41d4e:	c3                   	retq   

0000000000041d4f <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   41d4f:	55                   	push   %rbp
   41d50:	48 89 e5             	mov    %rsp,%rbp
   41d53:	48 83 ec 18          	sub    $0x18,%rsp
   41d57:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41d5b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41d5f:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   41d62:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41d65:	48 98                	cltq   
   41d67:	48 c1 e0 2d          	shl    $0x2d,%rax
   41d6b:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   41d6f:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   41d76:	90 00 00 
   41d79:	48 09 c2             	or     %rax,%rdx
    *segment = type
   41d7c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41d80:	48 89 10             	mov    %rdx,(%rax)
}
   41d83:	90                   	nop
   41d84:	c9                   	leaveq 
   41d85:	c3                   	retq   

0000000000041d86 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41d86:	55                   	push   %rbp
   41d87:	48 89 e5             	mov    %rsp,%rbp
   41d8a:	48 83 ec 28          	sub    $0x28,%rsp
   41d8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41d92:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41d96:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41d99:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41d9d:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41da1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41da5:	48 c1 e0 10          	shl    $0x10,%rax
   41da9:	48 89 c2             	mov    %rax,%rdx
   41dac:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   41db3:	00 00 00 
   41db6:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41db9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41dbd:	48 c1 e0 20          	shl    $0x20,%rax
   41dc1:	48 89 c1             	mov    %rax,%rcx
   41dc4:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41dcb:	00 00 ff 
   41dce:	48 21 c8             	and    %rcx,%rax
   41dd1:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   41dd4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41dd8:	48 83 e8 01          	sub    $0x1,%rax
   41ddc:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41ddf:	48 09 d0             	or     %rdx,%rax
        | type
   41de2:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41de6:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41de9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41dec:	48 98                	cltq   
   41dee:	48 c1 e0 2d          	shl    $0x2d,%rax
   41df2:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   41df5:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41dfc:	80 00 00 
   41dff:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41e02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e06:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41e09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e0d:	48 83 c0 08          	add    $0x8,%rax
   41e11:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   41e15:	48 c1 ea 20          	shr    $0x20,%rdx
   41e19:	48 89 10             	mov    %rdx,(%rax)
}
   41e1c:	90                   	nop
   41e1d:	c9                   	leaveq 
   41e1e:	c3                   	retq   

0000000000041e1f <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41e1f:	55                   	push   %rbp
   41e20:	48 89 e5             	mov    %rsp,%rbp
   41e23:	48 83 ec 20          	sub    $0x20,%rsp
   41e27:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41e2b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41e2f:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41e32:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41e36:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41e3a:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41e3d:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41e41:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41e44:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e47:	48 98                	cltq   
   41e49:	48 c1 e0 2d          	shl    $0x2d,%rax
   41e4d:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41e50:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41e54:	48 c1 e0 20          	shl    $0x20,%rax
   41e58:	48 89 c1             	mov    %rax,%rcx
   41e5b:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41e62:	00 ff ff 
   41e65:	48 21 c8             	and    %rcx,%rax
   41e68:	48 09 c2             	or     %rax,%rdx
   41e6b:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41e72:	80 00 00 
   41e75:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41e78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e7c:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41e7f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41e83:	48 c1 e8 20          	shr    $0x20,%rax
   41e87:	48 89 c2             	mov    %rax,%rdx
   41e8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e8e:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   41e92:	90                   	nop
   41e93:	c9                   	leaveq 
   41e94:	c3                   	retq   

0000000000041e95 <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   41e95:	55                   	push   %rbp
   41e96:	48 89 e5             	mov    %rsp,%rbp
   41e99:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41e9d:	48 c7 05 b8 d3 00 00 	movq   $0x0,0xd3b8(%rip)        # 4f260 <segments>
   41ea4:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41ea8:	ba 00 00 00 00       	mov    $0x0,%edx
   41ead:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41eb4:	08 20 00 
   41eb7:	48 89 c6             	mov    %rax,%rsi
   41eba:	bf 68 f2 04 00       	mov    $0x4f268,%edi
   41ebf:	e8 8b fe ff ff       	callq  41d4f <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   41ec4:	ba 03 00 00 00       	mov    $0x3,%edx
   41ec9:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41ed0:	08 20 00 
   41ed3:	48 89 c6             	mov    %rax,%rsi
   41ed6:	bf 70 f2 04 00       	mov    $0x4f270,%edi
   41edb:	e8 6f fe ff ff       	callq  41d4f <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41ee0:	ba 00 00 00 00       	mov    $0x0,%edx
   41ee5:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41eec:	02 00 00 
   41eef:	48 89 c6             	mov    %rax,%rsi
   41ef2:	bf 78 f2 04 00       	mov    $0x4f278,%edi
   41ef7:	e8 53 fe ff ff       	callq  41d4f <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41efc:	ba 03 00 00 00       	mov    $0x3,%edx
   41f01:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41f08:	02 00 00 
   41f0b:	48 89 c6             	mov    %rax,%rsi
   41f0e:	bf 80 f2 04 00       	mov    $0x4f280,%edi
   41f13:	e8 37 fe ff ff       	callq  41d4f <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41f18:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   41f1d:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41f23:	48 89 c1             	mov    %rax,%rcx
   41f26:	ba 00 00 00 00       	mov    $0x0,%edx
   41f2b:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41f32:	09 00 00 
   41f35:	48 89 c6             	mov    %rax,%rsi
   41f38:	bf 88 f2 04 00       	mov    $0x4f288,%edi
   41f3d:	e8 44 fe ff ff       	callq  41d86 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41f42:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41f48:	b8 60 f2 04 00       	mov    $0x4f260,%eax
   41f4d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41f51:	ba 60 00 00 00       	mov    $0x60,%edx
   41f56:	be 00 00 00 00       	mov    $0x0,%esi
   41f5b:	bf a0 02 05 00       	mov    $0x502a0,%edi
   41f60:	e8 51 19 00 00       	callq  438b6 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41f65:	48 c7 05 34 e3 00 00 	movq   $0x80000,0xe334(%rip)        # 502a4 <kernel_task_descriptor+0x4>
   41f6c:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41f70:	ba 00 10 00 00       	mov    $0x1000,%edx
   41f75:	be 00 00 00 00       	mov    $0x0,%esi
   41f7a:	bf a0 f2 04 00       	mov    $0x4f2a0,%edi
   41f7f:	e8 32 19 00 00       	callq  438b6 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41f84:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41f8b:	eb 30                	jmp    41fbd <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41f8d:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   41f92:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41f95:	48 c1 e0 04          	shl    $0x4,%rax
   41f99:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41f9f:	48 89 d1             	mov    %rdx,%rcx
   41fa2:	ba 00 00 00 00       	mov    $0x0,%edx
   41fa7:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41fae:	0e 00 00 
   41fb1:	48 89 c7             	mov    %rax,%rdi
   41fb4:	e8 66 fe ff ff       	callq  41e1f <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41fb9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41fbd:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41fc4:	76 c7                	jbe    41f8d <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41fc6:	b8 36 00 04 00       	mov    $0x40036,%eax
   41fcb:	48 89 c1             	mov    %rax,%rcx
   41fce:	ba 00 00 00 00       	mov    $0x0,%edx
   41fd3:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41fda:	0e 00 00 
   41fdd:	48 89 c6             	mov    %rax,%rsi
   41fe0:	bf a0 f4 04 00       	mov    $0x4f4a0,%edi
   41fe5:	e8 35 fe ff ff       	callq  41e1f <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41fea:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   41fef:	48 89 c1             	mov    %rax,%rcx
   41ff2:	ba 00 00 00 00       	mov    $0x0,%edx
   41ff7:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41ffe:	0e 00 00 
   42001:	48 89 c6             	mov    %rax,%rsi
   42004:	bf 70 f3 04 00       	mov    $0x4f370,%edi
   42009:	e8 11 fe ff ff       	callq  41e1f <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   4200e:	b8 32 00 04 00       	mov    $0x40032,%eax
   42013:	48 89 c1             	mov    %rax,%rcx
   42016:	ba 00 00 00 00       	mov    $0x0,%edx
   4201b:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42022:	0e 00 00 
   42025:	48 89 c6             	mov    %rax,%rsi
   42028:	bf 80 f3 04 00       	mov    $0x4f380,%edi
   4202d:	e8 ed fd ff ff       	callq  41e1f <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42032:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   42039:	eb 3e                	jmp    42079 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   4203b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4203e:	83 e8 30             	sub    $0x30,%eax
   42041:	89 c0                	mov    %eax,%eax
   42043:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   4204a:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   4204b:	48 89 c2             	mov    %rax,%rdx
   4204e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42051:	48 c1 e0 04          	shl    $0x4,%rax
   42055:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   4205b:	48 89 d1             	mov    %rdx,%rcx
   4205e:	ba 03 00 00 00       	mov    $0x3,%edx
   42063:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   4206a:	0e 00 00 
   4206d:	48 89 c7             	mov    %rax,%rdi
   42070:	e8 aa fd ff ff       	callq  41e1f <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42075:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42079:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   4207d:	76 bc                	jbe    4203b <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   4207f:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   42085:	b8 a0 f2 04 00       	mov    $0x4f2a0,%eax
   4208a:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   4208e:	b8 28 00 00 00       	mov    $0x28,%eax
   42093:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   42097:	0f 00 d8             	ltr    %ax
   4209a:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   4209e:	0f 20 c0             	mov    %cr0,%rax
   420a1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   420a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   420a9:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   420ac:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   420b3:	8b 45 f4             	mov    -0xc(%rbp),%eax
   420b6:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   420b9:	8b 45 f0             	mov    -0x10(%rbp),%eax
   420bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   420c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   420c4:	0f 22 c0             	mov    %rax,%cr0
}
   420c7:	90                   	nop
    lcr0(cr0);
}
   420c8:	90                   	nop
   420c9:	c9                   	leaveq 
   420ca:	c3                   	retq   

00000000000420cb <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   420cb:	55                   	push   %rbp
   420cc:	48 89 e5             	mov    %rsp,%rbp
   420cf:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   420d3:	0f b7 05 26 e2 00 00 	movzwl 0xe226(%rip),%eax        # 50300 <interrupts_enabled>
   420da:	f7 d0                	not    %eax
   420dc:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   420e0:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   420e4:	0f b6 c0             	movzbl %al,%eax
   420e7:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   420ee:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   420f1:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   420f5:	8b 55 f0             	mov    -0x10(%rbp),%edx
   420f8:	ee                   	out    %al,(%dx)
}
   420f9:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   420fa:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   420fe:	66 c1 e8 08          	shr    $0x8,%ax
   42102:	0f b6 c0             	movzbl %al,%eax
   42105:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   4210c:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4210f:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42113:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42116:	ee                   	out    %al,(%dx)
}
   42117:	90                   	nop
}
   42118:	90                   	nop
   42119:	c9                   	leaveq 
   4211a:	c3                   	retq   

000000000004211b <interrupt_init>:

void interrupt_init(void) {
   4211b:	55                   	push   %rbp
   4211c:	48 89 e5             	mov    %rsp,%rbp
   4211f:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   42123:	66 c7 05 d4 e1 00 00 	movw   $0x0,0xe1d4(%rip)        # 50300 <interrupts_enabled>
   4212a:	00 00 
    interrupt_mask();
   4212c:	e8 9a ff ff ff       	callq  420cb <interrupt_mask>
   42131:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   42138:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4213c:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   42140:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   42143:	ee                   	out    %al,(%dx)
}
   42144:	90                   	nop
   42145:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   4214c:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42150:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   42154:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42157:	ee                   	out    %al,(%dx)
}
   42158:	90                   	nop
   42159:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   42160:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42164:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   42168:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   4216b:	ee                   	out    %al,(%dx)
}
   4216c:	90                   	nop
   4216d:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   42174:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42178:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   4217c:	8b 55 bc             	mov    -0x44(%rbp),%edx
   4217f:	ee                   	out    %al,(%dx)
}
   42180:	90                   	nop
   42181:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   42188:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4218c:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   42190:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   42193:	ee                   	out    %al,(%dx)
}
   42194:	90                   	nop
   42195:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   4219c:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421a0:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   421a4:	8b 55 cc             	mov    -0x34(%rbp),%edx
   421a7:	ee                   	out    %al,(%dx)
}
   421a8:	90                   	nop
   421a9:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   421b0:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421b4:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   421b8:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   421bb:	ee                   	out    %al,(%dx)
}
   421bc:	90                   	nop
   421bd:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   421c4:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421c8:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   421cc:	8b 55 dc             	mov    -0x24(%rbp),%edx
   421cf:	ee                   	out    %al,(%dx)
}
   421d0:	90                   	nop
   421d1:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   421d8:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421dc:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   421e0:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   421e3:	ee                   	out    %al,(%dx)
}
   421e4:	90                   	nop
   421e5:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   421ec:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421f0:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   421f4:	8b 55 ec             	mov    -0x14(%rbp),%edx
   421f7:	ee                   	out    %al,(%dx)
}
   421f8:	90                   	nop
   421f9:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   42200:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42204:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42208:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4220b:	ee                   	out    %al,(%dx)
}
   4220c:	90                   	nop
   4220d:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   42214:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42218:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4221c:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4221f:	ee                   	out    %al,(%dx)
}
   42220:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   42221:	e8 a5 fe ff ff       	callq  420cb <interrupt_mask>
}
   42226:	90                   	nop
   42227:	c9                   	leaveq 
   42228:	c3                   	retq   

0000000000042229 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   42229:	55                   	push   %rbp
   4222a:	48 89 e5             	mov    %rsp,%rbp
   4222d:	48 83 ec 28          	sub    $0x28,%rsp
   42231:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   42234:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42238:	0f 8e 9f 00 00 00    	jle    422dd <timer_init+0xb4>
   4223e:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   42245:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42249:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4224d:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42250:	ee                   	out    %al,(%dx)
}
   42251:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   42252:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42255:	89 c2                	mov    %eax,%edx
   42257:	c1 ea 1f             	shr    $0x1f,%edx
   4225a:	01 d0                	add    %edx,%eax
   4225c:	d1 f8                	sar    %eax
   4225e:	05 de 34 12 00       	add    $0x1234de,%eax
   42263:	99                   	cltd   
   42264:	f7 7d dc             	idivl  -0x24(%rbp)
   42267:	89 c2                	mov    %eax,%edx
   42269:	89 d0                	mov    %edx,%eax
   4226b:	c1 f8 1f             	sar    $0x1f,%eax
   4226e:	c1 e8 18             	shr    $0x18,%eax
   42271:	89 c1                	mov    %eax,%ecx
   42273:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   42276:	0f b6 c0             	movzbl %al,%eax
   42279:	29 c8                	sub    %ecx,%eax
   4227b:	0f b6 c0             	movzbl %al,%eax
   4227e:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   42285:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42288:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4228c:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4228f:	ee                   	out    %al,(%dx)
}
   42290:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   42291:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42294:	89 c2                	mov    %eax,%edx
   42296:	c1 ea 1f             	shr    $0x1f,%edx
   42299:	01 d0                	add    %edx,%eax
   4229b:	d1 f8                	sar    %eax
   4229d:	05 de 34 12 00       	add    $0x1234de,%eax
   422a2:	99                   	cltd   
   422a3:	f7 7d dc             	idivl  -0x24(%rbp)
   422a6:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   422ac:	85 c0                	test   %eax,%eax
   422ae:	0f 48 c2             	cmovs  %edx,%eax
   422b1:	c1 f8 08             	sar    $0x8,%eax
   422b4:	0f b6 c0             	movzbl %al,%eax
   422b7:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   422be:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   422c1:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   422c5:	8b 55 fc             	mov    -0x4(%rbp),%edx
   422c8:	ee                   	out    %al,(%dx)
}
   422c9:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   422ca:	0f b7 05 2f e0 00 00 	movzwl 0xe02f(%rip),%eax        # 50300 <interrupts_enabled>
   422d1:	83 c8 01             	or     $0x1,%eax
   422d4:	66 89 05 25 e0 00 00 	mov    %ax,0xe025(%rip)        # 50300 <interrupts_enabled>
   422db:	eb 11                	jmp    422ee <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   422dd:	0f b7 05 1c e0 00 00 	movzwl 0xe01c(%rip),%eax        # 50300 <interrupts_enabled>
   422e4:	83 e0 fe             	and    $0xfffffffe,%eax
   422e7:	66 89 05 12 e0 00 00 	mov    %ax,0xe012(%rip)        # 50300 <interrupts_enabled>
    }
    interrupt_mask();
   422ee:	e8 d8 fd ff ff       	callq  420cb <interrupt_mask>
}
   422f3:	90                   	nop
   422f4:	c9                   	leaveq 
   422f5:	c3                   	retq   

00000000000422f6 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   422f6:	55                   	push   %rbp
   422f7:	48 89 e5             	mov    %rsp,%rbp
   422fa:	48 83 ec 08          	sub    $0x8,%rsp
   422fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42302:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   42307:	74 14                	je     4231d <physical_memory_isreserved+0x27>
   42309:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42310:	00 
   42311:	76 11                	jbe    42324 <physical_memory_isreserved+0x2e>
   42313:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4231a:	00 
   4231b:	77 07                	ja     42324 <physical_memory_isreserved+0x2e>
   4231d:	b8 01 00 00 00       	mov    $0x1,%eax
   42322:	eb 05                	jmp    42329 <physical_memory_isreserved+0x33>
   42324:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42329:	c9                   	leaveq 
   4232a:	c3                   	retq   

000000000004232b <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   4232b:	55                   	push   %rbp
   4232c:	48 89 e5             	mov    %rsp,%rbp
   4232f:	48 83 ec 10          	sub    $0x10,%rsp
   42333:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42336:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42339:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   4233c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4233f:	c1 e0 10             	shl    $0x10,%eax
   42342:	89 c2                	mov    %eax,%edx
   42344:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42347:	c1 e0 0b             	shl    $0xb,%eax
   4234a:	09 c2                	or     %eax,%edx
   4234c:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4234f:	c1 e0 08             	shl    $0x8,%eax
   42352:	09 d0                	or     %edx,%eax
}
   42354:	c9                   	leaveq 
   42355:	c3                   	retq   

0000000000042356 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   42356:	55                   	push   %rbp
   42357:	48 89 e5             	mov    %rsp,%rbp
   4235a:	48 83 ec 18          	sub    $0x18,%rsp
   4235e:	89 7d ec             	mov    %edi,-0x14(%rbp)
   42361:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   42364:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42367:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4236a:	09 d0                	or     %edx,%eax
   4236c:	0d 00 00 00 80       	or     $0x80000000,%eax
   42371:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   42378:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   4237b:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4237e:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42381:	ef                   	out    %eax,(%dx)
}
   42382:	90                   	nop
   42383:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   4238a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4238d:	89 c2                	mov    %eax,%edx
   4238f:	ed                   	in     (%dx),%eax
   42390:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   42393:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   42396:	c9                   	leaveq 
   42397:	c3                   	retq   

0000000000042398 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   42398:	55                   	push   %rbp
   42399:	48 89 e5             	mov    %rsp,%rbp
   4239c:	48 83 ec 28          	sub    $0x28,%rsp
   423a0:	89 7d dc             	mov    %edi,-0x24(%rbp)
   423a3:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   423a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   423ad:	eb 73                	jmp    42422 <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   423af:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   423b6:	eb 60                	jmp    42418 <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   423b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   423bf:	eb 4a                	jmp    4240b <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   423c1:	8b 55 f4             	mov    -0xc(%rbp),%edx
   423c4:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   423c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   423ca:	89 ce                	mov    %ecx,%esi
   423cc:	89 c7                	mov    %eax,%edi
   423ce:	e8 58 ff ff ff       	callq  4232b <pci_make_configaddr>
   423d3:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   423d6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   423d9:	be 00 00 00 00       	mov    $0x0,%esi
   423de:	89 c7                	mov    %eax,%edi
   423e0:	e8 71 ff ff ff       	callq  42356 <pci_config_readl>
   423e5:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   423e8:	8b 45 d8             	mov    -0x28(%rbp),%eax
   423eb:	c1 e0 10             	shl    $0x10,%eax
   423ee:	0b 45 dc             	or     -0x24(%rbp),%eax
   423f1:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   423f4:	75 05                	jne    423fb <pci_find_device+0x63>
                    return configaddr;
   423f6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   423f9:	eb 35                	jmp    42430 <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   423fb:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   423ff:	75 06                	jne    42407 <pci_find_device+0x6f>
   42401:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42405:	74 0c                	je     42413 <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   42407:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4240b:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   4240f:	75 b0                	jne    423c1 <pci_find_device+0x29>
   42411:	eb 01                	jmp    42414 <pci_find_device+0x7c>
                    break;
   42413:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   42414:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42418:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   4241c:	75 9a                	jne    423b8 <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   4241e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42422:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   42429:	75 84                	jne    423af <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   4242b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42430:	c9                   	leaveq 
   42431:	c3                   	retq   

0000000000042432 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   42432:	55                   	push   %rbp
   42433:	48 89 e5             	mov    %rsp,%rbp
   42436:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   4243a:	be 13 71 00 00       	mov    $0x7113,%esi
   4243f:	bf 86 80 00 00       	mov    $0x8086,%edi
   42444:	e8 4f ff ff ff       	callq  42398 <pci_find_device>
   42449:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   4244c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   42450:	78 30                	js     42482 <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   42452:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42455:	be 40 00 00 00       	mov    $0x40,%esi
   4245a:	89 c7                	mov    %eax,%edi
   4245c:	e8 f5 fe ff ff       	callq  42356 <pci_config_readl>
   42461:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42466:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42469:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4246c:	83 c0 04             	add    $0x4,%eax
   4246f:	89 45 f4             	mov    %eax,-0xc(%rbp)
   42472:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42478:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   4247c:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4247f:	66 ef                	out    %ax,(%dx)
}
   42481:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   42482:	ba 00 46 04 00       	mov    $0x44600,%edx
   42487:	be 00 c0 00 00       	mov    $0xc000,%esi
   4248c:	bf 80 07 00 00       	mov    $0x780,%edi
   42491:	b8 00 00 00 00       	mov    $0x0,%eax
   42496:	e8 50 1c 00 00       	callq  440eb <console_printf>
 spinloop: goto spinloop;
   4249b:	eb fe                	jmp    4249b <poweroff+0x69>

000000000004249d <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   4249d:	55                   	push   %rbp
   4249e:	48 89 e5             	mov    %rsp,%rbp
   424a1:	48 83 ec 10          	sub    $0x10,%rsp
   424a5:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   424ac:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   424b0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   424b4:	8b 55 fc             	mov    -0x4(%rbp),%edx
   424b7:	ee                   	out    %al,(%dx)
}
   424b8:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   424b9:	eb fe                	jmp    424b9 <reboot+0x1c>

00000000000424bb <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   424bb:	55                   	push   %rbp
   424bc:	48 89 e5             	mov    %rsp,%rbp
   424bf:	48 83 ec 10          	sub    $0x10,%rsp
   424c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   424c7:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   424ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   424ce:	48 83 c0 08          	add    $0x8,%rax
   424d2:	ba c0 00 00 00       	mov    $0xc0,%edx
   424d7:	be 00 00 00 00       	mov    $0x0,%esi
   424dc:	48 89 c7             	mov    %rax,%rdi
   424df:	e8 d2 13 00 00       	callq  438b6 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   424e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   424e8:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   424ef:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   424f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   424f5:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   424fc:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   42500:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42504:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   4250b:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   4250f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42513:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   4251a:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   4251c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42520:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42527:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   4252b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4252e:	83 e0 01             	and    $0x1,%eax
   42531:	85 c0                	test   %eax,%eax
   42533:	74 1c                	je     42551 <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   42535:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42539:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42540:	80 cc 30             	or     $0x30,%ah
   42543:	48 89 c2             	mov    %rax,%rdx
   42546:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4254a:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42551:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42554:	83 e0 02             	and    $0x2,%eax
   42557:	85 c0                	test   %eax,%eax
   42559:	74 1c                	je     42577 <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   4255b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4255f:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42566:	80 e4 fd             	and    $0xfd,%ah
   42569:	48 89 c2             	mov    %rax,%rdx
   4256c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42570:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42577:	90                   	nop
   42578:	c9                   	leaveq 
   42579:	c3                   	retq   

000000000004257a <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   4257a:	55                   	push   %rbp
   4257b:	48 89 e5             	mov    %rsp,%rbp
   4257e:	48 83 ec 28          	sub    $0x28,%rsp
   42582:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   42585:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42589:	78 09                	js     42594 <console_show_cursor+0x1a>
   4258b:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42592:	7e 07                	jle    4259b <console_show_cursor+0x21>
        cpos = 0;
   42594:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   4259b:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   425a2:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425a6:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   425aa:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   425ad:	ee                   	out    %al,(%dx)
}
   425ae:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   425af:	8b 45 dc             	mov    -0x24(%rbp),%eax
   425b2:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   425b8:	85 c0                	test   %eax,%eax
   425ba:	0f 48 c2             	cmovs  %edx,%eax
   425bd:	c1 f8 08             	sar    $0x8,%eax
   425c0:	0f b6 c0             	movzbl %al,%eax
   425c3:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   425ca:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425cd:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   425d1:	8b 55 ec             	mov    -0x14(%rbp),%edx
   425d4:	ee                   	out    %al,(%dx)
}
   425d5:	90                   	nop
   425d6:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   425dd:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425e1:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   425e5:	8b 55 f4             	mov    -0xc(%rbp),%edx
   425e8:	ee                   	out    %al,(%dx)
}
   425e9:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   425ea:	8b 45 dc             	mov    -0x24(%rbp),%eax
   425ed:	99                   	cltd   
   425ee:	c1 ea 18             	shr    $0x18,%edx
   425f1:	01 d0                	add    %edx,%eax
   425f3:	0f b6 c0             	movzbl %al,%eax
   425f6:	29 d0                	sub    %edx,%eax
   425f8:	0f b6 c0             	movzbl %al,%eax
   425fb:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42602:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42605:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42609:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4260c:	ee                   	out    %al,(%dx)
}
   4260d:	90                   	nop
}
   4260e:	90                   	nop
   4260f:	c9                   	leaveq 
   42610:	c3                   	retq   

0000000000042611 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42611:	55                   	push   %rbp
   42612:	48 89 e5             	mov    %rsp,%rbp
   42615:	48 83 ec 20          	sub    $0x20,%rsp
   42619:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42620:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42623:	89 c2                	mov    %eax,%edx
   42625:	ec                   	in     (%dx),%al
   42626:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42629:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   4262d:	0f b6 c0             	movzbl %al,%eax
   42630:	83 e0 01             	and    $0x1,%eax
   42633:	85 c0                	test   %eax,%eax
   42635:	75 0a                	jne    42641 <keyboard_readc+0x30>
        return -1;
   42637:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4263c:	e9 e7 01 00 00       	jmpq   42828 <keyboard_readc+0x217>
   42641:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42648:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4264b:	89 c2                	mov    %eax,%edx
   4264d:	ec                   	in     (%dx),%al
   4264e:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   42651:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   42655:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42658:	0f b6 05 a3 dc 00 00 	movzbl 0xdca3(%rip),%eax        # 50302 <last_escape.2>
   4265f:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   42662:	c6 05 99 dc 00 00 00 	movb   $0x0,0xdc99(%rip)        # 50302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42669:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   4266d:	75 11                	jne    42680 <keyboard_readc+0x6f>
        last_escape = 0x80;
   4266f:	c6 05 8c dc 00 00 80 	movb   $0x80,0xdc8c(%rip)        # 50302 <last_escape.2>
        return 0;
   42676:	b8 00 00 00 00       	mov    $0x0,%eax
   4267b:	e9 a8 01 00 00       	jmpq   42828 <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42680:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42684:	84 c0                	test   %al,%al
   42686:	79 60                	jns    426e8 <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   42688:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4268c:	83 e0 7f             	and    $0x7f,%eax
   4268f:	89 c2                	mov    %eax,%edx
   42691:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   42695:	09 d0                	or     %edx,%eax
   42697:	48 98                	cltq   
   42699:	0f b6 80 20 46 04 00 	movzbl 0x44620(%rax),%eax
   426a0:	0f b6 c0             	movzbl %al,%eax
   426a3:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   426a6:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   426ad:	7e 2f                	jle    426de <keyboard_readc+0xcd>
   426af:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   426b6:	7f 26                	jg     426de <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   426b8:	8b 45 f4             	mov    -0xc(%rbp),%eax
   426bb:	2d fa 00 00 00       	sub    $0xfa,%eax
   426c0:	ba 01 00 00 00       	mov    $0x1,%edx
   426c5:	89 c1                	mov    %eax,%ecx
   426c7:	d3 e2                	shl    %cl,%edx
   426c9:	89 d0                	mov    %edx,%eax
   426cb:	f7 d0                	not    %eax
   426cd:	89 c2                	mov    %eax,%edx
   426cf:	0f b6 05 2d dc 00 00 	movzbl 0xdc2d(%rip),%eax        # 50303 <modifiers.1>
   426d6:	21 d0                	and    %edx,%eax
   426d8:	88 05 25 dc 00 00    	mov    %al,0xdc25(%rip)        # 50303 <modifiers.1>
        }
        return 0;
   426de:	b8 00 00 00 00       	mov    $0x0,%eax
   426e3:	e9 40 01 00 00       	jmpq   42828 <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   426e8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   426ec:	0a 45 fa             	or     -0x6(%rbp),%al
   426ef:	0f b6 c0             	movzbl %al,%eax
   426f2:	48 98                	cltq   
   426f4:	0f b6 80 20 46 04 00 	movzbl 0x44620(%rax),%eax
   426fb:	0f b6 c0             	movzbl %al,%eax
   426fe:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42701:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   42705:	7e 57                	jle    4275e <keyboard_readc+0x14d>
   42707:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   4270b:	7f 51                	jg     4275e <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   4270d:	0f b6 05 ef db 00 00 	movzbl 0xdbef(%rip),%eax        # 50303 <modifiers.1>
   42714:	0f b6 c0             	movzbl %al,%eax
   42717:	83 e0 02             	and    $0x2,%eax
   4271a:	85 c0                	test   %eax,%eax
   4271c:	74 09                	je     42727 <keyboard_readc+0x116>
            ch -= 0x60;
   4271e:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42722:	e9 fd 00 00 00       	jmpq   42824 <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42727:	0f b6 05 d5 db 00 00 	movzbl 0xdbd5(%rip),%eax        # 50303 <modifiers.1>
   4272e:	0f b6 c0             	movzbl %al,%eax
   42731:	83 e0 01             	and    $0x1,%eax
   42734:	85 c0                	test   %eax,%eax
   42736:	0f 94 c2             	sete   %dl
   42739:	0f b6 05 c3 db 00 00 	movzbl 0xdbc3(%rip),%eax        # 50303 <modifiers.1>
   42740:	0f b6 c0             	movzbl %al,%eax
   42743:	83 e0 08             	and    $0x8,%eax
   42746:	85 c0                	test   %eax,%eax
   42748:	0f 94 c0             	sete   %al
   4274b:	31 d0                	xor    %edx,%eax
   4274d:	84 c0                	test   %al,%al
   4274f:	0f 84 cf 00 00 00    	je     42824 <keyboard_readc+0x213>
            ch -= 0x20;
   42755:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42759:	e9 c6 00 00 00       	jmpq   42824 <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   4275e:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42765:	7e 30                	jle    42797 <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42767:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4276a:	2d fa 00 00 00       	sub    $0xfa,%eax
   4276f:	ba 01 00 00 00       	mov    $0x1,%edx
   42774:	89 c1                	mov    %eax,%ecx
   42776:	d3 e2                	shl    %cl,%edx
   42778:	89 d0                	mov    %edx,%eax
   4277a:	89 c2                	mov    %eax,%edx
   4277c:	0f b6 05 80 db 00 00 	movzbl 0xdb80(%rip),%eax        # 50303 <modifiers.1>
   42783:	31 d0                	xor    %edx,%eax
   42785:	88 05 78 db 00 00    	mov    %al,0xdb78(%rip)        # 50303 <modifiers.1>
        ch = 0;
   4278b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42792:	e9 8e 00 00 00       	jmpq   42825 <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   42797:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   4279e:	7e 2d                	jle    427cd <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   427a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   427a3:	2d fa 00 00 00       	sub    $0xfa,%eax
   427a8:	ba 01 00 00 00       	mov    $0x1,%edx
   427ad:	89 c1                	mov    %eax,%ecx
   427af:	d3 e2                	shl    %cl,%edx
   427b1:	89 d0                	mov    %edx,%eax
   427b3:	89 c2                	mov    %eax,%edx
   427b5:	0f b6 05 47 db 00 00 	movzbl 0xdb47(%rip),%eax        # 50303 <modifiers.1>
   427bc:	09 d0                	or     %edx,%eax
   427be:	88 05 3f db 00 00    	mov    %al,0xdb3f(%rip)        # 50303 <modifiers.1>
        ch = 0;
   427c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   427cb:	eb 58                	jmp    42825 <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   427cd:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   427d1:	7e 31                	jle    42804 <keyboard_readc+0x1f3>
   427d3:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   427da:	7f 28                	jg     42804 <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   427dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   427df:	8d 50 80             	lea    -0x80(%rax),%edx
   427e2:	0f b6 05 1a db 00 00 	movzbl 0xdb1a(%rip),%eax        # 50303 <modifiers.1>
   427e9:	0f b6 c0             	movzbl %al,%eax
   427ec:	83 e0 03             	and    $0x3,%eax
   427ef:	48 98                	cltq   
   427f1:	48 63 d2             	movslq %edx,%rdx
   427f4:	0f b6 84 90 20 47 04 	movzbl 0x44720(%rax,%rdx,4),%eax
   427fb:	00 
   427fc:	0f b6 c0             	movzbl %al,%eax
   427ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42802:	eb 21                	jmp    42825 <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42804:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42808:	7f 1b                	jg     42825 <keyboard_readc+0x214>
   4280a:	0f b6 05 f2 da 00 00 	movzbl 0xdaf2(%rip),%eax        # 50303 <modifiers.1>
   42811:	0f b6 c0             	movzbl %al,%eax
   42814:	83 e0 02             	and    $0x2,%eax
   42817:	85 c0                	test   %eax,%eax
   42819:	74 0a                	je     42825 <keyboard_readc+0x214>
        ch = 0;
   4281b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42822:	eb 01                	jmp    42825 <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   42824:	90                   	nop
    }

    return ch;
   42825:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42828:	c9                   	leaveq 
   42829:	c3                   	retq   

000000000004282a <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   4282a:	55                   	push   %rbp
   4282b:	48 89 e5             	mov    %rsp,%rbp
   4282e:	48 83 ec 20          	sub    $0x20,%rsp
   42832:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42839:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4283c:	89 c2                	mov    %eax,%edx
   4283e:	ec                   	in     (%dx),%al
   4283f:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42842:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42849:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4284c:	89 c2                	mov    %eax,%edx
   4284e:	ec                   	in     (%dx),%al
   4284f:	88 45 eb             	mov    %al,-0x15(%rbp)
   42852:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42859:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4285c:	89 c2                	mov    %eax,%edx
   4285e:	ec                   	in     (%dx),%al
   4285f:	88 45 f3             	mov    %al,-0xd(%rbp)
   42862:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42869:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4286c:	89 c2                	mov    %eax,%edx
   4286e:	ec                   	in     (%dx),%al
   4286f:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42872:	90                   	nop
   42873:	c9                   	leaveq 
   42874:	c3                   	retq   

0000000000042875 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42875:	55                   	push   %rbp
   42876:	48 89 e5             	mov    %rsp,%rbp
   42879:	48 83 ec 40          	sub    $0x40,%rsp
   4287d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42881:	89 f0                	mov    %esi,%eax
   42883:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42886:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42889:	8b 05 75 da 00 00    	mov    0xda75(%rip),%eax        # 50304 <initialized.0>
   4288f:	85 c0                	test   %eax,%eax
   42891:	75 1e                	jne    428b1 <parallel_port_putc+0x3c>
   42893:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   4289a:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4289e:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   428a2:	8b 55 f8             	mov    -0x8(%rbp),%edx
   428a5:	ee                   	out    %al,(%dx)
}
   428a6:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   428a7:	c7 05 53 da 00 00 01 	movl   $0x1,0xda53(%rip)        # 50304 <initialized.0>
   428ae:	00 00 00 
    }

    for (int i = 0;
   428b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   428b8:	eb 09                	jmp    428c3 <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   428ba:	e8 6b ff ff ff       	callq  4282a <delay>
         ++i) {
   428bf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   428c3:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   428ca:	7f 18                	jg     428e4 <parallel_port_putc+0x6f>
   428cc:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   428d3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   428d6:	89 c2                	mov    %eax,%edx
   428d8:	ec                   	in     (%dx),%al
   428d9:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   428dc:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   428e0:	84 c0                	test   %al,%al
   428e2:	79 d6                	jns    428ba <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   428e4:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   428e8:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   428ef:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428f2:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   428f6:	8b 55 d8             	mov    -0x28(%rbp),%edx
   428f9:	ee                   	out    %al,(%dx)
}
   428fa:	90                   	nop
   428fb:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42902:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42906:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   4290a:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4290d:	ee                   	out    %al,(%dx)
}
   4290e:	90                   	nop
   4290f:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   42916:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4291a:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   4291e:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42921:	ee                   	out    %al,(%dx)
}
   42922:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   42923:	90                   	nop
   42924:	c9                   	leaveq 
   42925:	c3                   	retq   

0000000000042926 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   42926:	55                   	push   %rbp
   42927:	48 89 e5             	mov    %rsp,%rbp
   4292a:	48 83 ec 20          	sub    $0x20,%rsp
   4292e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42932:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42936:	48 c7 45 f8 75 28 04 	movq   $0x42875,-0x8(%rbp)
   4293d:	00 
    printer_vprintf(&p, 0, format, val);
   4293e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42942:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42946:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   4294a:	be 00 00 00 00       	mov    $0x0,%esi
   4294f:	48 89 c7             	mov    %rax,%rdi
   42952:	e8 70 10 00 00       	callq  439c7 <printer_vprintf>
}
   42957:	90                   	nop
   42958:	c9                   	leaveq 
   42959:	c3                   	retq   

000000000004295a <log_printf>:

void log_printf(const char* format, ...) {
   4295a:	55                   	push   %rbp
   4295b:	48 89 e5             	mov    %rsp,%rbp
   4295e:	48 83 ec 60          	sub    $0x60,%rsp
   42962:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42966:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   4296a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4296e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42972:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42976:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4297a:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42981:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42985:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42989:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4298d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42991:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   42995:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42999:	48 89 d6             	mov    %rdx,%rsi
   4299c:	48 89 c7             	mov    %rax,%rdi
   4299f:	e8 82 ff ff ff       	callq  42926 <log_vprintf>
    va_end(val);
}
   429a4:	90                   	nop
   429a5:	c9                   	leaveq 
   429a6:	c3                   	retq   

00000000000429a7 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   429a7:	55                   	push   %rbp
   429a8:	48 89 e5             	mov    %rsp,%rbp
   429ab:	48 83 ec 40          	sub    $0x40,%rsp
   429af:	89 7d dc             	mov    %edi,-0x24(%rbp)
   429b2:	89 75 d8             	mov    %esi,-0x28(%rbp)
   429b5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   429b9:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   429bd:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   429c1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   429c5:	48 8b 0a             	mov    (%rdx),%rcx
   429c8:	48 89 08             	mov    %rcx,(%rax)
   429cb:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   429cf:	48 89 48 08          	mov    %rcx,0x8(%rax)
   429d3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   429d7:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   429db:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   429df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   429e3:	48 89 d6             	mov    %rdx,%rsi
   429e6:	48 89 c7             	mov    %rax,%rdi
   429e9:	e8 38 ff ff ff       	callq  42926 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   429ee:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   429f2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   429f6:	8b 75 d8             	mov    -0x28(%rbp),%esi
   429f9:	8b 45 dc             	mov    -0x24(%rbp),%eax
   429fc:	89 c7                	mov    %eax,%edi
   429fe:	e8 a3 16 00 00       	callq  440a6 <console_vprintf>
}
   42a03:	c9                   	leaveq 
   42a04:	c3                   	retq   

0000000000042a05 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   42a05:	55                   	push   %rbp
   42a06:	48 89 e5             	mov    %rsp,%rbp
   42a09:	48 83 ec 60          	sub    $0x60,%rsp
   42a0d:	89 7d ac             	mov    %edi,-0x54(%rbp)
   42a10:	89 75 a8             	mov    %esi,-0x58(%rbp)
   42a13:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   42a17:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42a1b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42a1f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42a23:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42a2a:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42a2e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42a32:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42a36:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42a3a:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42a3e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   42a42:	8b 75 a8             	mov    -0x58(%rbp),%esi
   42a45:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42a48:	89 c7                	mov    %eax,%edi
   42a4a:	e8 58 ff ff ff       	callq  429a7 <error_vprintf>
   42a4f:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   42a52:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   42a55:	c9                   	leaveq 
   42a56:	c3                   	retq   

0000000000042a57 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42a57:	55                   	push   %rbp
   42a58:	48 89 e5             	mov    %rsp,%rbp
   42a5b:	53                   	push   %rbx
   42a5c:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   42a60:	e8 ac fb ff ff       	callq  42611 <keyboard_readc>
   42a65:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42a68:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42a6c:	74 1c                	je     42a8a <check_keyboard+0x33>
   42a6e:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   42a72:	74 16                	je     42a8a <check_keyboard+0x33>
   42a74:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42a78:	74 10                	je     42a8a <check_keyboard+0x33>
   42a7a:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42a7e:	74 0a                	je     42a8a <check_keyboard+0x33>
   42a80:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42a84:	0f 85 e9 00 00 00    	jne    42b73 <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42a8a:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   42a91:	00 
        memset(pt, 0, PAGESIZE * 3);
   42a92:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42a96:	ba 00 30 00 00       	mov    $0x3000,%edx
   42a9b:	be 00 00 00 00       	mov    $0x0,%esi
   42aa0:	48 89 c7             	mov    %rax,%rdi
   42aa3:	e8 0e 0e 00 00       	callq  438b6 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42aa8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42aac:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   42ab3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42ab7:	48 05 00 10 00 00    	add    $0x1000,%rax
   42abd:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   42ac4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42ac8:	48 05 00 20 00 00    	add    $0x2000,%rax
   42ace:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   42ad5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42ad9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42add:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42ae1:	0f 22 d8             	mov    %rax,%cr3
}
   42ae4:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   42ae5:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42aec:	48 c7 45 e8 78 47 04 	movq   $0x44778,-0x18(%rbp)
   42af3:	00 
        if (c == 'a') {
   42af4:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42af8:	75 0a                	jne    42b04 <check_keyboard+0xad>
            argument = "allocator";
   42afa:	48 c7 45 e8 7d 47 04 	movq   $0x4477d,-0x18(%rbp)
   42b01:	00 
   42b02:	eb 2e                	jmp    42b32 <check_keyboard+0xdb>
        } else if (c == 'e') {
   42b04:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42b08:	75 0a                	jne    42b14 <check_keyboard+0xbd>
            argument = "forkexit";
   42b0a:	48 c7 45 e8 87 47 04 	movq   $0x44787,-0x18(%rbp)
   42b11:	00 
   42b12:	eb 1e                	jmp    42b32 <check_keyboard+0xdb>
        }
        else if (c == 't'){
   42b14:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42b18:	75 0a                	jne    42b24 <check_keyboard+0xcd>
            argument = "test";
   42b1a:	48 c7 45 e8 90 47 04 	movq   $0x44790,-0x18(%rbp)
   42b21:	00 
   42b22:	eb 0e                	jmp    42b32 <check_keyboard+0xdb>
        }
        else if(c == '2'){
   42b24:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42b28:	75 08                	jne    42b32 <check_keyboard+0xdb>
            argument = "test2";
   42b2a:	48 c7 45 e8 95 47 04 	movq   $0x44795,-0x18(%rbp)
   42b31:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   42b32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42b36:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   42b3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42b3f:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   42b43:	76 14                	jbe    42b59 <check_keyboard+0x102>
   42b45:	ba 9b 47 04 00       	mov    $0x4479b,%edx
   42b4a:	be 5c 02 00 00       	mov    $0x25c,%esi
   42b4f:	bf b7 47 04 00       	mov    $0x447b7,%edi
   42b54:	e8 1f 01 00 00       	callq  42c78 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42b59:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42b5d:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42b60:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   42b64:	48 89 c3             	mov    %rax,%rbx
   42b67:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42b6c:	e9 8f d4 ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42b71:	eb 11                	jmp    42b84 <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   42b73:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   42b77:	74 06                	je     42b7f <check_keyboard+0x128>
   42b79:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42b7d:	75 05                	jne    42b84 <check_keyboard+0x12d>
        poweroff();
   42b7f:	e8 ae f8 ff ff       	callq  42432 <poweroff>
    }
    return c;
   42b84:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   42b87:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42b8b:	c9                   	leaveq 
   42b8c:	c3                   	retq   

0000000000042b8d <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42b8d:	55                   	push   %rbp
   42b8e:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   42b91:	e8 c1 fe ff ff       	callq  42a57 <check_keyboard>
   42b96:	eb f9                	jmp    42b91 <fail+0x4>

0000000000042b98 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42b98:	55                   	push   %rbp
   42b99:	48 89 e5             	mov    %rsp,%rbp
   42b9c:	48 83 ec 60          	sub    $0x60,%rsp
   42ba0:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42ba4:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42ba8:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42bac:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42bb0:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42bb4:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42bb8:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42bbf:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42bc3:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42bc7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42bcb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42bcf:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   42bd4:	0f 84 80 00 00 00    	je     42c5a <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42bda:	ba c4 47 04 00       	mov    $0x447c4,%edx
   42bdf:	be 00 c0 00 00       	mov    $0xc000,%esi
   42be4:	bf 30 07 00 00       	mov    $0x730,%edi
   42be9:	b8 00 00 00 00       	mov    $0x0,%eax
   42bee:	e8 12 fe ff ff       	callq  42a05 <error_printf>
   42bf3:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   42bf6:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42bfa:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42bfe:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42c01:	be 00 c0 00 00       	mov    $0xc000,%esi
   42c06:	89 c7                	mov    %eax,%edi
   42c08:	e8 9a fd ff ff       	callq  429a7 <error_vprintf>
   42c0d:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42c10:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   42c13:	48 63 c1             	movslq %ecx,%rax
   42c16:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42c1d:	48 c1 e8 20          	shr    $0x20,%rax
   42c21:	c1 f8 05             	sar    $0x5,%eax
   42c24:	89 ce                	mov    %ecx,%esi
   42c26:	c1 fe 1f             	sar    $0x1f,%esi
   42c29:	29 f0                	sub    %esi,%eax
   42c2b:	89 c2                	mov    %eax,%edx
   42c2d:	89 d0                	mov    %edx,%eax
   42c2f:	c1 e0 02             	shl    $0x2,%eax
   42c32:	01 d0                	add    %edx,%eax
   42c34:	c1 e0 04             	shl    $0x4,%eax
   42c37:	29 c1                	sub    %eax,%ecx
   42c39:	89 ca                	mov    %ecx,%edx
   42c3b:	85 d2                	test   %edx,%edx
   42c3d:	74 34                	je     42c73 <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   42c3f:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42c42:	ba cc 47 04 00       	mov    $0x447cc,%edx
   42c47:	be 00 c0 00 00       	mov    $0xc000,%esi
   42c4c:	89 c7                	mov    %eax,%edi
   42c4e:	b8 00 00 00 00       	mov    $0x0,%eax
   42c53:	e8 ad fd ff ff       	callq  42a05 <error_printf>
   42c58:	eb 19                	jmp    42c73 <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   42c5a:	ba ce 47 04 00       	mov    $0x447ce,%edx
   42c5f:	be 00 c0 00 00       	mov    $0xc000,%esi
   42c64:	bf 30 07 00 00       	mov    $0x730,%edi
   42c69:	b8 00 00 00 00       	mov    $0x0,%eax
   42c6e:	e8 92 fd ff ff       	callq  42a05 <error_printf>
    }

    va_end(val);
    fail();
   42c73:	e8 15 ff ff ff       	callq  42b8d <fail>

0000000000042c78 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42c78:	55                   	push   %rbp
   42c79:	48 89 e5             	mov    %rsp,%rbp
   42c7c:	48 83 ec 20          	sub    $0x20,%rsp
   42c80:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42c84:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42c87:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42c8b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42c8f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42c92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42c96:	48 89 c6             	mov    %rax,%rsi
   42c99:	bf d4 47 04 00       	mov    $0x447d4,%edi
   42c9e:	b8 00 00 00 00       	mov    $0x0,%eax
   42ca3:	e8 f0 fe ff ff       	callq  42b98 <panic>

0000000000042ca8 <default_exception>:
}

void default_exception(proc* p){
   42ca8:	55                   	push   %rbp
   42ca9:	48 89 e5             	mov    %rsp,%rbp
   42cac:	48 83 ec 20          	sub    $0x20,%rsp
   42cb0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   42cb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42cb8:	48 83 c0 08          	add    $0x8,%rax
   42cbc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42cc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42cc4:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42ccb:	48 89 c6             	mov    %rax,%rsi
   42cce:	bf f2 47 04 00       	mov    $0x447f2,%edi
   42cd3:	b8 00 00 00 00       	mov    $0x0,%eax
   42cd8:	e8 bb fe ff ff       	callq  42b98 <panic>

0000000000042cdd <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42cdd:	55                   	push   %rbp
   42cde:	48 89 e5             	mov    %rsp,%rbp
   42ce1:	48 83 ec 10          	sub    $0x10,%rsp
   42ce5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42ce9:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42cec:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42cf0:	78 06                	js     42cf8 <pageindex+0x1b>
   42cf2:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   42cf6:	7e 14                	jle    42d0c <pageindex+0x2f>
   42cf8:	ba 10 48 04 00       	mov    $0x44810,%edx
   42cfd:	be 1e 00 00 00       	mov    $0x1e,%esi
   42d02:	bf 29 48 04 00       	mov    $0x44829,%edi
   42d07:	e8 6c ff ff ff       	callq  42c78 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42d0c:	b8 03 00 00 00       	mov    $0x3,%eax
   42d11:	2b 45 f4             	sub    -0xc(%rbp),%eax
   42d14:	89 c2                	mov    %eax,%edx
   42d16:	89 d0                	mov    %edx,%eax
   42d18:	c1 e0 03             	shl    $0x3,%eax
   42d1b:	01 d0                	add    %edx,%eax
   42d1d:	83 c0 0c             	add    $0xc,%eax
   42d20:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42d24:	89 c1                	mov    %eax,%ecx
   42d26:	48 d3 ea             	shr    %cl,%rdx
   42d29:	48 89 d0             	mov    %rdx,%rax
   42d2c:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   42d31:	c9                   	leaveq 
   42d32:	c3                   	retq   

0000000000042d33 <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   42d33:	55                   	push   %rbp
   42d34:	48 89 e5             	mov    %rsp,%rbp
   42d37:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   42d3b:	48 c7 05 ba e2 00 00 	movq   $0x52000,0xe2ba(%rip)        # 51000 <kernel_pagetable>
   42d42:	00 20 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   42d46:	ba 00 50 00 00       	mov    $0x5000,%edx
   42d4b:	be 00 00 00 00       	mov    $0x0,%esi
   42d50:	bf 00 20 05 00       	mov    $0x52000,%edi
   42d55:	e8 5c 0b 00 00       	callq  438b6 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   42d5a:	b8 00 30 05 00       	mov    $0x53000,%eax
   42d5f:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   42d63:	48 89 05 96 f2 00 00 	mov    %rax,0xf296(%rip)        # 52000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   42d6a:	b8 00 40 05 00       	mov    $0x54000,%eax
   42d6f:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   42d73:	48 89 05 86 02 01 00 	mov    %rax,0x10286(%rip)        # 53000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42d7a:	b8 00 50 05 00       	mov    $0x55000,%eax
   42d7f:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   42d83:	48 89 05 76 12 01 00 	mov    %rax,0x11276(%rip)        # 54000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42d8a:	b8 00 60 05 00       	mov    $0x56000,%eax
   42d8f:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   42d93:	48 89 05 6e 12 01 00 	mov    %rax,0x1126e(%rip)        # 54008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   42d9a:	48 8b 05 5f e2 00 00 	mov    0xe25f(%rip),%rax        # 51000 <kernel_pagetable>
   42da1:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   42da7:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42dac:	ba 00 00 00 00       	mov    $0x0,%edx
   42db1:	be 00 00 00 00       	mov    $0x0,%esi
   42db6:	48 89 c7             	mov    %rax,%rdi
   42db9:	e8 b9 01 00 00       	callq  42f77 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42dbe:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   42dc5:	00 
   42dc6:	eb 62                	jmp    42e2a <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   42dc8:	48 8b 0d 31 e2 00 00 	mov    0xe231(%rip),%rcx        # 51000 <kernel_pagetable>
   42dcf:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42dd3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42dd7:	48 89 ce             	mov    %rcx,%rsi
   42dda:	48 89 c7             	mov    %rax,%rdi
   42ddd:	e8 50 05 00 00       	callq  43332 <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   42de2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42de6:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42dea:	74 14                	je     42e00 <virtual_memory_init+0xcd>
   42dec:	ba 32 48 04 00       	mov    $0x44832,%edx
   42df1:	be 2d 00 00 00       	mov    $0x2d,%esi
   42df6:	bf 42 48 04 00       	mov    $0x44842,%edi
   42dfb:	e8 78 fe ff ff       	callq  42c78 <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   42e00:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42e03:	48 98                	cltq   
   42e05:	83 e0 03             	and    $0x3,%eax
   42e08:	48 83 f8 03          	cmp    $0x3,%rax
   42e0c:	74 14                	je     42e22 <virtual_memory_init+0xef>
   42e0e:	ba 48 48 04 00       	mov    $0x44848,%edx
   42e13:	be 2e 00 00 00       	mov    $0x2e,%esi
   42e18:	bf 42 48 04 00       	mov    $0x44842,%edi
   42e1d:	e8 56 fe ff ff       	callq  42c78 <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42e22:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42e29:	00 
   42e2a:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   42e31:	00 
   42e32:	76 94                	jbe    42dc8 <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   42e34:	48 8b 05 c5 e1 00 00 	mov    0xe1c5(%rip),%rax        # 51000 <kernel_pagetable>
   42e3b:	48 89 c7             	mov    %rax,%rdi
   42e3e:	e8 03 00 00 00       	callq  42e46 <set_pagetable>
}
   42e43:	90                   	nop
   42e44:	c9                   	leaveq 
   42e45:	c3                   	retq   

0000000000042e46 <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   42e46:	55                   	push   %rbp
   42e47:	48 89 e5             	mov    %rsp,%rbp
   42e4a:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42e4e:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42e52:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42e56:	25 ff 0f 00 00       	and    $0xfff,%eax
   42e5b:	48 85 c0             	test   %rax,%rax
   42e5e:	74 14                	je     42e74 <set_pagetable+0x2e>
   42e60:	ba 75 48 04 00       	mov    $0x44875,%edx
   42e65:	be 3d 00 00 00       	mov    $0x3d,%esi
   42e6a:	bf 42 48 04 00       	mov    $0x44842,%edi
   42e6f:	e8 04 fe ff ff       	callq  42c78 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   42e74:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42e79:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   42e7d:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42e81:	48 89 ce             	mov    %rcx,%rsi
   42e84:	48 89 c7             	mov    %rax,%rdi
   42e87:	e8 a6 04 00 00       	callq  43332 <virtual_memory_lookup>
   42e8c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42e90:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   42e95:	48 39 d0             	cmp    %rdx,%rax
   42e98:	74 14                	je     42eae <set_pagetable+0x68>
   42e9a:	ba 90 48 04 00       	mov    $0x44890,%edx
   42e9f:	be 3f 00 00 00       	mov    $0x3f,%esi
   42ea4:	bf 42 48 04 00       	mov    $0x44842,%edi
   42ea9:	e8 ca fd ff ff       	callq  42c78 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   42eae:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   42eb2:	48 8b 0d 47 e1 00 00 	mov    0xe147(%rip),%rcx        # 51000 <kernel_pagetable>
   42eb9:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42ebd:	48 89 ce             	mov    %rcx,%rsi
   42ec0:	48 89 c7             	mov    %rax,%rdi
   42ec3:	e8 6a 04 00 00       	callq  43332 <virtual_memory_lookup>
   42ec8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42ecc:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42ed0:	48 39 c2             	cmp    %rax,%rdx
   42ed3:	74 14                	je     42ee9 <set_pagetable+0xa3>
   42ed5:	ba f8 48 04 00       	mov    $0x448f8,%edx
   42eda:	be 41 00 00 00       	mov    $0x41,%esi
   42edf:	bf 42 48 04 00       	mov    $0x44842,%edi
   42ee4:	e8 8f fd ff ff       	callq  42c78 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42ee9:	48 8b 05 10 e1 00 00 	mov    0xe110(%rip),%rax        # 51000 <kernel_pagetable>
   42ef0:	48 89 c2             	mov    %rax,%rdx
   42ef3:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42ef7:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42efb:	48 89 ce             	mov    %rcx,%rsi
   42efe:	48 89 c7             	mov    %rax,%rdi
   42f01:	e8 2c 04 00 00       	callq  43332 <virtual_memory_lookup>
   42f06:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42f0a:	48 8b 15 ef e0 00 00 	mov    0xe0ef(%rip),%rdx        # 51000 <kernel_pagetable>
   42f11:	48 39 d0             	cmp    %rdx,%rax
   42f14:	74 14                	je     42f2a <set_pagetable+0xe4>
   42f16:	ba 58 49 04 00       	mov    $0x44958,%edx
   42f1b:	be 43 00 00 00       	mov    $0x43,%esi
   42f20:	bf 42 48 04 00       	mov    $0x44842,%edi
   42f25:	e8 4e fd ff ff       	callq  42c78 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   42f2a:	ba 77 2f 04 00       	mov    $0x42f77,%edx
   42f2f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42f33:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42f37:	48 89 ce             	mov    %rcx,%rsi
   42f3a:	48 89 c7             	mov    %rax,%rdi
   42f3d:	e8 f0 03 00 00       	callq  43332 <virtual_memory_lookup>
   42f42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42f46:	ba 77 2f 04 00       	mov    $0x42f77,%edx
   42f4b:	48 39 d0             	cmp    %rdx,%rax
   42f4e:	74 14                	je     42f64 <set_pagetable+0x11e>
   42f50:	ba c0 49 04 00       	mov    $0x449c0,%edx
   42f55:	be 45 00 00 00       	mov    $0x45,%esi
   42f5a:	bf 42 48 04 00       	mov    $0x44842,%edi
   42f5f:	e8 14 fd ff ff       	callq  42c78 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   42f64:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42f68:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42f6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42f70:	0f 22 d8             	mov    %rax,%cr3
}
   42f73:	90                   	nop
}
   42f74:	90                   	nop
   42f75:	c9                   	leaveq 
   42f76:	c3                   	retq   

0000000000042f77 <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   42f77:	55                   	push   %rbp
   42f78:	48 89 e5             	mov    %rsp,%rbp
   42f7b:	53                   	push   %rbx
   42f7c:	48 83 ec 58          	sub    $0x58,%rsp
   42f80:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42f84:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42f88:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42f8c:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42f90:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42f94:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42f98:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f9d:	48 85 c0             	test   %rax,%rax
   42fa0:	74 14                	je     42fb6 <virtual_memory_map+0x3f>
   42fa2:	ba 26 4a 04 00       	mov    $0x44a26,%edx
   42fa7:	be 63 00 00 00       	mov    $0x63,%esi
   42fac:	bf 42 48 04 00       	mov    $0x44842,%edi
   42fb1:	e8 c2 fc ff ff       	callq  42c78 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   42fb6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42fba:	25 ff 0f 00 00       	and    $0xfff,%eax
   42fbf:	48 85 c0             	test   %rax,%rax
   42fc2:	74 14                	je     42fd8 <virtual_memory_map+0x61>
   42fc4:	ba 39 4a 04 00       	mov    $0x44a39,%edx
   42fc9:	be 64 00 00 00       	mov    $0x64,%esi
   42fce:	bf 42 48 04 00       	mov    $0x44842,%edi
   42fd3:	e8 a0 fc ff ff       	callq  42c78 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42fd8:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42fdc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42fe0:	48 01 d0             	add    %rdx,%rax
   42fe3:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42fe7:	76 24                	jbe    4300d <virtual_memory_map+0x96>
   42fe9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42fed:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42ff1:	48 01 d0             	add    %rdx,%rax
   42ff4:	48 85 c0             	test   %rax,%rax
   42ff7:	74 14                	je     4300d <virtual_memory_map+0x96>
   42ff9:	ba 4c 4a 04 00       	mov    $0x44a4c,%edx
   42ffe:	be 65 00 00 00       	mov    $0x65,%esi
   43003:	bf 42 48 04 00       	mov    $0x44842,%edi
   43008:	e8 6b fc ff ff       	callq  42c78 <assert_fail>
    if (perm & PTE_P) {
   4300d:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43010:	48 98                	cltq   
   43012:	83 e0 01             	and    $0x1,%eax
   43015:	48 85 c0             	test   %rax,%rax
   43018:	74 6e                	je     43088 <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   4301a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4301e:	25 ff 0f 00 00       	and    $0xfff,%eax
   43023:	48 85 c0             	test   %rax,%rax
   43026:	74 14                	je     4303c <virtual_memory_map+0xc5>
   43028:	ba 6a 4a 04 00       	mov    $0x44a6a,%edx
   4302d:	be 67 00 00 00       	mov    $0x67,%esi
   43032:	bf 42 48 04 00       	mov    $0x44842,%edi
   43037:	e8 3c fc ff ff       	callq  42c78 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   4303c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43040:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43044:	48 01 d0             	add    %rdx,%rax
   43047:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   4304b:	76 14                	jbe    43061 <virtual_memory_map+0xea>
   4304d:	ba 7d 4a 04 00       	mov    $0x44a7d,%edx
   43052:	be 68 00 00 00       	mov    $0x68,%esi
   43057:	bf 42 48 04 00       	mov    $0x44842,%edi
   4305c:	e8 17 fc ff ff       	callq  42c78 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   43061:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43065:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43069:	48 01 d0             	add    %rdx,%rax
   4306c:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   43072:	76 14                	jbe    43088 <virtual_memory_map+0x111>
   43074:	ba 8b 4a 04 00       	mov    $0x44a8b,%edx
   43079:	be 69 00 00 00       	mov    $0x69,%esi
   4307e:	bf 42 48 04 00       	mov    $0x44842,%edi
   43083:	e8 f0 fb ff ff       	callq  42c78 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   43088:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   4308c:	78 09                	js     43097 <virtual_memory_map+0x120>
   4308e:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   43095:	7e 14                	jle    430ab <virtual_memory_map+0x134>
   43097:	ba a7 4a 04 00       	mov    $0x44aa7,%edx
   4309c:	be 6b 00 00 00       	mov    $0x6b,%esi
   430a1:	bf 42 48 04 00       	mov    $0x44842,%edi
   430a6:	e8 cd fb ff ff       	callq  42c78 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   430ab:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   430af:	25 ff 0f 00 00       	and    $0xfff,%eax
   430b4:	48 85 c0             	test   %rax,%rax
   430b7:	74 14                	je     430cd <virtual_memory_map+0x156>
   430b9:	ba c8 4a 04 00       	mov    $0x44ac8,%edx
   430be:	be 6c 00 00 00       	mov    $0x6c,%esi
   430c3:	bf 42 48 04 00       	mov    $0x44842,%edi
   430c8:	e8 ab fb ff ff       	callq  42c78 <assert_fail>

    int last_index123 = -1;
   430cd:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   430d4:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   430db:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   430dc:	e9 e1 00 00 00       	jmpq   431c2 <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   430e1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   430e5:	48 c1 e8 15          	shr    $0x15,%rax
   430e9:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   430ec:	8b 45 dc             	mov    -0x24(%rbp),%eax
   430ef:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   430f2:	74 20                	je     43114 <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   430f4:	8b 55 ac             	mov    -0x54(%rbp),%edx
   430f7:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   430fb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   430ff:	48 89 ce             	mov    %rcx,%rsi
   43102:	48 89 c7             	mov    %rax,%rdi
   43105:	e8 ce 00 00 00       	callq  431d8 <lookup_l4pagetable>
   4310a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   4310e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43111:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   43114:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43117:	48 98                	cltq   
   43119:	83 e0 01             	and    $0x1,%eax
   4311c:	48 85 c0             	test   %rax,%rax
   4311f:	74 34                	je     43155 <virtual_memory_map+0x1de>
   43121:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43126:	74 2d                	je     43155 <virtual_memory_map+0x1de>
            // TODO
            // map `pa` at appropriate entry with permissions `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   43128:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4312b:	48 63 d8             	movslq %eax,%rbx
   4312e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43132:	be 03 00 00 00       	mov    $0x3,%esi
   43137:	48 89 c7             	mov    %rax,%rdi
   4313a:	e8 9e fb ff ff       	callq  42cdd <pageindex>
   4313f:	89 c2                	mov    %eax,%edx
   43141:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   43145:	48 89 d9             	mov    %rbx,%rcx
   43148:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4314c:	48 63 d2             	movslq %edx,%rdx
   4314f:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43153:	eb 55                	jmp    431aa <virtual_memory_map+0x233>
        } else if (l4pagetable) { // if page is NOT marked present
   43155:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4315a:	74 26                	je     43182 <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   4315c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43160:	be 03 00 00 00       	mov    $0x3,%esi
   43165:	48 89 c7             	mov    %rax,%rdi
   43168:	e8 70 fb ff ff       	callq  42cdd <pageindex>
   4316d:	89 c2                	mov    %eax,%edx
   4316f:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43172:	48 63 c8             	movslq %eax,%rcx
   43175:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43179:	48 63 d2             	movslq %edx,%rdx
   4317c:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43180:	eb 28                	jmp    431aa <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   43182:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43185:	48 98                	cltq   
   43187:	83 e0 01             	and    $0x1,%eax
   4318a:	48 85 c0             	test   %rax,%rax
   4318d:	74 1b                	je     431aa <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   4318f:	be 84 00 00 00       	mov    $0x84,%esi
   43194:	bf f0 4a 04 00       	mov    $0x44af0,%edi
   43199:	b8 00 00 00 00       	mov    $0x0,%eax
   4319e:	e8 b7 f7 ff ff       	callq  4295a <log_printf>
            return -1;
   431a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   431a8:	eb 28                	jmp    431d2 <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   431aa:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   431b1:	00 
   431b2:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   431b9:	00 
   431ba:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   431c1:	00 
   431c2:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   431c7:	0f 85 14 ff ff ff    	jne    430e1 <virtual_memory_map+0x16a>
        }
    }
    return 0;
   431cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
   431d2:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   431d6:	c9                   	leaveq 
   431d7:	c3                   	retq   

00000000000431d8 <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   431d8:	55                   	push   %rbp
   431d9:	48 89 e5             	mov    %rsp,%rbp
   431dc:	48 83 ec 40          	sub    $0x40,%rsp
   431e0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   431e4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   431e8:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   431eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   431ef:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   431f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   431fa:	e9 23 01 00 00       	jmpq   43322 <lookup_l4pagetable+0x14a>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   431ff:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43202:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43206:	89 d6                	mov    %edx,%esi
   43208:	48 89 c7             	mov    %rax,%rdi
   4320b:	e8 cd fa ff ff       	callq  42cdd <pageindex>
   43210:	89 c2                	mov    %eax,%edx
   43212:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43216:	48 63 d2             	movslq %edx,%rdx
   43219:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4321d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   43221:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43225:	83 e0 01             	and    $0x1,%eax
   43228:	48 85 c0             	test   %rax,%rax
   4322b:	75 63                	jne    43290 <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   4322d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   43230:	8d 48 02             	lea    0x2(%rax),%ecx
   43233:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43237:	25 ff 0f 00 00       	and    $0xfff,%eax
   4323c:	48 89 c2             	mov    %rax,%rdx
   4323f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43243:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43249:	48 89 c6             	mov    %rax,%rsi
   4324c:	bf 30 4b 04 00       	mov    $0x44b30,%edi
   43251:	b8 00 00 00 00       	mov    $0x0,%eax
   43256:	e8 ff f6 ff ff       	callq  4295a <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   4325b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4325e:	48 98                	cltq   
   43260:	83 e0 01             	and    $0x1,%eax
   43263:	48 85 c0             	test   %rax,%rax
   43266:	75 0a                	jne    43272 <lookup_l4pagetable+0x9a>
                return NULL;
   43268:	b8 00 00 00 00       	mov    $0x0,%eax
   4326d:	e9 be 00 00 00       	jmpq   43330 <lookup_l4pagetable+0x158>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   43272:	be a7 00 00 00       	mov    $0xa7,%esi
   43277:	bf 98 4b 04 00       	mov    $0x44b98,%edi
   4327c:	b8 00 00 00 00       	mov    $0x0,%eax
   43281:	e8 d4 f6 ff ff       	callq  4295a <log_printf>
            return NULL;
   43286:	b8 00 00 00 00       	mov    $0x0,%eax
   4328b:	e9 a0 00 00 00       	jmpq   43330 <lookup_l4pagetable+0x158>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   43290:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43294:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4329a:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   432a0:	76 14                	jbe    432b6 <lookup_l4pagetable+0xde>
   432a2:	ba d8 4b 04 00       	mov    $0x44bd8,%edx
   432a7:	be ac 00 00 00       	mov    $0xac,%esi
   432ac:	bf 42 48 04 00       	mov    $0x44842,%edi
   432b1:	e8 c2 f9 ff ff       	callq  42c78 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   432b6:	8b 45 cc             	mov    -0x34(%rbp),%eax
   432b9:	48 98                	cltq   
   432bb:	83 e0 02             	and    $0x2,%eax
   432be:	48 85 c0             	test   %rax,%rax
   432c1:	74 20                	je     432e3 <lookup_l4pagetable+0x10b>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   432c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   432c7:	83 e0 02             	and    $0x2,%eax
   432ca:	48 85 c0             	test   %rax,%rax
   432cd:	75 14                	jne    432e3 <lookup_l4pagetable+0x10b>
   432cf:	ba f8 4b 04 00       	mov    $0x44bf8,%edx
   432d4:	be ae 00 00 00       	mov    $0xae,%esi
   432d9:	bf 42 48 04 00       	mov    $0x44842,%edi
   432de:	e8 95 f9 ff ff       	callq  42c78 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   432e3:	8b 45 cc             	mov    -0x34(%rbp),%eax
   432e6:	48 98                	cltq   
   432e8:	83 e0 04             	and    $0x4,%eax
   432eb:	48 85 c0             	test   %rax,%rax
   432ee:	74 20                	je     43310 <lookup_l4pagetable+0x138>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   432f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   432f4:	83 e0 04             	and    $0x4,%eax
   432f7:	48 85 c0             	test   %rax,%rax
   432fa:	75 14                	jne    43310 <lookup_l4pagetable+0x138>
   432fc:	ba 03 4c 04 00       	mov    $0x44c03,%edx
   43301:	be b1 00 00 00       	mov    $0xb1,%esi
   43306:	bf 42 48 04 00       	mov    $0x44842,%edi
   4330b:	e8 68 f9 ff ff       	callq  42c78 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   43310:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43314:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4331a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   4331e:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   43322:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   43326:	0f 8e d3 fe ff ff    	jle    431ff <lookup_l4pagetable+0x27>
    }
    return pt;
   4332c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   43330:	c9                   	leaveq 
   43331:	c3                   	retq   

0000000000043332 <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   43332:	55                   	push   %rbp
   43333:	48 89 e5             	mov    %rsp,%rbp
   43336:	48 83 ec 50          	sub    $0x50,%rsp
   4333a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4333e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   43342:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   43346:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4334a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   4334e:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   43355:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   43356:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   4335d:	eb 41                	jmp    433a0 <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   4335f:	8b 55 ec             	mov    -0x14(%rbp),%edx
   43362:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43366:	89 d6                	mov    %edx,%esi
   43368:	48 89 c7             	mov    %rax,%rdi
   4336b:	e8 6d f9 ff ff       	callq  42cdd <pageindex>
   43370:	89 c2                	mov    %eax,%edx
   43372:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43376:	48 63 d2             	movslq %edx,%rdx
   43379:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   4337d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43381:	83 e0 06             	and    $0x6,%eax
   43384:	48 f7 d0             	not    %rax
   43387:	48 21 d0             	and    %rdx,%rax
   4338a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   4338e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43392:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43398:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   4339c:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   433a0:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   433a4:	7f 0c                	jg     433b2 <virtual_memory_lookup+0x80>
   433a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433aa:	83 e0 01             	and    $0x1,%eax
   433ad:	48 85 c0             	test   %rax,%rax
   433b0:	75 ad                	jne    4335f <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   433b2:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   433b9:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   433c0:	ff 
   433c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   433c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433cc:	83 e0 01             	and    $0x1,%eax
   433cf:	48 85 c0             	test   %rax,%rax
   433d2:	74 34                	je     43408 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   433d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433d8:	48 c1 e8 0c          	shr    $0xc,%rax
   433dc:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   433df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433e3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   433e9:	48 89 c2             	mov    %rax,%rdx
   433ec:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   433f0:	25 ff 0f 00 00       	and    $0xfff,%eax
   433f5:	48 09 d0             	or     %rdx,%rax
   433f8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   433fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43400:	25 ff 0f 00 00       	and    $0xfff,%eax
   43405:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   43408:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4340c:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43410:	48 89 10             	mov    %rdx,(%rax)
   43413:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   43417:	48 89 50 08          	mov    %rdx,0x8(%rax)
   4341b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4341f:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   43423:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43427:	c9                   	leaveq 
   43428:	c3                   	retq   

0000000000043429 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43429:	55                   	push   %rbp
   4342a:	48 89 e5             	mov    %rsp,%rbp
   4342d:	48 83 ec 40          	sub    $0x40,%rsp
   43431:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43435:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43438:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   4343c:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   43443:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43447:	78 08                	js     43451 <program_load+0x28>
   43449:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4344c:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   4344f:	7c 14                	jl     43465 <program_load+0x3c>
   43451:	ba 10 4c 04 00       	mov    $0x44c10,%edx
   43456:	be 37 00 00 00       	mov    $0x37,%esi
   4345b:	bf 40 4c 04 00       	mov    $0x44c40,%edi
   43460:	e8 13 f8 ff ff       	callq  42c78 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   43465:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43468:	48 98                	cltq   
   4346a:	48 c1 e0 04          	shl    $0x4,%rax
   4346e:	48 05 20 50 04 00    	add    $0x45020,%rax
   43474:	48 8b 00             	mov    (%rax),%rax
   43477:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   4347b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4347f:	8b 00                	mov    (%rax),%eax
   43481:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43486:	74 14                	je     4349c <program_load+0x73>
   43488:	ba 4b 4c 04 00       	mov    $0x44c4b,%edx
   4348d:	be 39 00 00 00       	mov    $0x39,%esi
   43492:	bf 40 4c 04 00       	mov    $0x44c40,%edi
   43497:	e8 dc f7 ff ff       	callq  42c78 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   4349c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   434a0:	48 8b 50 20          	mov    0x20(%rax),%rdx
   434a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   434a8:	48 01 d0             	add    %rdx,%rax
   434ab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   434af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   434b6:	e9 94 00 00 00       	jmpq   4354f <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   434bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   434be:	48 63 d0             	movslq %eax,%rdx
   434c1:	48 89 d0             	mov    %rdx,%rax
   434c4:	48 c1 e0 03          	shl    $0x3,%rax
   434c8:	48 29 d0             	sub    %rdx,%rax
   434cb:	48 c1 e0 03          	shl    $0x3,%rax
   434cf:	48 89 c2             	mov    %rax,%rdx
   434d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434d6:	48 01 d0             	add    %rdx,%rax
   434d9:	8b 00                	mov    (%rax),%eax
   434db:	83 f8 01             	cmp    $0x1,%eax
   434de:	75 6b                	jne    4354b <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   434e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   434e3:	48 63 d0             	movslq %eax,%rdx
   434e6:	48 89 d0             	mov    %rdx,%rax
   434e9:	48 c1 e0 03          	shl    $0x3,%rax
   434ed:	48 29 d0             	sub    %rdx,%rax
   434f0:	48 c1 e0 03          	shl    $0x3,%rax
   434f4:	48 89 c2             	mov    %rax,%rdx
   434f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434fb:	48 01 d0             	add    %rdx,%rax
   434fe:	48 8b 50 08          	mov    0x8(%rax),%rdx
   43502:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43506:	48 01 d0             	add    %rdx,%rax
   43509:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   4350d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43510:	48 63 d0             	movslq %eax,%rdx
   43513:	48 89 d0             	mov    %rdx,%rax
   43516:	48 c1 e0 03          	shl    $0x3,%rax
   4351a:	48 29 d0             	sub    %rdx,%rax
   4351d:	48 c1 e0 03          	shl    $0x3,%rax
   43521:	48 89 c2             	mov    %rax,%rdx
   43524:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43528:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   4352c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43530:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43534:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43538:	48 89 c7             	mov    %rax,%rdi
   4353b:	e8 3d 00 00 00       	callq  4357d <program_load_segment>
   43540:	85 c0                	test   %eax,%eax
   43542:	79 07                	jns    4354b <program_load+0x122>
                return -1;
   43544:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43549:	eb 30                	jmp    4357b <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   4354b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4354f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43553:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43557:	0f b7 c0             	movzwl %ax,%eax
   4355a:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   4355d:	0f 8c 58 ff ff ff    	jl     434bb <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   43563:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43567:	48 8b 50 18          	mov    0x18(%rax),%rdx
   4356b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4356f:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43576:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4357b:	c9                   	leaveq 
   4357c:	c3                   	retq   

000000000004357d <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   4357d:	55                   	push   %rbp
   4357e:	48 89 e5             	mov    %rsp,%rbp
   43581:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43585:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
   43589:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
   4358d:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   43591:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   43595:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43599:	48 8b 40 10          	mov    0x10(%rax),%rax
   4359d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   435a1:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   435a5:	48 8b 50 20          	mov    0x20(%rax),%rdx
   435a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435ad:	48 01 d0             	add    %rdx,%rax
   435b0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   435b4:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   435b8:	48 8b 50 28          	mov    0x28(%rax),%rdx
   435bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435c0:	48 01 d0             	add    %rdx,%rax
   435c3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   435c7:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   435ce:	ff 

    int read_only = (ph->p_flags & ELF_PFLAG_WRITE) == 0;
   435cf:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   435d3:	8b 40 04             	mov    0x4(%rax),%eax
   435d6:	83 e0 02             	and    $0x2,%eax
   435d9:	85 c0                	test   %eax,%eax
   435db:	0f 94 c0             	sete   %al
   435de:	0f b6 c0             	movzbl %al,%eax
   435e1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    int perm = read_only ? PTE_P | PTE_U : PTE_P | PTE_W | PTE_U;
   435e4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   435e8:	74 07                	je     435f1 <program_load_segment+0x74>
   435ea:	b8 05 00 00 00       	mov    $0x5,%eax
   435ef:	eb 05                	jmp    435f6 <program_load_segment+0x79>
   435f1:	b8 07 00 00 00       	mov    $0x7,%eax
   435f6:	89 45 d0             	mov    %eax,-0x30(%rbp)
    vamapping map;

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   435f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43601:	e9 da 00 00 00       	jmpq   436e0 <program_load_segment+0x163>
        int free_page_number = get_free_page_number();
   43606:	b8 00 00 00 00       	mov    $0x0,%eax
   4360b:	e8 db cd ff ff       	callq  403eb <get_free_page_number>
   43610:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (free_page_number < 0) {
   43613:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
   43617:	79 32                	jns    4364b <program_load_segment+0xce>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43619:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4361d:	8b 00                	mov    (%rax),%eax
   4361f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43623:	49 89 d0             	mov    %rdx,%r8
   43626:	89 c1                	mov    %eax,%ecx
   43628:	ba 68 4c 04 00       	mov    $0x44c68,%edx
   4362d:	be 00 c0 00 00       	mov    $0xc000,%esi
   43632:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43637:	b8 00 00 00 00       	mov    $0x0,%eax
   4363c:	e8 aa 0a 00 00       	callq  440eb <console_printf>
            return -1;
   43641:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43646:	e9 64 01 00 00       	jmpq   437af <program_load_segment+0x232>
        }

        uintptr_t new_addr = PAGEADDRESS(free_page_number);
   4364b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4364e:	48 98                	cltq   
   43650:	48 c1 e0 0c          	shl    $0xc,%rax
   43654:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        int assign_status = assign_physical_page(new_addr, p->p_pid);
   43658:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4365c:	8b 00                	mov    (%rax),%eax
   4365e:	0f be d0             	movsbl %al,%edx
   43661:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43665:	89 d6                	mov    %edx,%esi
   43667:	48 89 c7             	mov    %rax,%rdi
   4366a:	e8 03 d3 ff ff       	callq  40972 <assign_physical_page>
   4366f:	89 45 bc             	mov    %eax,-0x44(%rbp)
        if (assign_status < 0) {
   43672:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   43676:	79 32                	jns    436aa <program_load_segment+0x12d>
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43678:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4367c:	8b 00                	mov    (%rax),%eax
   4367e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43682:	49 89 d0             	mov    %rdx,%r8
   43685:	89 c1                	mov    %eax,%ecx
   43687:	ba 68 4c 04 00       	mov    $0x44c68,%edx
   4368c:	be 00 c0 00 00       	mov    $0xc000,%esi
   43691:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43696:	b8 00 00 00 00       	mov    $0x0,%eax
   4369b:	e8 4b 0a 00 00       	callq  440eb <console_printf>
            return -1;
   436a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   436a5:	e9 05 01 00 00       	jmpq   437af <program_load_segment+0x232>
        }

        virtual_memory_map(p->p_pagetable, addr, PAGEADDRESS(free_page_number), PAGESIZE, PTE_U | PTE_W | PTE_P);
   436aa:	8b 45 cc             	mov    -0x34(%rbp),%eax
   436ad:	48 98                	cltq   
   436af:	48 c1 e0 0c          	shl    $0xc,%rax
   436b3:	48 89 c2             	mov    %rax,%rdx
   436b6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   436ba:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   436c1:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   436c5:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   436cb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   436d0:	48 89 c7             	mov    %rax,%rdi
   436d3:	e8 9f f8 ff ff       	callq  42f77 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   436d8:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   436df:	00 
   436e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   436e4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   436e8:	0f 82 18 ff ff ff    	jb     43606 <program_load_segment+0x89>
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   436ee:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   436f2:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   436f9:	48 89 c7             	mov    %rax,%rdi
   436fc:	e8 45 f7 ff ff       	callq  42e46 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   43701:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43705:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43709:	48 89 c2             	mov    %rax,%rdx
   4370c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43710:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43714:	48 89 ce             	mov    %rcx,%rsi
   43717:	48 89 c7             	mov    %rax,%rdi
   4371a:	e8 2e 01 00 00       	callq  4384d <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   4371f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43723:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   43727:	48 89 c2             	mov    %rax,%rdx
   4372a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4372e:	be 00 00 00 00       	mov    $0x0,%esi
   43733:	48 89 c7             	mov    %rax,%rdi
   43736:	e8 7b 01 00 00       	callq  438b6 <memset>

    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   4373b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4373f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43743:	eb 4c                	jmp    43791 <program_load_segment+0x214>
        map = virtual_memory_lookup(p->p_pagetable, addr);
   43745:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43749:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   43750:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   43754:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   43758:	48 89 ce             	mov    %rcx,%rsi
   4375b:	48 89 c7             	mov    %rax,%rdi
   4375e:	e8 cf fb ff ff       	callq  43332 <virtual_memory_lookup>
        virtual_memory_map(p->p_pagetable, addr, map.pa, PAGESIZE, perm);
   43763:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   43767:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4376b:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43772:	8b 4d d0             	mov    -0x30(%rbp),%ecx
   43775:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   43779:	41 89 c8             	mov    %ecx,%r8d
   4377c:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43781:	48 89 c7             	mov    %rax,%rdi
   43784:	e8 ee f7 ff ff       	callq  42f77 <virtual_memory_map>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43789:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   43790:	00 
   43791:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43795:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43799:	72 aa                	jb     43745 <program_load_segment+0x1c8>
    }

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   4379b:	48 8b 05 5e d8 00 00 	mov    0xd85e(%rip),%rax        # 51000 <kernel_pagetable>
   437a2:	48 89 c7             	mov    %rax,%rdi
   437a5:	e8 9c f6 ff ff       	callq  42e46 <set_pagetable>
    return 0;
   437aa:	b8 00 00 00 00       	mov    $0x0,%eax
}
   437af:	c9                   	leaveq 
   437b0:	c3                   	retq   

00000000000437b1 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   437b1:	48 89 f9             	mov    %rdi,%rcx
   437b4:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   437b6:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   437bd:	00 
   437be:	72 08                	jb     437c8 <console_putc+0x17>
        cp->cursor = console;
   437c0:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   437c7:	00 
    }
    if (c == '\n') {
   437c8:	40 80 fe 0a          	cmp    $0xa,%sil
   437cc:	74 16                	je     437e4 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   437ce:	48 8b 41 08          	mov    0x8(%rcx),%rax
   437d2:	48 8d 50 02          	lea    0x2(%rax),%rdx
   437d6:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   437da:	40 0f b6 f6          	movzbl %sil,%esi
   437de:	09 fe                	or     %edi,%esi
   437e0:	66 89 30             	mov    %si,(%rax)
    }
}
   437e3:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   437e4:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   437e8:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   437ef:	4c 89 c6             	mov    %r8,%rsi
   437f2:	48 d1 fe             	sar    %rsi
   437f5:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   437fc:	66 66 66 
   437ff:	48 89 f0             	mov    %rsi,%rax
   43802:	48 f7 ea             	imul   %rdx
   43805:	48 c1 fa 05          	sar    $0x5,%rdx
   43809:	49 c1 f8 3f          	sar    $0x3f,%r8
   4380d:	4c 29 c2             	sub    %r8,%rdx
   43810:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   43814:	48 c1 e2 04          	shl    $0x4,%rdx
   43818:	89 f0                	mov    %esi,%eax
   4381a:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   4381c:	83 cf 20             	or     $0x20,%edi
   4381f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43823:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   43827:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   4382b:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   4382e:	83 c0 01             	add    $0x1,%eax
   43831:	83 f8 50             	cmp    $0x50,%eax
   43834:	75 e9                	jne    4381f <console_putc+0x6e>
   43836:	c3                   	retq   

0000000000043837 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43837:	48 8b 47 08          	mov    0x8(%rdi),%rax
   4383b:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   4383f:	73 0b                	jae    4384c <string_putc+0x15>
        *sp->s++ = c;
   43841:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43845:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   43849:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   4384c:	c3                   	retq   

000000000004384d <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   4384d:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43850:	48 85 d2             	test   %rdx,%rdx
   43853:	74 17                	je     4386c <memcpy+0x1f>
   43855:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   4385a:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   4385f:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43863:	48 83 c1 01          	add    $0x1,%rcx
   43867:	48 39 d1             	cmp    %rdx,%rcx
   4386a:	75 ee                	jne    4385a <memcpy+0xd>
}
   4386c:	c3                   	retq   

000000000004386d <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   4386d:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   43870:	48 39 fe             	cmp    %rdi,%rsi
   43873:	72 1d                	jb     43892 <memmove+0x25>
        while (n-- > 0) {
   43875:	b9 00 00 00 00       	mov    $0x0,%ecx
   4387a:	48 85 d2             	test   %rdx,%rdx
   4387d:	74 12                	je     43891 <memmove+0x24>
            *d++ = *s++;
   4387f:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   43883:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43887:	48 83 c1 01          	add    $0x1,%rcx
   4388b:	48 39 ca             	cmp    %rcx,%rdx
   4388e:	75 ef                	jne    4387f <memmove+0x12>
}
   43890:	c3                   	retq   
   43891:	c3                   	retq   
    if (s < d && s + n > d) {
   43892:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   43896:	48 39 cf             	cmp    %rcx,%rdi
   43899:	73 da                	jae    43875 <memmove+0x8>
        while (n-- > 0) {
   4389b:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   4389f:	48 85 d2             	test   %rdx,%rdx
   438a2:	74 ec                	je     43890 <memmove+0x23>
            *--d = *--s;
   438a4:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   438a8:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   438ab:	48 83 e9 01          	sub    $0x1,%rcx
   438af:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   438b3:	75 ef                	jne    438a4 <memmove+0x37>
   438b5:	c3                   	retq   

00000000000438b6 <memset>:
void* memset(void* v, int c, size_t n) {
   438b6:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   438b9:	48 85 d2             	test   %rdx,%rdx
   438bc:	74 12                	je     438d0 <memset+0x1a>
   438be:	48 01 fa             	add    %rdi,%rdx
   438c1:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   438c4:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   438c7:	48 83 c1 01          	add    $0x1,%rcx
   438cb:	48 39 ca             	cmp    %rcx,%rdx
   438ce:	75 f4                	jne    438c4 <memset+0xe>
}
   438d0:	c3                   	retq   

00000000000438d1 <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   438d1:	80 3f 00             	cmpb   $0x0,(%rdi)
   438d4:	74 10                	je     438e6 <strlen+0x15>
   438d6:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   438db:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   438df:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   438e3:	75 f6                	jne    438db <strlen+0xa>
   438e5:	c3                   	retq   
   438e6:	b8 00 00 00 00       	mov    $0x0,%eax
}
   438eb:	c3                   	retq   

00000000000438ec <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   438ec:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   438ef:	ba 00 00 00 00       	mov    $0x0,%edx
   438f4:	48 85 f6             	test   %rsi,%rsi
   438f7:	74 11                	je     4390a <strnlen+0x1e>
   438f9:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   438fd:	74 0c                	je     4390b <strnlen+0x1f>
        ++n;
   438ff:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43903:	48 39 d0             	cmp    %rdx,%rax
   43906:	75 f1                	jne    438f9 <strnlen+0xd>
   43908:	eb 04                	jmp    4390e <strnlen+0x22>
   4390a:	c3                   	retq   
   4390b:	48 89 d0             	mov    %rdx,%rax
}
   4390e:	c3                   	retq   

000000000004390f <strcpy>:
char* strcpy(char* dst, const char* src) {
   4390f:	48 89 f8             	mov    %rdi,%rax
   43912:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   43917:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   4391b:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   4391e:	48 83 c2 01          	add    $0x1,%rdx
   43922:	84 c9                	test   %cl,%cl
   43924:	75 f1                	jne    43917 <strcpy+0x8>
}
   43926:	c3                   	retq   

0000000000043927 <strcmp>:
    while (*a && *b && *a == *b) {
   43927:	0f b6 07             	movzbl (%rdi),%eax
   4392a:	84 c0                	test   %al,%al
   4392c:	74 1a                	je     43948 <strcmp+0x21>
   4392e:	0f b6 16             	movzbl (%rsi),%edx
   43931:	38 c2                	cmp    %al,%dl
   43933:	75 13                	jne    43948 <strcmp+0x21>
   43935:	84 d2                	test   %dl,%dl
   43937:	74 0f                	je     43948 <strcmp+0x21>
        ++a, ++b;
   43939:	48 83 c7 01          	add    $0x1,%rdi
   4393d:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   43941:	0f b6 07             	movzbl (%rdi),%eax
   43944:	84 c0                	test   %al,%al
   43946:	75 e6                	jne    4392e <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   43948:	3a 06                	cmp    (%rsi),%al
   4394a:	0f 97 c0             	seta   %al
   4394d:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   43950:	83 d8 00             	sbb    $0x0,%eax
}
   43953:	c3                   	retq   

0000000000043954 <strchr>:
    while (*s && *s != (char) c) {
   43954:	0f b6 07             	movzbl (%rdi),%eax
   43957:	84 c0                	test   %al,%al
   43959:	74 10                	je     4396b <strchr+0x17>
   4395b:	40 38 f0             	cmp    %sil,%al
   4395e:	74 18                	je     43978 <strchr+0x24>
        ++s;
   43960:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   43964:	0f b6 07             	movzbl (%rdi),%eax
   43967:	84 c0                	test   %al,%al
   43969:	75 f0                	jne    4395b <strchr+0x7>
        return NULL;
   4396b:	40 84 f6             	test   %sil,%sil
   4396e:	b8 00 00 00 00       	mov    $0x0,%eax
   43973:	48 0f 44 c7          	cmove  %rdi,%rax
}
   43977:	c3                   	retq   
   43978:	48 89 f8             	mov    %rdi,%rax
   4397b:	c3                   	retq   

000000000004397c <rand>:
    if (!rand_seed_set) {
   4397c:	83 3d 81 36 01 00 00 	cmpl   $0x0,0x13681(%rip)        # 57004 <rand_seed_set>
   43983:	74 1b                	je     439a0 <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43985:	69 05 71 36 01 00 0d 	imul   $0x19660d,0x13671(%rip),%eax        # 57000 <rand_seed>
   4398c:	66 19 00 
   4398f:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43994:	89 05 66 36 01 00    	mov    %eax,0x13666(%rip)        # 57000 <rand_seed>
    return rand_seed & RAND_MAX;
   4399a:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   4399f:	c3                   	retq   
    rand_seed = seed;
   439a0:	c7 05 56 36 01 00 9e 	movl   $0x30d4879e,0x13656(%rip)        # 57000 <rand_seed>
   439a7:	87 d4 30 
    rand_seed_set = 1;
   439aa:	c7 05 50 36 01 00 01 	movl   $0x1,0x13650(%rip)        # 57004 <rand_seed_set>
   439b1:	00 00 00 
}
   439b4:	eb cf                	jmp    43985 <rand+0x9>

00000000000439b6 <srand>:
    rand_seed = seed;
   439b6:	89 3d 44 36 01 00    	mov    %edi,0x13644(%rip)        # 57000 <rand_seed>
    rand_seed_set = 1;
   439bc:	c7 05 3e 36 01 00 01 	movl   $0x1,0x1363e(%rip)        # 57004 <rand_seed_set>
   439c3:	00 00 00 
}
   439c6:	c3                   	retq   

00000000000439c7 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   439c7:	55                   	push   %rbp
   439c8:	48 89 e5             	mov    %rsp,%rbp
   439cb:	41 57                	push   %r15
   439cd:	41 56                	push   %r14
   439cf:	41 55                	push   %r13
   439d1:	41 54                	push   %r12
   439d3:	53                   	push   %rbx
   439d4:	48 83 ec 58          	sub    $0x58,%rsp
   439d8:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   439dc:	0f b6 02             	movzbl (%rdx),%eax
   439df:	84 c0                	test   %al,%al
   439e1:	0f 84 b0 06 00 00    	je     44097 <printer_vprintf+0x6d0>
   439e7:	49 89 fe             	mov    %rdi,%r14
   439ea:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   439ed:	41 89 f7             	mov    %esi,%r15d
   439f0:	e9 a4 04 00 00       	jmpq   43e99 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   439f5:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   439fa:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   43a00:	45 84 e4             	test   %r12b,%r12b
   43a03:	0f 84 82 06 00 00    	je     4408b <printer_vprintf+0x6c4>
        int flags = 0;
   43a09:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   43a0f:	41 0f be f4          	movsbl %r12b,%esi
   43a13:	bf a1 4e 04 00       	mov    $0x44ea1,%edi
   43a18:	e8 37 ff ff ff       	callq  43954 <strchr>
   43a1d:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   43a20:	48 85 c0             	test   %rax,%rax
   43a23:	74 55                	je     43a7a <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   43a25:	48 81 e9 a1 4e 04 00 	sub    $0x44ea1,%rcx
   43a2c:	b8 01 00 00 00       	mov    $0x1,%eax
   43a31:	d3 e0                	shl    %cl,%eax
   43a33:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43a36:	48 83 c3 01          	add    $0x1,%rbx
   43a3a:	44 0f b6 23          	movzbl (%rbx),%r12d
   43a3e:	45 84 e4             	test   %r12b,%r12b
   43a41:	75 cc                	jne    43a0f <printer_vprintf+0x48>
   43a43:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   43a47:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   43a4d:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   43a54:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   43a57:	0f 84 a9 00 00 00    	je     43b06 <printer_vprintf+0x13f>
        int length = 0;
   43a5d:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   43a62:	0f b6 13             	movzbl (%rbx),%edx
   43a65:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43a68:	3c 37                	cmp    $0x37,%al
   43a6a:	0f 87 c4 04 00 00    	ja     43f34 <printer_vprintf+0x56d>
   43a70:	0f b6 c0             	movzbl %al,%eax
   43a73:	ff 24 c5 b0 4c 04 00 	jmpq   *0x44cb0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   43a7a:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   43a7e:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   43a83:	3c 08                	cmp    $0x8,%al
   43a85:	77 2f                	ja     43ab6 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a87:	0f b6 03             	movzbl (%rbx),%eax
   43a8a:	8d 50 d0             	lea    -0x30(%rax),%edx
   43a8d:	80 fa 09             	cmp    $0x9,%dl
   43a90:	77 5e                	ja     43af0 <printer_vprintf+0x129>
   43a92:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43a98:	48 83 c3 01          	add    $0x1,%rbx
   43a9c:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   43aa1:	0f be c0             	movsbl %al,%eax
   43aa4:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43aa9:	0f b6 03             	movzbl (%rbx),%eax
   43aac:	8d 50 d0             	lea    -0x30(%rax),%edx
   43aaf:	80 fa 09             	cmp    $0x9,%dl
   43ab2:	76 e4                	jbe    43a98 <printer_vprintf+0xd1>
   43ab4:	eb 97                	jmp    43a4d <printer_vprintf+0x86>
        } else if (*format == '*') {
   43ab6:	41 80 fc 2a          	cmp    $0x2a,%r12b
   43aba:	75 3f                	jne    43afb <printer_vprintf+0x134>
            width = va_arg(val, int);
   43abc:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43ac0:	8b 07                	mov    (%rdi),%eax
   43ac2:	83 f8 2f             	cmp    $0x2f,%eax
   43ac5:	77 17                	ja     43ade <printer_vprintf+0x117>
   43ac7:	89 c2                	mov    %eax,%edx
   43ac9:	48 03 57 10          	add    0x10(%rdi),%rdx
   43acd:	83 c0 08             	add    $0x8,%eax
   43ad0:	89 07                	mov    %eax,(%rdi)
   43ad2:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43ad5:	48 83 c3 01          	add    $0x1,%rbx
   43ad9:	e9 6f ff ff ff       	jmpq   43a4d <printer_vprintf+0x86>
            width = va_arg(val, int);
   43ade:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ae2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43ae6:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43aea:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43aee:	eb e2                	jmp    43ad2 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43af0:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43af6:	e9 52 ff ff ff       	jmpq   43a4d <printer_vprintf+0x86>
        int width = -1;
   43afb:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   43b01:	e9 47 ff ff ff       	jmpq   43a4d <printer_vprintf+0x86>
            ++format;
   43b06:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   43b0a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   43b0e:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43b11:	80 f9 09             	cmp    $0x9,%cl
   43b14:	76 13                	jbe    43b29 <printer_vprintf+0x162>
            } else if (*format == '*') {
   43b16:	3c 2a                	cmp    $0x2a,%al
   43b18:	74 33                	je     43b4d <printer_vprintf+0x186>
            ++format;
   43b1a:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   43b1d:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   43b24:	e9 34 ff ff ff       	jmpq   43a5d <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43b29:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   43b2e:	48 83 c2 01          	add    $0x1,%rdx
   43b32:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43b35:	0f be c0             	movsbl %al,%eax
   43b38:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43b3c:	0f b6 02             	movzbl (%rdx),%eax
   43b3f:	8d 70 d0             	lea    -0x30(%rax),%esi
   43b42:	40 80 fe 09          	cmp    $0x9,%sil
   43b46:	76 e6                	jbe    43b2e <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   43b48:	48 89 d3             	mov    %rdx,%rbx
   43b4b:	eb 1c                	jmp    43b69 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   43b4d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43b51:	8b 07                	mov    (%rdi),%eax
   43b53:	83 f8 2f             	cmp    $0x2f,%eax
   43b56:	77 23                	ja     43b7b <printer_vprintf+0x1b4>
   43b58:	89 c2                	mov    %eax,%edx
   43b5a:	48 03 57 10          	add    0x10(%rdi),%rdx
   43b5e:	83 c0 08             	add    $0x8,%eax
   43b61:	89 07                	mov    %eax,(%rdi)
   43b63:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43b65:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   43b69:	85 c9                	test   %ecx,%ecx
   43b6b:	b8 00 00 00 00       	mov    $0x0,%eax
   43b70:	0f 49 c1             	cmovns %ecx,%eax
   43b73:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43b76:	e9 e2 fe ff ff       	jmpq   43a5d <printer_vprintf+0x96>
                precision = va_arg(val, int);
   43b7b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43b7f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43b83:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43b87:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43b8b:	eb d6                	jmp    43b63 <printer_vprintf+0x19c>
        switch (*format) {
   43b8d:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43b92:	e9 f3 00 00 00       	jmpq   43c8a <printer_vprintf+0x2c3>
            ++format;
   43b97:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   43b9b:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   43ba0:	e9 bd fe ff ff       	jmpq   43a62 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43ba5:	85 c9                	test   %ecx,%ecx
   43ba7:	74 55                	je     43bfe <printer_vprintf+0x237>
   43ba9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43bad:	8b 07                	mov    (%rdi),%eax
   43baf:	83 f8 2f             	cmp    $0x2f,%eax
   43bb2:	77 38                	ja     43bec <printer_vprintf+0x225>
   43bb4:	89 c2                	mov    %eax,%edx
   43bb6:	48 03 57 10          	add    0x10(%rdi),%rdx
   43bba:	83 c0 08             	add    $0x8,%eax
   43bbd:	89 07                	mov    %eax,(%rdi)
   43bbf:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43bc2:	48 89 d0             	mov    %rdx,%rax
   43bc5:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43bc9:	49 89 d0             	mov    %rdx,%r8
   43bcc:	49 f7 d8             	neg    %r8
   43bcf:	25 80 00 00 00       	and    $0x80,%eax
   43bd4:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43bd8:	0b 45 a8             	or     -0x58(%rbp),%eax
   43bdb:	83 c8 60             	or     $0x60,%eax
   43bde:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   43be1:	41 bc a7 4c 04 00    	mov    $0x44ca7,%r12d
            break;
   43be7:	e9 35 01 00 00       	jmpq   43d21 <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43bec:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43bf0:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43bf4:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43bf8:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43bfc:	eb c1                	jmp    43bbf <printer_vprintf+0x1f8>
   43bfe:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43c02:	8b 07                	mov    (%rdi),%eax
   43c04:	83 f8 2f             	cmp    $0x2f,%eax
   43c07:	77 10                	ja     43c19 <printer_vprintf+0x252>
   43c09:	89 c2                	mov    %eax,%edx
   43c0b:	48 03 57 10          	add    0x10(%rdi),%rdx
   43c0f:	83 c0 08             	add    $0x8,%eax
   43c12:	89 07                	mov    %eax,(%rdi)
   43c14:	48 63 12             	movslq (%rdx),%rdx
   43c17:	eb a9                	jmp    43bc2 <printer_vprintf+0x1fb>
   43c19:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43c1d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43c21:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43c25:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43c29:	eb e9                	jmp    43c14 <printer_vprintf+0x24d>
        int base = 10;
   43c2b:	be 0a 00 00 00       	mov    $0xa,%esi
   43c30:	eb 58                	jmp    43c8a <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43c32:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43c36:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43c3a:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43c3e:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43c42:	eb 60                	jmp    43ca4 <printer_vprintf+0x2dd>
   43c44:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43c48:	8b 07                	mov    (%rdi),%eax
   43c4a:	83 f8 2f             	cmp    $0x2f,%eax
   43c4d:	77 10                	ja     43c5f <printer_vprintf+0x298>
   43c4f:	89 c2                	mov    %eax,%edx
   43c51:	48 03 57 10          	add    0x10(%rdi),%rdx
   43c55:	83 c0 08             	add    $0x8,%eax
   43c58:	89 07                	mov    %eax,(%rdi)
   43c5a:	44 8b 02             	mov    (%rdx),%r8d
   43c5d:	eb 48                	jmp    43ca7 <printer_vprintf+0x2e0>
   43c5f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43c63:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43c67:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43c6b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43c6f:	eb e9                	jmp    43c5a <printer_vprintf+0x293>
   43c71:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43c74:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   43c7b:	bf 90 4e 04 00       	mov    $0x44e90,%edi
   43c80:	e9 e2 02 00 00       	jmpq   43f67 <printer_vprintf+0x5a0>
            base = 16;
   43c85:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43c8a:	85 c9                	test   %ecx,%ecx
   43c8c:	74 b6                	je     43c44 <printer_vprintf+0x27d>
   43c8e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43c92:	8b 01                	mov    (%rcx),%eax
   43c94:	83 f8 2f             	cmp    $0x2f,%eax
   43c97:	77 99                	ja     43c32 <printer_vprintf+0x26b>
   43c99:	89 c2                	mov    %eax,%edx
   43c9b:	48 03 51 10          	add    0x10(%rcx),%rdx
   43c9f:	83 c0 08             	add    $0x8,%eax
   43ca2:	89 01                	mov    %eax,(%rcx)
   43ca4:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43ca7:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   43cab:	85 f6                	test   %esi,%esi
   43cad:	79 c2                	jns    43c71 <printer_vprintf+0x2aa>
        base = -base;
   43caf:	41 89 f1             	mov    %esi,%r9d
   43cb2:	f7 de                	neg    %esi
   43cb4:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   43cbb:	bf 70 4e 04 00       	mov    $0x44e70,%edi
   43cc0:	e9 a2 02 00 00       	jmpq   43f67 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   43cc5:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43cc9:	8b 07                	mov    (%rdi),%eax
   43ccb:	83 f8 2f             	cmp    $0x2f,%eax
   43cce:	77 1c                	ja     43cec <printer_vprintf+0x325>
   43cd0:	89 c2                	mov    %eax,%edx
   43cd2:	48 03 57 10          	add    0x10(%rdi),%rdx
   43cd6:	83 c0 08             	add    $0x8,%eax
   43cd9:	89 07                	mov    %eax,(%rdi)
   43cdb:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43cde:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   43ce5:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43cea:	eb c3                	jmp    43caf <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   43cec:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43cf0:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43cf4:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43cf8:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43cfc:	eb dd                	jmp    43cdb <printer_vprintf+0x314>
            data = va_arg(val, char*);
   43cfe:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d02:	8b 01                	mov    (%rcx),%eax
   43d04:	83 f8 2f             	cmp    $0x2f,%eax
   43d07:	0f 87 a5 01 00 00    	ja     43eb2 <printer_vprintf+0x4eb>
   43d0d:	89 c2                	mov    %eax,%edx
   43d0f:	48 03 51 10          	add    0x10(%rcx),%rdx
   43d13:	83 c0 08             	add    $0x8,%eax
   43d16:	89 01                	mov    %eax,(%rcx)
   43d18:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   43d1b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   43d21:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43d24:	83 e0 20             	and    $0x20,%eax
   43d27:	89 45 8c             	mov    %eax,-0x74(%rbp)
   43d2a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   43d30:	0f 85 21 02 00 00    	jne    43f57 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43d36:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43d39:	89 45 88             	mov    %eax,-0x78(%rbp)
   43d3c:	83 e0 60             	and    $0x60,%eax
   43d3f:	83 f8 60             	cmp    $0x60,%eax
   43d42:	0f 84 54 02 00 00    	je     43f9c <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43d48:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43d4b:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   43d4e:	48 c7 45 a0 a7 4c 04 	movq   $0x44ca7,-0x60(%rbp)
   43d55:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43d56:	83 f8 21             	cmp    $0x21,%eax
   43d59:	0f 84 79 02 00 00    	je     43fd8 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   43d5f:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   43d62:	89 f8                	mov    %edi,%eax
   43d64:	f7 d0                	not    %eax
   43d66:	c1 e8 1f             	shr    $0x1f,%eax
   43d69:	89 45 84             	mov    %eax,-0x7c(%rbp)
   43d6c:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   43d70:	0f 85 9e 02 00 00    	jne    44014 <printer_vprintf+0x64d>
   43d76:	84 c0                	test   %al,%al
   43d78:	0f 84 96 02 00 00    	je     44014 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   43d7e:	48 63 f7             	movslq %edi,%rsi
   43d81:	4c 89 e7             	mov    %r12,%rdi
   43d84:	e8 63 fb ff ff       	callq  438ec <strnlen>
   43d89:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   43d8c:	8b 45 88             	mov    -0x78(%rbp),%eax
   43d8f:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   43d92:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   43d99:	83 f8 22             	cmp    $0x22,%eax
   43d9c:	0f 84 aa 02 00 00    	je     4404c <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   43da2:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43da6:	e8 26 fb ff ff       	callq  438d1 <strlen>
   43dab:	8b 55 9c             	mov    -0x64(%rbp),%edx
   43dae:	03 55 98             	add    -0x68(%rbp),%edx
   43db1:	44 89 e9             	mov    %r13d,%ecx
   43db4:	29 d1                	sub    %edx,%ecx
   43db6:	29 c1                	sub    %eax,%ecx
   43db8:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   43dbb:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43dbe:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   43dc2:	75 2d                	jne    43df1 <printer_vprintf+0x42a>
   43dc4:	85 c9                	test   %ecx,%ecx
   43dc6:	7e 29                	jle    43df1 <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   43dc8:	44 89 fa             	mov    %r15d,%edx
   43dcb:	be 20 00 00 00       	mov    $0x20,%esi
   43dd0:	4c 89 f7             	mov    %r14,%rdi
   43dd3:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43dd6:	41 83 ed 01          	sub    $0x1,%r13d
   43dda:	45 85 ed             	test   %r13d,%r13d
   43ddd:	7f e9                	jg     43dc8 <printer_vprintf+0x401>
   43ddf:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   43de2:	85 ff                	test   %edi,%edi
   43de4:	b8 01 00 00 00       	mov    $0x1,%eax
   43de9:	0f 4f c7             	cmovg  %edi,%eax
   43dec:	29 c7                	sub    %eax,%edi
   43dee:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   43df1:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43df5:	0f b6 07             	movzbl (%rdi),%eax
   43df8:	84 c0                	test   %al,%al
   43dfa:	74 22                	je     43e1e <printer_vprintf+0x457>
   43dfc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   43e00:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   43e03:	0f b6 f0             	movzbl %al,%esi
   43e06:	44 89 fa             	mov    %r15d,%edx
   43e09:	4c 89 f7             	mov    %r14,%rdi
   43e0c:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   43e0f:	48 83 c3 01          	add    $0x1,%rbx
   43e13:	0f b6 03             	movzbl (%rbx),%eax
   43e16:	84 c0                	test   %al,%al
   43e18:	75 e9                	jne    43e03 <printer_vprintf+0x43c>
   43e1a:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   43e1e:	8b 45 9c             	mov    -0x64(%rbp),%eax
   43e21:	85 c0                	test   %eax,%eax
   43e23:	7e 1d                	jle    43e42 <printer_vprintf+0x47b>
   43e25:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   43e29:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   43e2b:	44 89 fa             	mov    %r15d,%edx
   43e2e:	be 30 00 00 00       	mov    $0x30,%esi
   43e33:	4c 89 f7             	mov    %r14,%rdi
   43e36:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   43e39:	83 eb 01             	sub    $0x1,%ebx
   43e3c:	75 ed                	jne    43e2b <printer_vprintf+0x464>
   43e3e:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   43e42:	8b 45 98             	mov    -0x68(%rbp),%eax
   43e45:	85 c0                	test   %eax,%eax
   43e47:	7e 27                	jle    43e70 <printer_vprintf+0x4a9>
   43e49:	89 c0                	mov    %eax,%eax
   43e4b:	4c 01 e0             	add    %r12,%rax
   43e4e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   43e52:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   43e55:	41 0f b6 34 24       	movzbl (%r12),%esi
   43e5a:	44 89 fa             	mov    %r15d,%edx
   43e5d:	4c 89 f7             	mov    %r14,%rdi
   43e60:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   43e63:	49 83 c4 01          	add    $0x1,%r12
   43e67:	49 39 dc             	cmp    %rbx,%r12
   43e6a:	75 e9                	jne    43e55 <printer_vprintf+0x48e>
   43e6c:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   43e70:	45 85 ed             	test   %r13d,%r13d
   43e73:	7e 14                	jle    43e89 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   43e75:	44 89 fa             	mov    %r15d,%edx
   43e78:	be 20 00 00 00       	mov    $0x20,%esi
   43e7d:	4c 89 f7             	mov    %r14,%rdi
   43e80:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   43e83:	41 83 ed 01          	sub    $0x1,%r13d
   43e87:	75 ec                	jne    43e75 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   43e89:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   43e8d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   43e91:	84 c0                	test   %al,%al
   43e93:	0f 84 fe 01 00 00    	je     44097 <printer_vprintf+0x6d0>
        if (*format != '%') {
   43e99:	3c 25                	cmp    $0x25,%al
   43e9b:	0f 84 54 fb ff ff    	je     439f5 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   43ea1:	0f b6 f0             	movzbl %al,%esi
   43ea4:	44 89 fa             	mov    %r15d,%edx
   43ea7:	4c 89 f7             	mov    %r14,%rdi
   43eaa:	41 ff 16             	callq  *(%r14)
            continue;
   43ead:	4c 89 e3             	mov    %r12,%rbx
   43eb0:	eb d7                	jmp    43e89 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   43eb2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43eb6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43eba:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43ebe:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43ec2:	e9 51 fe ff ff       	jmpq   43d18 <printer_vprintf+0x351>
            color = va_arg(val, int);
   43ec7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43ecb:	8b 07                	mov    (%rdi),%eax
   43ecd:	83 f8 2f             	cmp    $0x2f,%eax
   43ed0:	77 10                	ja     43ee2 <printer_vprintf+0x51b>
   43ed2:	89 c2                	mov    %eax,%edx
   43ed4:	48 03 57 10          	add    0x10(%rdi),%rdx
   43ed8:	83 c0 08             	add    $0x8,%eax
   43edb:	89 07                	mov    %eax,(%rdi)
   43edd:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   43ee0:	eb a7                	jmp    43e89 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   43ee2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ee6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43eea:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43eee:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43ef2:	eb e9                	jmp    43edd <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   43ef4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ef8:	8b 01                	mov    (%rcx),%eax
   43efa:	83 f8 2f             	cmp    $0x2f,%eax
   43efd:	77 23                	ja     43f22 <printer_vprintf+0x55b>
   43eff:	89 c2                	mov    %eax,%edx
   43f01:	48 03 51 10          	add    0x10(%rcx),%rdx
   43f05:	83 c0 08             	add    $0x8,%eax
   43f08:	89 01                	mov    %eax,(%rcx)
   43f0a:	8b 02                	mov    (%rdx),%eax
   43f0c:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   43f0f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43f13:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43f17:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   43f1d:	e9 ff fd ff ff       	jmpq   43d21 <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   43f22:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f26:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43f2a:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f2e:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43f32:	eb d6                	jmp    43f0a <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   43f34:	84 d2                	test   %dl,%dl
   43f36:	0f 85 39 01 00 00    	jne    44075 <printer_vprintf+0x6ae>
   43f3c:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   43f40:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   43f44:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   43f48:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43f4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43f52:	e9 ca fd ff ff       	jmpq   43d21 <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   43f57:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   43f5d:	bf 90 4e 04 00       	mov    $0x44e90,%edi
        if (flags & FLAG_NUMERIC) {
   43f62:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   43f67:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   43f6b:	4c 89 c1             	mov    %r8,%rcx
   43f6e:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   43f72:	48 63 f6             	movslq %esi,%rsi
   43f75:	49 83 ec 01          	sub    $0x1,%r12
   43f79:	48 89 c8             	mov    %rcx,%rax
   43f7c:	ba 00 00 00 00       	mov    $0x0,%edx
   43f81:	48 f7 f6             	div    %rsi
   43f84:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   43f88:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   43f8c:	48 89 ca             	mov    %rcx,%rdx
   43f8f:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   43f92:	48 39 d6             	cmp    %rdx,%rsi
   43f95:	76 de                	jbe    43f75 <printer_vprintf+0x5ae>
   43f97:	e9 9a fd ff ff       	jmpq   43d36 <printer_vprintf+0x36f>
                prefix = "-";
   43f9c:	48 c7 45 a0 a4 4c 04 	movq   $0x44ca4,-0x60(%rbp)
   43fa3:	00 
            if (flags & FLAG_NEGATIVE) {
   43fa4:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43fa7:	a8 80                	test   $0x80,%al
   43fa9:	0f 85 b0 fd ff ff    	jne    43d5f <printer_vprintf+0x398>
                prefix = "+";
   43faf:	48 c7 45 a0 9f 4c 04 	movq   $0x44c9f,-0x60(%rbp)
   43fb6:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   43fb7:	a8 10                	test   $0x10,%al
   43fb9:	0f 85 a0 fd ff ff    	jne    43d5f <printer_vprintf+0x398>
                prefix = " ";
   43fbf:	a8 08                	test   $0x8,%al
   43fc1:	ba a7 4c 04 00       	mov    $0x44ca7,%edx
   43fc6:	b8 a6 4c 04 00       	mov    $0x44ca6,%eax
   43fcb:	48 0f 44 c2          	cmove  %rdx,%rax
   43fcf:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   43fd3:	e9 87 fd ff ff       	jmpq   43d5f <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   43fd8:	41 8d 41 10          	lea    0x10(%r9),%eax
   43fdc:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   43fe1:	0f 85 78 fd ff ff    	jne    43d5f <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   43fe7:	4d 85 c0             	test   %r8,%r8
   43fea:	75 0d                	jne    43ff9 <printer_vprintf+0x632>
   43fec:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   43ff3:	0f 84 66 fd ff ff    	je     43d5f <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   43ff9:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   43ffd:	ba a8 4c 04 00       	mov    $0x44ca8,%edx
   44002:	b8 a1 4c 04 00       	mov    $0x44ca1,%eax
   44007:	48 0f 44 c2          	cmove  %rdx,%rax
   4400b:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   4400f:	e9 4b fd ff ff       	jmpq   43d5f <printer_vprintf+0x398>
            len = strlen(data);
   44014:	4c 89 e7             	mov    %r12,%rdi
   44017:	e8 b5 f8 ff ff       	callq  438d1 <strlen>
   4401c:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   4401f:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   44023:	0f 84 63 fd ff ff    	je     43d8c <printer_vprintf+0x3c5>
   44029:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   4402d:	0f 84 59 fd ff ff    	je     43d8c <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   44033:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   44036:	89 ca                	mov    %ecx,%edx
   44038:	29 c2                	sub    %eax,%edx
   4403a:	39 c1                	cmp    %eax,%ecx
   4403c:	b8 00 00 00 00       	mov    $0x0,%eax
   44041:	0f 4e d0             	cmovle %eax,%edx
   44044:	89 55 9c             	mov    %edx,-0x64(%rbp)
   44047:	e9 56 fd ff ff       	jmpq   43da2 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   4404c:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   44050:	e8 7c f8 ff ff       	callq  438d1 <strlen>
   44055:	8b 7d 98             	mov    -0x68(%rbp),%edi
   44058:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   4405b:	44 89 e9             	mov    %r13d,%ecx
   4405e:	29 f9                	sub    %edi,%ecx
   44060:	29 c1                	sub    %eax,%ecx
   44062:	44 39 ea             	cmp    %r13d,%edx
   44065:	b8 00 00 00 00       	mov    $0x0,%eax
   4406a:	0f 4d c8             	cmovge %eax,%ecx
   4406d:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   44070:	e9 2d fd ff ff       	jmpq   43da2 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   44075:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   44078:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   4407c:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   44080:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   44086:	e9 96 fc ff ff       	jmpq   43d21 <printer_vprintf+0x35a>
        int flags = 0;
   4408b:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   44092:	e9 b0 f9 ff ff       	jmpq   43a47 <printer_vprintf+0x80>
}
   44097:	48 83 c4 58          	add    $0x58,%rsp
   4409b:	5b                   	pop    %rbx
   4409c:	41 5c                	pop    %r12
   4409e:	41 5d                	pop    %r13
   440a0:	41 5e                	pop    %r14
   440a2:	41 5f                	pop    %r15
   440a4:	5d                   	pop    %rbp
   440a5:	c3                   	retq   

00000000000440a6 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   440a6:	55                   	push   %rbp
   440a7:	48 89 e5             	mov    %rsp,%rbp
   440aa:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   440ae:	48 c7 45 f0 b1 37 04 	movq   $0x437b1,-0x10(%rbp)
   440b5:	00 
        cpos = 0;
   440b6:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   440bc:	b8 00 00 00 00       	mov    $0x0,%eax
   440c1:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   440c4:	48 63 ff             	movslq %edi,%rdi
   440c7:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   440ce:	00 
   440cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   440d3:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   440d7:	e8 eb f8 ff ff       	callq  439c7 <printer_vprintf>
    return cp.cursor - console;
   440dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   440e0:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   440e6:	48 d1 f8             	sar    %rax
}
   440e9:	c9                   	leaveq 
   440ea:	c3                   	retq   

00000000000440eb <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   440eb:	55                   	push   %rbp
   440ec:	48 89 e5             	mov    %rsp,%rbp
   440ef:	48 83 ec 50          	sub    $0x50,%rsp
   440f3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   440f7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   440fb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   440ff:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44106:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4410a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4410e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44112:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   44116:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4411a:	e8 87 ff ff ff       	callq  440a6 <console_vprintf>
}
   4411f:	c9                   	leaveq 
   44120:	c3                   	retq   

0000000000044121 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   44121:	55                   	push   %rbp
   44122:	48 89 e5             	mov    %rsp,%rbp
   44125:	53                   	push   %rbx
   44126:	48 83 ec 28          	sub    $0x28,%rsp
   4412a:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   4412d:	48 c7 45 d8 37 38 04 	movq   $0x43837,-0x28(%rbp)
   44134:	00 
    sp.s = s;
   44135:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   44139:	48 85 f6             	test   %rsi,%rsi
   4413c:	75 0b                	jne    44149 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   4413e:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44141:	29 d8                	sub    %ebx,%eax
}
   44143:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   44147:	c9                   	leaveq 
   44148:	c3                   	retq   
        sp.end = s + size - 1;
   44149:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   4414e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   44152:	be 00 00 00 00       	mov    $0x0,%esi
   44157:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   4415b:	e8 67 f8 ff ff       	callq  439c7 <printer_vprintf>
        *sp.s = 0;
   44160:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44164:	c6 00 00             	movb   $0x0,(%rax)
   44167:	eb d5                	jmp    4413e <vsnprintf+0x1d>

0000000000044169 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   44169:	55                   	push   %rbp
   4416a:	48 89 e5             	mov    %rsp,%rbp
   4416d:	48 83 ec 50          	sub    $0x50,%rsp
   44171:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44175:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44179:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4417d:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44184:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44188:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4418c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44190:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   44194:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44198:	e8 84 ff ff ff       	callq  44121 <vsnprintf>
    va_end(val);
    return n;
}
   4419d:	c9                   	leaveq 
   4419e:	c3                   	retq   

000000000004419f <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   4419f:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   441a4:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   441a9:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   441ae:	48 83 c0 02          	add    $0x2,%rax
   441b2:	48 39 d0             	cmp    %rdx,%rax
   441b5:	75 f2                	jne    441a9 <console_clear+0xa>
    }
    cursorpos = 0;
   441b7:	c7 05 3b 4e 07 00 00 	movl   $0x0,0x74e3b(%rip)        # b8ffc <cursorpos>
   441be:	00 00 00 
}
   441c1:	c3                   	retq   
