package gestion;

public interface ObjetoOID {
	public Object getOID(String goid);
	public void setOID(String goid, Object contenido) throws OIDException;
}
