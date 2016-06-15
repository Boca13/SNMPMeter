package gestion;

import java.util.*;

public class Sensor implements ObjetoOID {

	public String id;
	
	public System system;
	public List<Interfaces> interfaces; // Irán según resolución

	int nInterfaces = 0;
	
	public static String oidSystem = "1.3.6.1.2.1.1";
	public static String oidInterfaz = "1.3.6.1.2.1.2";
	
	int max = 1000;

	public Sensor(String ID, int numInterfaces) {
		id = ID;
		system = new System();
		interfaces = new LinkedList<Interfaces>();
		nInterfaces=numInterfaces;
	}

	public void add() {
		if (interfaces.size() == max)
			interfaces.remove(0);
		interfaces.add(new Interfaces(nInterfaces));
	}

	public boolean esInterfaces(String oid){
		return (oid.startsWith(oidInterfaz));
	}
	
	public boolean esSystem(String oid){
		return (oid.startsWith(oidSystem));
	}

	/*
	 * Devuelve los datos del último elemento de la cola. Debe utilizarse para
	 * acceder a los últimos datos, nunca para gráficos.
	 */
	@Override
	public Object getOID(String goid) {
		if (goid.startsWith(system.oid)) {
			return system.getOID(goid);
		} else {
			if (interfaces.size() > 0)
				return interfaces.get(interfaces.size() - 1).getOID(goid);
			else
				return null;
		}
	}

	/*
	 * Establece los datos del último elemento de la cola. Debe utilizarse para
	 * acceder a los últimos datos, nunca para gráficos.
	 */
	@Override
	public void setOID(String goid, Object contenido) throws OIDException {
		if (goid.startsWith(system.oid)) {
			system.setOID(goid, contenido);
		} else {
			if (interfaces.size() > 0)
				interfaces.get(interfaces.size() - 1).setOID(goid, contenido);
		}
	}

	/*
	 * Devuelve los datos del elemento n de la cola. Debe utilizarse para
	 * representar los gráficos.
	 */
	public Object getOID(String goid, int n) {
		if (goid.startsWith(system.oid)) {
			return system.getOID(goid);
		} else {
			if (interfaces.size() > n)
				return interfaces.get(n).getOID(goid);
			else
				return null;
		}
	}

}
