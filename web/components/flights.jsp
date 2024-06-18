<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Voos</title>
        <link rel="stylesheet" href="style_list.css">
    </head>
    <body>
        <%
            Connection Conexao;
            PreparedStatement PrepararConexao;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url  = "jdbc:mysql://localhost:3306/bancojsp";
            String user = "root";
            String pwd  = "";
            
            Conexao = DriverManager.getConnection(url, user, pwd);
            
            String comandoSQL     =("SELECT * FROM tbl_produto");
            PrepararConexao       = Conexao.prepareStatement(comandoSQL);
            ResultSet respostaSQL = PrepararConexao.executeQuery();
            
        %>
        
        <table border="1";>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Preço</th>
            </tr>
            <% 
                while(respostaSQL.next()) {
            %>
            
            <tr>
                <td><%=respostaSQL.getString("codigo")%></td>
            
                <td><%=respostaSQL.getString("nome")%></td>

                <td><%=respostaSQL.getString("marca")%></td>

                <td><%=respostaSQL.getString("preco")%></td>
            </tr>
            
            <%
                }
            %>
        </table>              

    </body>
</html>