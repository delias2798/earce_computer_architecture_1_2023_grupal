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
}

def romInit(wordSize, depth):

    romFile = open("src/ram.mif", "r+")
    romFile.truncate(0)
    
    romFile.write("--------------------- Tessia v1.0.0 ---------------------\n\n")

    romFile.write(f'WIDTH={wordSize};\nDEPTH={depth};\n \n')
    romFile.write("ADDRESS_RADIX=UNS;\nDATA_RADIX=HEX;\n \n")
    romFile.write("CONTENT BEGIN\n")
    
    counter = 0

    binaryFile = open('src/binary.txt', 'r')
    
    for instruction in binaryFile:
        romFile.write(f'\t{counter}\t :\t {instruction};\n')
        counter += 1
        
    romFile.write(f'\t{counter}\t :\t {1};\n')

    counter += 1
    romFile.write(f'\t[{counter}..{depth-1}]\t :\t {0};\n')
    
    romFile.write("END;")
    romFile.write("\n\n--------------------- Tessia v1.0.0 ---------------------\n\n")
    romFile.close()


def reader():
    with open('src/file.txt', 'r') as f:
        binaryFile = open('src/binary.txt', 'w')
        for line in f:
            if(line[0:4][3] == 'I'):
                imm = immediateAddressing(line)
                binaryFile.write(imm + '\n')
            elif (line[0:4][3] == 'R'):
                reg = registerAddressing(line)
                binaryFile.write(reg + '\n')
            elif (line[0:4][3] == 'A' or line[0:4][3] == 'D'):
                #Instrucciones de branch
                pass
            elif (line[0:4][3] == 'E'):
                spec = specialAddressing(line)
                binaryFile.write(spec + '\n')


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
            value = '1110' + '00' + currentFunction + rs1 + '0000' + '00000000' + rs2
        
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
    reader()
    romInit(32, 256)

if __name__ == '__main__':
    main()