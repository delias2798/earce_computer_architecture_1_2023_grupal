# ======================================================================================================
# SCRIPT NAME: main.py
#
# PURPOSE: convert Tessia v1.0.0 instructions to binary.
#
# REVISION HISTORY:
#
# AUTHOR				    DATE			    DETAILS
# --------------------- --------------- --------------------------------
# @angelortizv          2023-05-09	    Special Addressing
# 
# ======================================================================================================
import os

functionDictionary = {
    'MULI': '100000',
    'DIVI': '100010',
    'RESI': '100100',
    'MODI': '100110',
    'SUMI': '101000',
    'ORRI': '111000',
    'MULR': '000000',
    'DIVR': '000010',
    'RESR': '000100',
    'MODR': '000110',
    'SUMR': '001000',
    'ORRR': '011000',
    'MOVE': '111010',
    'CMPE': '110100',
    'BIGA': '00001000',
    'BNIA': '00011000',
    'MAQA': '11001000',
    'MEQA': '10111000',
    'AQIA': '10101000',
    'EQIA': '11011000',
    'BIGD': '00001010',
    'BNID': '00011010',
    'MAQD': '11001010',
    'MEQD': '10111010',
    'AQID': '10101010',
    'EQID': '11011010'

}

branchDictionary = {}

def romInit(wordSize, depth):

    romFile = open("TessiaV1/rom_data.mif", "r+")
    romFile.truncate(0)
    
    romFile.write("--------------------- Tessia v1.0.0 ---------------------\n\n")

    romFile.write(f'WIDTH={wordSize};\nDEPTH={depth};\n \n')
    romFile.write("ADDRESS_RADIX=UNS;\nDATA_RADIX=BIN;\n \n")
    romFile.write("CONTENT BEGIN\n")
    
    counter = 0

    binaryFile = open('src/binary.txt', 'r')
    lastLine = binaryFile.readlines()[-1]
    binaryFile.seek(0)
    for instruction in binaryFile:
        romFile.write(f'\t{counter}\t :\t {instruction[:-1]};\n')
        counter += 1

    romFile.write(f'\t[{counter}..{depth-1}]\t :\t {0};\n')
    
    romFile.write("END;")
    romFile.write("\n\n--------------------- Tessia v1.0.0 ---------------------\n\n")
    romFile.close()

def reader_branches():
    counter = 0
    with open('src/file.txt', 'r') as f:
        lines = f.readlines()
        f.close()
    with open('src/newfile.txt', 'xt') as f:
        for line in lines:
            if(line[-2] == ':'):
                temp = line[:-2]
                lnNum = bin(counter)[2:].zfill(24)
                branchDictionary[temp] = lnNum
            else:
                f.write(line)
                counter += 1
        f.close()            
def reader():
    counter = 0
    with open('src/newfile.txt', 'r') as f:
        lastLine = f.readlines()[-1]
        f.seek(0)
        binaryFile = open('src/binary.txt', 'w')
        for line in f:
            if(line[0:4][3] == 'I'):
                imm = immediateAddressing(line)
                binaryFile.write(imm)
            elif (line[0:4][3] == 'R'):
                reg = registerAddressing(line)
                binaryFile.write(reg)
            elif (line[0:4][3] == 'A' or line[0:4][3] == 'D'):
                reg = branchAddressing(line, counter)
                binaryFile.write(reg)
            elif (line[0:4][3] == 'E'):
                spec = specialAddressing(line)
                binaryFile.write(spec)
            binaryFile.write('\n')
            counter += 1
        f.close()
    os.remove("src/newfile.txt")

def branchAddressing(syntax, counter):
    currentFunction = ''
    instruction = syntax[0:4]    
    if instruction in functionDictionary:
        currentFunction = functionDictionary[instruction]
    else:
        pass
    
    value = currentFunction

    if(instruction[3] == 'D'):
        tempcount = int(branchDictionary[syntax[5:-1]], 2) - counter - 2
        
        jump = bin(tempcount)[2:].zfill(24)
        value = value + jump 
    else:
        tempcount = counter + 2 - int(branchDictionary[syntax[5:-1]], 2)
        
        jump = bin(tempcount)[2:].zfill(24)
        value = value + jump
        
    
    return value

def specialAddressing(syntax):
    syntaxString = syntax[6:]
    parts = syntaxString.split(",")

    if "[" in parts[1]: 
        numbers = []

        for char in syntax[6:]:
            if char.isdigit():
                numbers.append(int(char))

        rb = bin(numbers[0])[2:].zfill(4)
        rd = bin(numbers[1])[2:].zfill(4)
        imm = bin(numbers[2])[2:].zfill(12)

        if(syntax[0] == 'G'):
            value = '1110' + '01' + '011000' + rb + rd + imm
        
        elif(syntax[0] == 'O'):
            value = '1110' + '01' + '011001' + rb + rd + imm
        
        return value
    else: 
        instruction = syntax[0:4]

        if instruction in functionDictionary:
            currentFunction = functionDictionary[instruction]
        else:
            pass

        numbers = []
        for element in syntax[6:].split(","):
            if any(c.isdigit() for c in element):
                numbers.append(int(''.join(filter(str.isdigit, element))))

        if(syntax[0] == 'M'):
            rb = bin(numbers[0])[2:].zfill(4)
            imm = bin(numbers[1])[2:].zfill(8)
            value = '1110' + '00' + currentFunction + '0000' + rb + '0000' + imm
        
        elif(syntax[0] == 'C'):
            rs1 = bin(numbers[0])[2:].zfill(4)
            rs2 = bin(numbers[1])[2:].zfill(4)
            value = '1110' + '00' + '010101' + rs1 + '0000' + '00000000' + rs2
        
        return value


def registerAddressing(syntax):
    instruction = syntax[0:4]

    if instruction in functionDictionary:
        currentFunction = functionDictionary[instruction]
    else:
        pass

    numbers = []
    for element in syntax[6:].split(","):
        if any(c.isdigit() for c in element):
            numbers.append(int(''.join(filter(str.isdigit, element))))

    rb = bin(numbers[0])[2:].zfill(4)
    rs1 = bin(numbers[1])[2:].zfill(4)
    rs2 = bin(numbers[2])[2:].zfill(4)
    
    value = '1110' + '00' + currentFunction + rs1 + rb + '00000000' + rs2
    return value


def immediateAddressing(syntax):
    instruction = syntax[0:4]

    if instruction in functionDictionary:
        currentFunction = functionDictionary[instruction]
    else:
        pass

    numbers = []
    for element in syntax[6:].split(","):
        if any(c.isdigit() for c in element):
            numbers.append(int(''.join(filter(str.isdigit, element))))

    rb = bin(numbers[0])[2:].zfill(4)
    rd = bin(numbers[1])[2:].zfill(4)
    imm = bin(numbers[2])[2:].zfill(8)

    value = '1110' + '00' + currentFunction + rb + rd + '0000' + imm
    return value
    

def main():
    reader_branches()
    reader()
    romInit(32, 256)

if __name__ == '__main__':
    main()
