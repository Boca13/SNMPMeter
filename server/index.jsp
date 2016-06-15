<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="gestion.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%!static Sensores sensores = new Sensores();%>
<%
	try {
		String action = request.getParameter("action");
		if (action == null)
			action = "";
		if (action.equals("submit")) {
			int misensor = sensores.buscar(request.getParameter("id"));
			if (misensor != -1) {
				String nombre, valor;
				boolean creado=false;
				Enumeration<String> parametros = request.getParameterNames();

				while (parametros.hasMoreElements()) {
					try {
						nombre = parametros.nextElement();
						valor = request.getParameter(nombre);
						if ((!nombre.equals("id")) && (!nombre.equals("action"))) {
							if ((sensores.sensores.get(misensor).esInterfaces(nombre))&&(!creado)){
								sensores.sensores.get(misensor).add();
								creado=true;
							}
							sensores.sensores.get(misensor).setOID(nombre, valor);
							out.println("<p>OID: "+ nombre+ " Valor: "+ sensores.sensores.get(misensor).getOID(nombre) + "</p>");
						}

					} catch (OIDException ex) {
						log("OID desconocido: " + ex.toString());
					}

				}
				/*for (int c = 1; c <= 22; c++) {
					if (sensores.sensores.get(misensor).getOID(Sensor.oidInterfaz + "." + c) == null)
						sensores.sensores.get(misensor).setOID(Sensor.oidInterfaz + "."	+ c,sensores.sensores.get(misensor).interfaces.get(sensores.sensores.get(misensor).interfaces.size()));
				}*/
			}
		} else if (action.equals("register")) {
			String id = request.getParameter("id");
			String n = request.getParameter("n");
			if ((id != null) && (n != null)) {
				if (sensores.buscar(id) == -1) {
					sensores.sensores.add(new Sensor(id, Integer
							.parseInt(n)));
					out.print("OK");
				} else
					out.print("Error: ya existe un sensor con este id.");
			} else
				out.print("Error: no se ha especificado un id.");
		} else {
			//Mostrar datos
			String id = request.getParameter("id");
			if (id != null) {
				int misensor = sensores.buscar(request
						.getParameter("id"));
				if(misensor>=0){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilo.css"></link>
<title>Net-o-meter</title>
</head>
<body>
<a name="top"></a>
<img src="banner.png" width="66%"></img>
<h1>System</h1>
	<table>
		<tr>
			<td>sysDescr</td>
			<td><%=sensores.sensores.get(misensor).system.sysDescr%></td>
		</tr>
		<tr>
			<td>sysObjectID</td>
			<td><%=sensores.sensores.get(misensor).system.sysObjectID%></td>
		</tr>
		<tr>
			<td>sysUpTime</td>
			<td><%=sensores.sensores.get(misensor).system.sysUpTime%></td>
		</tr>
		<tr>
			<td>sysContact</td>
			<td><%=sensores.sensores.get(misensor).system.sysContact%></td>
		</tr>
		<tr>
			<td>sysName</td>
			<td><%=sensores.sensores.get(misensor).system.sysName%></td>
		</tr>
		<tr>
			<td>sysLocation</td>
			<td><%=sensores.sensores.get(misensor).system.sysLocation%></td>
		</tr>
		<tr>
			<td>sysServices</td>
			<td><%=sensores.sensores.get(misensor).system.sysServices%></td>
		</tr>
	</table>
	
	<%int last = sensores.sensores.get(misensor).interfaces.size()-1; %>
	<h1>Interfaces</h1>
	<table>
		<tr>
			<td>ifIndex</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifIndex%></td><%}%>
		</tr>
		<tr>
			<td>ifDescr</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifDescr%></td><%}%>
		</tr>
		<tr>
			<td>ifType</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifType%></td><%}%>
		</tr>
		<tr>
			<td>ifMtu</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifMtu%></td><%}%>
		</tr>
		<tr>
			<td>ifSpeed</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifSpeed%></td><%}%>
		</tr>
		<tr>
			<td>ifPhysAddress</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%=sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifPhysAddress%></td><%}%>
		</tr>
		<tr>
			<td>ifOperStatus</td>
			<%for(byte i=0;i<sensores.sensores.get(misensor).interfaces.get(0).interfaces.length;i++){%><td><%= sensores.sensores.get(misensor).interfaces.get(last).interfaces[i].ifOperStatus.toString()%></td><%}%>
		</tr>
	</table>
	
	<h1>Gráficas de interfaces</h1>
	<ul>
	<li><a href="#g0">ifInOctets</a></li>
	<li><a href="#g1">ifOutOctets</a></li>
	<li><a href="#g2">ifInErrors</a></li>
	<li><a href="#g3">ifOutErrors</a></li>
	<li><a href="#g4">Throughput: entrada</a></li>
	<li><a href="#g5">Throughput: salida</a></li>
	</ul>
	<a href="#g0"></a>
	<!-- SCRIPT GRÁFICAS -->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <%
    byte oids[]={10,16,14,20};
    String graficas[]={"ifInOctets","ifOutOctets","ifInErrors","ifOutErrors"};
    String leyendas[]={"Octetos","Octetos","Errores","Errores"};
    for(byte g=0;g<4;g++){ %>
    <script type="text/javascript">
    google.load('visualization', '1', {packages: ['corechart', 'bar']});
    google.setOnLoadCallback(drawStacked);
    function drawStacked() {
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'time');
          
          <%for (int x = 0; x < sensores.sensores.get(misensor).interfaces.get(0).interfaces.length; x++){%>
          data.addColumn('number', '<%=sensores.sensores.get(misensor).interfaces.get(0).interfaces[x].ifDescr%>'); //añade el numero de la interfaz, no se si hay que usar "" o '',  "no se si funciona any"
          <%}%>
          data.addRows([<%for (int i = 0; i < sensores.sensores.get(misensor).interfaces.size(); i++){%>
            [<%=(sensores.sensores.get(misensor).interfaces.get(i).interfaces[0].timestamp)%>,
             <%for (int x = 0; x < sensores.sensores.get(misensor).interfaces.get(i).interfaces.length; x++){ %>
             <%= sensores.sensores.get(misensor).getOID("1.3.6.1.2.1.2.2.1."+oids[g]+"."+(x+1),i)%>,
             <%}%>],<%}%>]);
 
          var options = {
            title: '<%= graficas[g] %>',
            isStacked: true,
            hAxis: {
              title: 'tiempo',             
            },
            vAxis: {
              title: '<%=leyendas[g]%>'
            }
          };
 
          var chart = new google.visualization.AreaChart(document.getElementById('g<%=g%>'));
          chart.draw(data, options);
        }
    </script><%}%>
    
    <%
    String graficas2[]={"Throughput: entrada","Throughput: salida"};
    for(byte g=0;g<2;g++){ %>
    <script type="text/javascript">
    google.load('visualization', '1', {packages: ['corechart', 'bar']});
    google.setOnLoadCallback(drawStacked);
 
    function drawStacked() {
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'time');
          
          <%for (int x = 0; x < sensores.sensores.get(misensor).interfaces.get(0).interfaces.length; x++){%>
          data.addColumn('number', '<%=sensores.sensores.get(misensor).interfaces.get(0).interfaces[x].ifDescr%>'); //añade el numero de la interfaz, no se si hay que usar "" o '',  "no se si funciona any"
          <%}%>
          data.addRows([<%for (int i = 0; i < sensores.sensores.get(misensor).interfaces.size()-1; i++){%>
            [<%=(sensores.sensores.get(misensor).interfaces.get(i).interfaces[0].timestamp)%>,
             <%for (int x = 0; x < sensores.sensores.get(misensor).interfaces.get(i).interfaces.length; x++){ %>
             <%= ((Integer)sensores.sensores.get(misensor).getOID("1.3.6.1.2.1.2.2.1."+oids[g]+"."+(x+1),i+1)-(Integer)sensores.sensores.get(misensor).getOID("1.3.6.1.2.1.2.2.1."+oids[g]+"."+(x+1),i))*1000/(sensores.sensores.get(misensor).interfaces.get(i+1).interfaces[0].timestamp-sensores.sensores.get(misensor).interfaces.get(i).interfaces[0].timestamp)%>,
             <%}%>],<%}%>]);
 
          var options = {
            title: '<%= graficas2[g] %>',
            isStacked: true,
            hAxis: {
              title: 'tiempo',             
            },
            vAxis: {
              title: 'B/s'
            }
          };
 
          var chart = new google.visualization.AreaChart(document.getElementById('g<%=g+4%>'));
          chart.draw(data, options);
        }
    </script><%}%>
    <script type="text/javascript">
    	setTimeout(function(){window.location.reload(1);}, 60000);
    </script>
    
    <div id="graficas"><a name="g0"></a><div id="g0"></div><a href="#top">Volver arriba &uarr;</a><a name="g1"></a><div id="g1"></div><a href="#top">Volver arriba &uarr;</a><div id="g2"></div><a href="#top">Volver arriba &uarr;</a><div id="g3"></div><a href="#top">Volver arriba &uarr;</a><div id="g4"></div><a href="#top">Volver arriba &uarr;</a><div id="g5"></div><a href="#top">Volver arriba &uarr;</a></div>
    </body></html>
    <!-- -------- -->
	<%
				}
				else
					out.println("id no encontrado.");
			} else {
	%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilo.css"></link>
<title>Net-o-meter</title>
</head>
<body>
<img src="banner.png" width="66%"></img>
	<form action="index.jsp" method="get">
		<p>Introduzca ID del sensor a consultar:</p>
		<input type="text" name="id"></input>
		<input type="submit"
			title="Aceptar"></input>
	</form>
		<p>O escoja uno de la lista:</p>
		<form action="index.jsp" method="get">
		<select name="id">
		<%for(int c=0;c<sensores.sensores.size();c++){
		String cid=sensores.sensores.get(c).id;%>
		<option value="<%=cid%>"><%=cid%></option>
		<%} %>
		</select>
		<input type="submit"
			title="Aceptar"></input>
	</form>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
<%
	}
		}
	} catch (Exception ex) {
		log(ex.toString(), ex);
	}
%>