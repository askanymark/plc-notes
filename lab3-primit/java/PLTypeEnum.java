import java.util.Scanner;
import java.util.InputMismatchException;
import java.util.EnumSet;

public class PLTypeEnum
{
    enum PL { JAVA, C, ADA, PYTHON, LISP, HASKELL, PROLOG }

    enum PLType { OO, PROCEDURAL, FUNCTIONAL, LOGICAL }

    private static <E extends Enum<E>> E getEnumElement(String elementTypeName, Class<E> elementType)
    {
        boolean haveResult = false;
        E result = null;
        Scanner stdin = new Scanner(System.in);

        while ( ! haveResult )
        {
            System.out.print("Input " + elementTypeName + ": ");
            try
            {
                result = Enum.valueOf(elementType, stdin.next().toUpperCase());
                haveResult = true;
            }
            catch (IllegalArgumentException e)
            {
                System.out.println("Not a valid " + elementTypeName + ".");
                stdin.nextLine(); // skip the invalid input
            }
        }

        return result;
    }

    private static PL plType2PL (PLType plType)
    {
        PL pl = null;

        switch (plType)
        {
            case OO:
                pl = PL.JAVA;
                break;
            case PROCEDURAL:
                pl = PL.ADA;
                break;
            case FUNCTIONAL:
                pl = PL.HASKELL;
                break;
            case LOGICAL:
                pl = PL.PROLOG;
                break;
        }

        return pl;
    }

    public static void main(String[] args)
    {
        System.out.print("Known PL types = ");
        for (PLType t : EnumSet.allOf(PLType.class))
        {
            System.out.print(t + " ");
        }
        System.out.println();

        PLType plType = getEnumElement("programming language type", PLType.class);
        System.out.println(plType + " example language: " + plType2PL(plType));
    }
}
