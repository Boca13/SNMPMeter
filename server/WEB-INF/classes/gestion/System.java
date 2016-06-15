package gestion;

public class System implements ObjetoOID {
	public String oid = "1.3.6.1.2.1.1";
	
	//Objetos
	public String sysDescr="-"; //1.3.6.1.2.1.1.1.0
	public String sysObjectID="-"; //1.3.6.1.2.1.1.2.0
	public int	sysUpTime; //1.3.6.1.2.1.1.3.0
	public String sysContact="-"; //1.3.6.1.2.1.1.4.0
	public String sysName="-"; //1.3.6.1.2.1.1.5.0
	public String sysLocation="-"; //1.3.6.1.2.1.1.6.0
	public byte sysServices; //1.3.6.1.2.1.1.7.0
	
	public Object getOID(String goid){
		if(goid.startsWith(oid)){
			switch(goid.substring(goid.lastIndexOf(oid)+goid.length()-3)){
			case "1.0":
				return sysDescr;
			case "2.0":
				return sysObjectID;
			case "3.0":
				return sysUpTime;
			case "4.0":
				return sysContact;
			case "5.0":
				return sysName;
			case "6.0":
				return sysLocation;
			case "7.0":
				return sysServices;
			default:
				return null;
			}
		}
		else
			return null;
	}
	
	public void setOID(String goid, Object contenido) throws OIDException{
		if(goid.startsWith(oid)){
			switch(goid.substring(goid.lastIndexOf(oid)+goid.length()-3)){
			case "1.0":
				sysDescr=((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "2.0":
				sysObjectID=((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "3.0":
				sysUpTime=Integer.parseInt((String) contenido);
				break;
			case "4.0":
				sysContact=((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "5.0":
				sysName=((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "6.0":
				sysLocation=((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "7.0":
				sysServices=(byte)Integer.parseInt((String) contenido);
				break;
			default:
				throw new OIDException("OID not found");
			}
		}
		else
			throw new OIDException("OID not found");
	}
}
