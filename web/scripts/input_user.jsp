
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.DriverManager" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting User</title>
    </head>
    <body>
        <%
            String name     = request.getParameter("name");
            String cpf      = request.getParameter("cpf");
            String phone    = request.getParameter("phone");
            String birth    = request.getParameter("birth");
            String adress   = request.getParameter("adress");
            String email    = request.getParameter("email");
            String password = request.getParameter("password");

            Connection conexaoBD           = null;
            PreparedStatement execute      = null;
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
            
           String query = "INSERT INTO tbl_client(name_client, cpf_client, phone_client, birth_cliente, adress_client, email_client, password_client) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try{
                execute    = conexaoBD.prepareStatement(query);
                execute.setString(1, name);
                execute.setString(2, cpf);
                execute.setString(3, phone);
                execute.setString(4, birth);
                execute.setString(5, adress);
                execute.setString(6, email);
                execute.setString(7, password);
                responseBD = execute.executeUpdate();

                if (!responseBD.next()) {
                    out.print(responseBD);
                    // responseBD.close();
                    // execute.close();
                    // conexaoBD.close();

                } else {
                    out.print(responseBD);
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
