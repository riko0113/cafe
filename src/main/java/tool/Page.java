package tool;

import java.io.PrintWriter;

public class Page {

    // HTMLの先頭部分(共通部品化)
    public static void header(PrintWriter out) {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>Servlet/JSP Sample Programs</title>");
        out.println("</head>");
        out.println("<body>");
    }

    // HTMLの末尾部分(共通部品化)
    public static void footer(PrintWriter out) {
        out.println("</body>");
        out.println("</html>");
    }
}
