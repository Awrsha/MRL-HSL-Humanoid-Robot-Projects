classdef MRL

	methods
%% Kinematics Chain of MRL Humanoid Robots 

% q = [ARSP(1),ARSR(3),ARE(5)
%      ALSP(2),ALSR(4),ALE(6)
%      FRHY(7),FRHR(9),FRHP(11),FRKP(13),FRAP(15),FRAR(17)
%      FLHY(8),FLHR(10),FLHP(12),FLKP(14),FLAP(16),FLAR(18)
%      HP(19),HT(20)
            
            function t = kinematics_forward_rarm(~ , q, shoulderOffsetY, shoulderOffsetZ, upperArmLengthY, upperArmLengthZ, lowerArmLengthX, lowerArmLengthZ)
                t = Transform();
                t = t.translateY(-shoulderOffsetY).translateZ(shoulderOffsetZ)...
                    .mDH(-pi/2, 0, 0, q(1))...
                    .mDH(pi/2, upperArmLengthY, -upperArmLengthZ, q(3))...
                    .mDH(pi/2, lowerArmLengthX, -lowerArmLengthZ, (pi/4)+q(5));
            end

            function t = kinematics_forward_larm(~ , q2, q4, q6, shoulderOffsetY, shoulderOffsetZ, upperArmLengthY, upperArmLengthZ, lowerArmLengthX, lowerArmLengthZ)
                t = Transform();
                t = t.translateY(shoulderOffsetY).translateZ(shoulderOffsetZ)...
                    .mDH(-pi/2, 0, 0, q2)...
                    .mDH(pi/2, upperArmLengthY, upperArmLengthZ, q4)...
                    .mDH(pi/2, lowerArmLengthX, lowerArmLengthZ, (pi/4)+q6);
            end
            
            function t = kinematics_forward_rleg(~ , q, hipOffsetY, hipOffsetZ, dThigh, dTibia, aThigh, aTibia, footHeight)
                t = Transform();
                t = t.translateY(-hipOffsetY).translateZ(-hipOffsetZ)...
                    .mDH(0, 0, 0, (pi/2)+q(7))...
                    .mDH(pi/2, 0, 0, (pi/2)+q(9))...
                    .mDH(pi/2, 0, 0, aThigh+q(11))...
                    .mDH(0, -dThigh, 0, -aThigh-aTibia+q(13))...
                    .mDH(0, -dTibia, 0, aTibia+q(15))...
                    .mDH(-pi/2, 0, 0, q(17))...
                    .rotateZ(pi).rotateY(-pi/2).translateZ(-footHeight);
            end
            
            function t = kinematics_forward_lleg(~ , q, hipOffsetY, hipOffsetZ, dThigh, dTibia, aThigh, aTibia, footHeight)
                t = Transform();
                t = t.translateY(hipOffsetY).translateZ(-hipOffsetZ)...
                    .mDH(0, 0, 0, (pi/2)+q(1))...
                    .mDH(pi/2, 0, 0, (pi/2)+q(2))...
                    .mDH(pi/2, 0, 0, aThigh+q(3))...
                    .mDH(0, -dThigh, 0, -aThigh-aTibia+q(4))...
                    .mDH(0, -dTibia, 0, aTibia+q(5))...
                    .mDH(-pi/2, 0, 0, q(6))...
                    .rotateZ(pi).rotateY(-pi/2).translateZ(-footHeight);
            end  
            
            function t = kinematics_forward_head(~, q, neckOffsetZ)
                t = Transform();
                t = t.translateZ(neckOffsetZ)...
                    .mDH(0, 0, 0, q(19))...
                    .mDH(0, 0, 0, q(20))...
                    .rotateX(pi/2).rotateY(pi/2);
            end
                % A_Base_0 = t.TranslateZ(NeckOffsetZ)
                % T_0_1 = t.mDH(0, 0, 0, q(1));
                % T_1_2 = t.mDH(0, 0, 0, q(1));;
                % T_End = t.rotateX(pi/2).rotateY(pi/2);
                % Pos = A_Base_0*T_0_1*T_1_2*T_End;

     end
end