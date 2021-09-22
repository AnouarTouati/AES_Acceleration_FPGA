# AES_Acceleration_FPGA
System design based on DE-10 board, 
This project is our Master's graduation project.
<br> The aim is to integrate an already existing AES block(VHDL) in the FPGA(DE-10Standard board) fabric then bridge it to HPS(ARM), which was running linux where we created multiple programs using C language to access video ports read data send it to AES block, retrieve the encrypted data and save it. We also created a pure software implementation of AES algorithm (using C language) to act as a reference of execution time.

