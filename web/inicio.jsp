    <%@include file="WEB-INF/fragmentos/top.jspf"%>
    <nav class="carousel">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin: center">
        <!-- Indicadores -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="img/img1.jpg" alt="">
            <div class="carousel-caption">
              
            </div>
          </div>
          <div class="item">
            <img src="img/img2.jpg" alt="">
            <div class="carousel-caption">
            </div>
          </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
 
         <%
         //out.print(request.getParameter("tipo"));
         //out.print(session.getAttribute("usuario"));
         %>
      

     <script>
     
     $('.carousel').carousel({
 
          interval: 1000,
          pause:"hover"
 
     });
     
     </script>
</nav>

<%@include file="WEB-INF/fragmentos/bottom.jspf"%>