package gestion;

//Clase con las c interfaces de un agente
public class Interfaces implements ObjetoOID{
	public Interfaz[] interfaces;
	public String oid = "1.3.6.1.2.1.2";
	public Interfaces(int c) {
		interfaces = new Interfaz[c];
		
		for(int n = 0; n<c; n++)
			interfaces[n]=new Interfaz();
	}
	@Override
	public Object getOID(String goid) {
		return interfaces[Integer.parseInt(goid.substring(goid.lastIndexOf(".")+1))-1].getOID(goid);
	}
	@Override
	public void setOID(String goid, Object contenido) throws OIDException {
		interfaces[Integer.parseInt(goid.substring(goid.lastIndexOf(".")+1))-1].setOID(goid, contenido);
	}
}
