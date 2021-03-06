*------------------------------------------------------------------------
*        G E N I N T B R
*------------------------------------------------------------------------
*
*       Generate the list of integrals that could arise from a set
*       of orbitals. 

        SUBROUTINE genintbr(nclosd,maxorb,lmax,ql,qintptr,qpackn,qvalue,
     :                                      rel,skip,eval)
        IMPLICIT DOUBLE PRECISION(a-h,o-z)
        POINTER (ql,l(1)),(qintptr,intptr(0:2*lmax+1,7)),
     :          (qpackn,ipackn(1)),(qvalue,value(1))
        INTEGER l,intptr,ipackn
        INTEGER maxorb,lmax,n
        LOGICAL omit, ltriang, gen, rel, skip, eval, lcomp
	CHARACTER*3 el

C >>>>  The hlc routine requires an array of electron labels 
*	for diagonstic purposes.  The A3 format of MCHF is not 
*	compatible with the Belfast Integer (3H   ) format.
*	No problem will be encountered as long as an error is
*	not detected by hlc.
*       .. sweep through to find dimensions
       myid = 0
       nprocs = 1
        call comp_genintbr(n,.false.,nclosd,maxorb,lmax,ql,qintptr,
     :      qpackn,qvalue,rel,skip,eval)
        if(myid ==0) write(*,*) 'Allocating ',n,' integrals'
        call alloc(qintptr,((2*lmax+2)*7),4)
!        intptr(0:2*lmax+2,1:7) = 0
        call alloc(qpackn,n,4)
        ipackn(1:n) = 0
       if (eval) call alloc(qvalue,n,8)
       if (eval) value(1:n) = 0
       
        call comp_genintbr(n,.true.,nclosd,maxorb,lmax,ql,qintptr,
     :      qpackn,qvalue,rel,skip,eval)

        return
        end
**************************************************************************
        subroutine comp_genintbr(n,gen,nclosd,maxorb,lmax,ql,qintptr,
     :      qpackn,qvalue,rel,skip,eval)

        IMPLICIT DOUBLE PRECISION(a-h,o-z)
        POINTER (ql,l(1)),(qintptr,intptr(0:2*lmax+1,7)),
     :          (qpackn,ipackn(1)),(qvalue,value(1))
        INTEGER l,intptr,ipackn,itmp_ipackn
        INTEGER maxorb,lmax,n
        LOGICAL omit, ltriang, gen, rel, skip, eval,lcomp
        CHARACTER*3 el

        nprocs = 1; myid = 0;

        n = 0
        do k = 0,2*lmax+1
          do i2 = 1,maxorb
            l2 = l(i2)
            do i4 = i2,maxorb
              l4 = l(i4)
              if (ltriang(k,l2,l2) .and. ltriang(k,l4,l4)) then
                n = n+1
                lcomp = (myid == mod(n,nprocs)) 
                if (gen.and.lcomp) then
                 ipackn(n) = (k*64 + i2)*64 + i4
	         j2 = i2+nclosd
	         j4 = i4+nclosd
		 if( eval) value(n) = rk(j2,j4,j2,j4,k,rel)
		end if
             end if
            end do
          end do
          if (gen) then
	    intptr(k,1) = n
	  end if
        end do
*
*       Make the GK integrals: i2 < i4
*
        do k = 0,2*lmax+1
          do i2 = 1,maxorb
            l2 = l(i2)
            do i4 = i2+1,maxorb
              l4 = l(i4)
              if (ltriang(k,l2,l4) ) then
                n = n+1
                lcomp = (myid == mod(n,nprocs))
                if (gen.and.lcomp) then
                  ipackn(n) = (k*64 + i2)*64 + i4
		  j2 = i2+nclosd
		  j4 = i4+nclosd
		  if (eval) value(n) = rk(j2,j4,j4,j2,k,rel)
		end if
              end if
            end do
          end do
          if (gen) then
	    intptr(k,2) = n
	  end if
        end do
*
*       Make the RK integrals: i1<=i2; i1 <= i3; i1<=i4
*
        do k = 0,2*lmax+1
          do i1 = 1,maxorb
            l1 = l(i1)
            do i2 = i1,maxorb
              l2 = l(i2)
              do i3=i1,maxorb
                l3 = l(i3)
                if (ltriang(k,l1,l3)) then
                  do i4 = i1,maxorb
                    l4 = l(i4)
*                   .. omit if FK
                    omit = (i1.eq.i4.and.i2.eq.i3).or.
     :                     (i1.eq.i3.and.i2.eq.i4)
                    if ( .not. omit .and. ltriang(k,l2,l4) ) then
                      n = n+1
                      lcomp = (myid == mod(n,nprocs))
                      if (gen.and.lcomp) then
                        ipackn(n) = (((k*64+i1)*64+i2)*64+i3)*64+i4
			j1 = i1+nclosd
			j2 = i2+nclosd
			j3 = i3+nclosd
			j4 = i4+nclosd
			if (eval) value(n) = rk(j1,j2,j3,j4,k,rel)
                      end if
                    end if
                  end do
                end if
              end do
            end do
          end do
          if (gen) then
	    intptr(k,3) = n
	  end if
        end do
*
*       Make the L integrals: i2 < i4
*
        do i2 = 1,maxorb
          l2 = l(i2)
          do i4 = i2,maxorb
            l4 = l(i4)
            if (l2 .eq. l4) then
              n = n+1
                lcomp = (myid == mod(n,nprocs))
                if (gen.and.lcomp) then
               ipackn(n) = i2*64 + i4
               j1 = i2 + nclosd
                j2 = i4 + nclosd
		if (eval) value(n) = hlc(el,j1,j2,rel)
	      end if
            end if
          end do
        end do
        if (gen) then
	  do k = 0,2*lmax+1
	    intptr(k,4) = n
	  end do
	end if

*       Omit Breit-Pauli integrals if skip=true
	if (skip) go to 20
*
*       Make the Z integrals: i2 < i4
*
        do i2 = 1,maxorb
          l2 = l(i2)
          do i4 = i2,maxorb
            l4 = l(i4)
            if (l2 .eq. l4 .and. l2 .gt. 0) then
              n = n+1
                lcomp = (myid == mod(n,nprocs))
                if (gen.and.lcomp) then
                ipackn(n) = i2*64 + i4
		j2 = i2+nclosd
		j4 = i4+nclosd
		if (eval) value(n) = zeta(j2,j4)
	      end if
            end if
          end do
        end do
        if (gen) then
	  do k = 0,2*lmax+1
	    intptr(k,5) = n
	  end do
	end if
*
*       Make the NK integrals: i1<=i3; i2 <= i4
*       Note that for these integrals, the packing
*       routine packs K+1, where K=-1,0,1,..  So
*       here k = K+1
*
        do k = 0,2*lmax+1
 	  if (k .eq. 0) then
 	    kk = k+1
 	  else
 	    kk = k-1
 	  end if
	  km = k-1
          do i1 = 1,maxorb
            l1 = l(i1)
            do i2 = 1,maxorb
              l2 = l(i2)
              do i3=i1,maxorb
                l3 = l(i3)
                if (ltriang(kk,l1,l3).or. ltriang(kk+2,l1,l3) ) then
                  do i4 = i2,maxorb
                    l4 = l(i4)
                    if (ltriang(kk,l2,l4) .or.ltriang(kk+2,l2,l4)) then
                      n = n+1
                      lcomp = (myid == mod(n,nprocs))
		      if (gen.and.lcomp) then
	                        ipackn(n) = (((k*64+i1)*64+i2)*64+i3)*64+i4
				j1 = i1+nclosd
				j2 = i2+nclosd
				j3 = i3+nclosd
	       	                j4 = i4+nclosd
				if (eval) value(n) = sn(j1,j2,j3,j4,km)
                      end if
                    end if
                  end do
                   end if
              end do
            end do
          end do
          if (gen) then
	    intptr(k,6) = n
	  end if
        end do
*
*       Make the VK integrals: i2 < i4
*
        do k = 0,2*lmax+1
	  kp = k+1 
          do i1 = 1,maxorb
            l1 = l(i1)
            do i2 = 1,maxorb
              l2 = l(i2)
              do i3=1,maxorb
               l3 = l(i3)
                if (ltriang(kp,l1,l3)) then
                  do i4 = i2,maxorb
                    l4 = l(i4)
                    if ( ltriang(kp,l2,l4) ) then
                           n = n+1
                           lcomp = (myid == mod(n,nprocs))
                           if (gen.and.lcomp) then
                             ipackn(n) = (((k*64+i1)*64+i2)*64+i3)*64+i4
		        j1 = i1+nclosd
		     j2 = i2+nclosd
		        j3 = i3+nclosd
		        j4 = i4+nclosd
		        if (eval) value(n) = vk(j1,j2,j3,j4,k)
                   end if
                 end if
                  end do
                end if
              end do
         end do
        end do
        if (gen) then
	  intptr(k,7) = n
        end if
        end do
*
*       Note: SK integrals are the same as Nk

20      continue
*       .. allocate memory for integral book keeping
       
        return 
        end

