import java.io.*;
import org.antlr.v4.runtime.*;

public class Main {

    public static void main(String[] args) {
        try{
            System.setOut(new PrintStream(new File("output.txt")));

            CharStream input = CharStreams.fromFileName(args[0]);
            HelloLexer analex = new HelloLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(analex);
            HelloParser anasint = new HelloParser(tokens);
            anasint.r();
        } catch (org.antlr.v4.runtime.RecognitionException e) {
            System.err.println("REC " + e.getMessage());
        } catch (IOException e) {
            System.err.println("IO " + e.getMessage());
        } catch (java.lang.RuntimeException e) {
            System.err.println("RUN " + e.getMessage());
        }


    }
}
