<%-- 
    Document   : newOlen
    Created on : Dec 7, 2017, 6:10:35 PM
    Author     : hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Жаңа өлен қосу</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <table class="table">
              <thead>
                <tr>
                  <th>Тақырыбы</th>
                  <th>Өлен жолдары</th>
                  <th>Тілі</th>
                </tr>
              </thead>
               
               <form action="olenKosu" method="POST">
                   <tbody>
                       <tr>
                           <td><input type="text" name="takirip" placeholder="Жаз"></td>
                           <td><input type="text" name="wumak" placeholder="Жазды күні шілде болғанда..."></td>
                           <td><input type="radio" name="categories" value=1> Қазақ тілінде
                            <input type="radio" name="categories" value=2> Русский язык
                            <input type="radio" name="categories" value=3> English
                           </td>
                    </tr>
                    <hr>
                    <td><input type="submit" value="Опубликовать"></td>
                    </tbody>
               </form>
              <td><a href="javascript:history.back()">Go Back</a></td>
            </table>
        </div>
    </body>
</html>
