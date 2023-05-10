% A script for producing angular accelerations (ACC)
% Neda Darbeheshti & Henry Wegener, AEI Hannover, 2018-10-22


%% computing angular accelerations 

ddq_pure_A = NumDiff2(q_A_pure,5);
acc_ang_A = zeros(L,4);
for i = 1:L
    wqua = [ -q_A_pure(i,2)  q_A_pure(i,1)  q_A_pure(i,4) -q_A_pure(i,3);
             -q_A_pure(i,3) -q_A_pure(i,4)  q_A_pure(i,1)  q_A_pure(i,2);
             -q_A_pure(i,4)  q_A_pure(i,3) -q_A_pure(i,2)  q_A_pure(i,1);
              q_A_pure(i,1)  q_A_pure(i,2)  q_A_pure(i,3)  q_A_pure(i,4)  ];
   
    acc_ang_A(i,:) = 2*wqua*ddq_pure_A(i,:)';
end

ddq_pure_B = NumDiff2(q_B_pure,5);
acc_ang_B = zeros(L,4);
for i = 1:L
    wqub = [ -q_B_pure(i,2)  q_B_pure(i,1)  q_B_pure(i,4) -q_B_pure(i,3);
             -q_B_pure(i,3) -q_B_pure(i,4)  q_B_pure(i,1)  q_B_pure(i,2);
             -q_B_pure(i,4)  q_B_pure(i,3) -q_B_pure(i,2)  q_B_pure(i,1);
              q_B_pure(i,1)  q_B_pure(i,2)  q_B_pure(i,3)  q_B_pure(i,4)  ];

   acc_ang_B(i,:) = 2*wqub*ddq_pure_B(i,:)';
end

acc_ang_A = acc_ang_A(:,1:3);
acc_ang_B = acc_ang_B(:,1:3);

