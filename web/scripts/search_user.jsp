<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.DriverManager" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Searching User</title>
    </head>
    <body>
        <%
            String email    = request.getParameter("email");
            String password = request.getParameter("senha");

            Connection conexaoBD           = null;
            PreparedStatement execute       = null;
            ResultSet  responseBD          = null;
            Class.forName("com.mysql.cj.jdbc.Driver");

            try{
                String url  = "jdbc:mysql://localhost:3306/aeroporto";
                String userDB = "root";
                String passwordDB = "";
                conexaoBD       = DriverManager.getConnection(url, userDB, passwordDB);
                
            }catch(Exception e){
                out.print("Erro ao conectar no banco de dados: " + e);
                
            }
            
            String query = ("SELECT * FROM tbl_client WHERE email_client=? AND password_client=?");
            try{
                execute    = conexaoBD.prepareStatement(query);
                execute.setString(1, email);
                execute.setString(2, password);
                responseBD = execute.executeQuery();

                if (!responseBD.next()) {
                    out.print("Erro! Cliente não localizado.");
                    responseBD.close();
                    execute.close();
                    conexaoBD.close();

                } else {
                    response.sendRedirect("home.html");
                    
                }
                
            }catch(Exception x){
                out.print("Erro ao executar a query: " + x);
                responseBD.close();
                execute.close();
                conexaoBD.close();
                
            }
        %>
    </body>
</html>