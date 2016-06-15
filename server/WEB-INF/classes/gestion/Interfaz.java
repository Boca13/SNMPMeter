package gestion;

import java.util.*;

public class Interfaz  implements ObjetoOID{
	public String oid = "1.3.6.1.2.1.2";

	public enum eIfOperStatus{
		up(1),down(2),testing(3),unknown(4),dormant(5),notPresent(6),lowerLayerDown(7);
		private int valor;
		 
	    eIfOperStatus(int valor) {
	        this.valor = valor;
	    }
	    public static eIfOperStatus fromInteger(int x) {
	        switch(x) {
	        case 1:
	            return up;
	        case 2:
	            return down;
	        case 3:
	            return testing;
	        case 4:
	            return unknown;
	        case 5:
	            return dormant;
	        case 6:
	            return notPresent;
	        case 7:
	            return lowerLayerDown;
	        }
	        return null;
	    }
	    public int getValor() {
	        return valor;
	    }
	}
	
	// Objetos
	public int ifIndex; // .1.3.6.1.2.1.2.2.1.1
	public String ifDescr; // .1.3.6.1.2.1.2.2.1.2
	public int ifType; // .1.3.6.1.2.1.2.2.1.3
	public int ifMtu; // .1.3.6.1.2.1.2.2.1.4
	public int ifSpeed; // .1.3.6.1.2.1.2.2.1.5
	public String ifPhysAddress; // .1.3.6.1.2.1.2.2.1.6
	public int ifAdminStatus; // .1.3.6.1.2.1.2.2.1.7
	public eIfOperStatus ifOperStatus=eIfOperStatus.unknown; // .1.3.6.1.2.1.2.2.1.8
	public int ifLastChange; // .1.3.6.1.2.1.2.2.1.9
	public int ifInOctets; // .1.3.6.1.2.1.2.2.1.10
	public int ifInUcastPkts; // .1.3.6.1.2.1.2.2.1.11
	public int ifInNUcastPkts; // .1.3.6.1.2.1.2.2.1.12
	public int ifInDiscards; // .1.3.6.1.2.1.2.2.1.13
	public int ifInErrors; // .1.3.6.1.2.1.2.2.1.14
	public int ifInUnkownProtos; // .1.3.6.1.2.1.2.2.1.15
	public int ifOutOctets; // .1.3.6.1.2.1.2.2.1.16
	public int ifOutUcastPkts; // .1.3.6.1.2.1.2.2.1.17
	public int ifOutNUcastPkts; // .1.3.6.1.2.1.2.2.1.18
	public int ifOutDiscards; // .1.3.6.1.2.1.2.2.1.19
	public int ifOutErrors; // .1.3.6.1.2.1.2.2.1.20
	public int ifOutQLen; // .1.3.6.1.2.1.2.2.1.21
	public String ifSpecific; // .1.3.6.1.2.1.2.2.1.22
	
	public long timestamp=new Date().getTime();

	public Object getOID(String goid) {
		if (goid.startsWith(oid)) {
			String s = goid.substring(0, goid.lastIndexOf("."));
			switch (s.substring(s.lastIndexOf(".")+1)){
			case "1":
				return ifIndex;
			case "2":
				return ifDescr;
			case "3":
				return ifType;
			case "4":
				return ifMtu;
			case "5":
				return ifSpeed;
			case "6":
				return ifPhysAddress;
			case "7":
				return ifAdminStatus;
			case "8":
				return ifOperStatus.getValor();
			case "9":
				return ifLastChange;
			case "10":
				return ifInOctets;
			case "11":
				return ifInUcastPkts;
			case "12":
				return ifInNUcastPkts;
			case "13":
				return ifInDiscards;
			case "14":
				return ifInErrors;
			case "15":
				return ifInUnkownProtos;
			case "16":
				return ifOutOctets;
			case "17":
				return ifOutUcastPkts;
			case "18":
				return ifOutNUcastPkts;
			case "19":
				return ifOutDiscards;
			case "20":
				return ifOutErrors;
			case "21":
				return ifOutQLen;
			case "22":
				return ifSpecific;
			default:
				return null;
			}
		} else
			return null;
	}

	public void setOID(String goid, Object contenido) throws OIDException {
		if (goid.startsWith(oid)) {
			String s = goid.substring(0, goid.lastIndexOf("."));
			switch (s.substring(s.lastIndexOf(".")+1)) {
			case "1":
				ifIndex = Integer.parseInt((String)  contenido) ;
				break;
			case "2":
				ifDescr = ((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "3":
				ifType = Integer.parseInt((String)  contenido) ;
				break;
			case "4":
				ifMtu = Integer.parseInt((String)  contenido) ;
				break;
			case "5":
				ifSpeed = Integer.parseInt((String)  contenido) ;
				break;
			case "6":
				ifPhysAddress = ((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			case "7":
				ifAdminStatus = Integer.parseInt((String)  contenido) ;
				break;
			case "8":
				ifOperStatus = eIfOperStatus.fromInteger(Integer.parseInt((String)  contenido));
				break;
			case "9":
				ifLastChange = Integer.parseInt((String)  contenido) ;
				break;
			case "10":
				ifInOctets = Integer.parseInt((String)  contenido) ;
				break;
			case "11":
				ifInUcastPkts = Integer.parseInt((String)  contenido) ;
				break;
			case "12":
				ifInNUcastPkts = Integer.parseInt((String)  contenido) ;
				break;
			case "13":
				ifInDiscards = Integer.parseInt((String)  contenido) ;
				break;
			case "14":
				ifInErrors = Integer.parseInt((String)  contenido) ;
				break;
			case "15":
				ifInUnkownProtos = Integer.parseInt((String)  contenido) ;
				break;
			case "16":
				ifOutOctets = Integer.parseInt((String)  contenido) ;
				break;
			case "17":
				ifOutUcastPkts = Integer.parseInt((String)  contenido) ;
				break;
			case "18":
				ifOutNUcastPkts = Integer.parseInt((String)  contenido) ;
				break;
			case "19":
				ifOutDiscards = Integer.parseInt((String)  contenido) ;
				break;
			case "20":
				ifOutErrors = Integer.parseInt((String)  contenido) ;
				break;
			case "21":
				ifOutQLen = Integer.parseInt((String)  contenido) ;
				break;
			case "22":
				ifSpecific = ((String)contenido).substring(2,((String)contenido).length()-1);
				break;
			default:
				throw new OIDException("OID not found");
			}
		} else
			throw new OIDException("OID not found");
	}
}
