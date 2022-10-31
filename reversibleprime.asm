.data
     NewLine:     .asciiz  " \n"
     
     
 
 .text
main:
	
		#$t0 is to be used to restrict numbers to be printed
		li $t0, 10
		
		# $s4 is count 
		li $s4, 0
		
		#$s6 => num 
		li $s6, 13
whileloop:		
				
		beq $s4, $t0,ExitWhile 
		
		#set isprime input	
		move $t1, $s6
    	jal IsPrime
		
		#$t4 contains IsPrime(num) is either 0 or 1	
		beq $t4, $zero, Countinuewhile 
		
		#$t5 => Num0 = $t1 
		#move $t5, $t1
	   # move $t4, $t3
		
	     
			
		#n$t7  stores num1 = num ** 2
	    mul $t7, $t1, $t1
		
		#$s0 => $t7 = num1
		move $t4, $t7
		jal Reverse
		
		#$s1 => $t6 = num2  is reverse of IsPrime** 2
		move $t6, $s1
		
		#Move Num0 = $t1 in to $t8-input resgister in reverse
		 move $t4, $t1
		jal Reverse
    
	   #$s1 =>  $t2 = num3 the reverse of isprime
		move $t2, $s1
		
	   #$s5 => num4 - square of reverse isprime 
	    mul $s5, $t2, $t2
		
	  #Compare num2 and num3  	
	  bne $t6, $s5,Countinuewhile
	  #Compare num3 and num0 
		beq $t2, $t1, Countinuewhile
		
		li $v0, 1
		move $a0, $t7
		syscall
		
		li $v0, 4
		la $a0, NewLine
		syscall
		
		
		
		#increament count
		addi $s4, $s4, 1


    Countinuewhile:
				#incriment num
				addi $s6, $s6, 1
				
				
	b whileloop
			
    ExitWhile:
		#jr $ra				
	#jal main
	li $v0, 10
	syscall
	
	
IsPrime:
	#intalize the number to be tested
	move $t1, $s6
	
	li $t2, 2 
    
	#excluding number less than or equal to 1
    blt $t1, 1, isNotprime
    beq $t1, 1, isNotprime
    
    loopPrime:
		#branch when done prossecing numbers in range 
		beq $t2, $t1, isPrime
		#Successfuly divide input by number in range
		div $t1, $t2
		mfhi $t3
		beq $t3, $zero, isNotprime
		addi $t2, $t2, 1
		
		b loopPrime
		 
		 
		   isPrime:
            
			li $t3, 1
		    move $t4, $t3 
		    			
		jr $ra
		
		
			  
		isNotprime:
			li $t3, 0
			
			move $t4 , $t3
			
		jr $ra
Reverse:
		li $t6, 0 #revnumber = 0
        li $t5, 10 # t5 = 10
				
		#initialize the number to be reversed
         li $t4, 0
		#copy the original number to be reversed
		#move $t4, $t8
		  
		reverseLoop:
			beq $t4,$zero,  reverseExit
			li $t2, 0 # t2  = remainder
			div $t4, $t5
				
			mfhi $t2            
			div $t4, $t4, $t5
			mul $t3, $t3, 10
			add $t3, $t3, $t2
			move $s1, $t3
			b  reverseLoop  
		
		reverseExit:
		#move the output of reverse in s1
		   	move $s1, $t3
		jr $ra
			
			
		