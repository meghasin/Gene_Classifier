import sys
import os.path
def readFASTAs(fileName):
    with open(fileName, 'r') as file:
        v = []
        genome = ''
        for line in file:
            if line[0] != '>':
                genome += line.strip()
            else:
                v.append(genome.upper())
                genome = ''
        v.append(genome.upper())
        del v[0]
    return v

input = sys.argv[1]
path = "~/fasta_splitter/splitted_files/" + input
DNA_seq = readFASTAs(input)
#print(DNA_seq[0])
DNA_seq = [x for x in DNA_seq if x != 'SEQUENCE UNAVAILABLE']
#print(DNA_seq)
header = "Seq_id" + "\t" + "AT_prop" + "\t" + "GC_prop" + "\t" + "N_content" + "\t" + "ATGC_ratio" + "\t" + "GC_cum_skew" + "\t" + "AT_cum_skew" + "\t" + "Zcurve_x" + "\t" \
         + "Zcurve_y" + "\t" + "Zcurve_z" + "\n"

counter = 0

head, tail = os.path.split(sys.argv[1])
print(tail)
outdir = sys.argv[2]
output = "feature" + tail
output1 = outdir + "/" + output
print(output1)

with open(output1, 'w') as f:
    f.write(header)
    for i in DNA_seq:
        t = ""
        Sequence = i
        # print(Sequence)
        A_content = Sequence.count("A")
        T_content = Sequence.count("T")
        G_content = Sequence.count("G")
        C_content = Sequence.count("C")
        N_content = Sequence.count("N")
        # How many A and T are present
        AT_content = A_content + T_content
        AT_prop: float = AT_content / len(DNA_seq)
        # How many G and C are present
        GC_content = G_content + C_content
        GC_prop: float = GC_content / len(DNA_seq)
        #ATGC ratio
        ATGC_ratio = (A_content + T_content) / (G_content + C_content) if (G_content + C_content) != 0 else 0

        GC_cum_skew = (G_content - C_content) / (G_content + C_content) if (G_content + C_content) != 0 else 0
        AT_cum_skew = (A_content - T_content) / (A_content + T_content) if (A_content + T_content) != 0 else 0

        Zcurve_x = (A_content + G_content) - (C_content + T_content)
        Zcurve_y = (A_content + C_content) - (G_content + T_content)
        Zcurve_z = (A_content + T_content) - (C_content + G_content)

        t = t + str(counter) + "\t" + str(AT_content) + "\t" + str(GC_content) + "\t" + str(N_content) + "\t" + str(ATGC_ratio) + "\t" + str(GC_cum_skew) + "\t" + str(AT_cum_skew) + "\t"\
            + str(Zcurve_x) + "\t" + str(Zcurve_y) + "\t" + str(Zcurve_z) + "\n"

        f.write(t)
        counter = counter + 1
