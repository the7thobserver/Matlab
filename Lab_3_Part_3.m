% % FIR Filter %
% b = fir1(50, [.22, .57]);
% 
% % fid = fopen('fir_bandpass.h', 'w');
% % 
% % fprintf(fid, 'float table[%d] = {%f', 50, b(1));
% % 
% % for i = 2:50
% %     fprintf(fid, ', %f', b(i));
% % end
% % 
% % fprintf(fid, '};\n');
% % fclose(fid);
% 
% fvtool(b)

% IIR Filter %

[N] = ellipord([.2118 .4649], [.20 .47], 5, 40);

[B, A] = ellip(N, 5, 40, [0.2118 0.4649]);

[SOS, G] = tf2sos(B, A);

fvtool(B, A);
% 
% fid = fopen('iir_bandpass.h', 'w');
% 
% fprintf(fid, 'float B[3][3] = {{%f, %f, %f}', SOS(1, 1), SOS(1, 2), SOS(1, 3));
% 
% for i = 2:3
%     fprintf(fid, ', {%f, %f, %f}', SOS(i, 1), SOS(i, 2), SOS(i, 3));
% end
% 
% fprintf(fid, '};\n');
% 
% fprintf(fid, 'float A[3][3] = {{%f, %f, %f}', SOS(1,4 ), SOS(1, 5), SOS(1, 6));
% 
% for i = 2:3
%    fprintf(fid, ', {%f, %f, %f}', SOS(i,4), SOS(i, 5), SOS(i, 6));
% end
% 
% fprintf (fid, '};\n');
% fclose(fid);