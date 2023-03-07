package board;

public class BoardBean {
	private int bor_num;
	private String bor_name;
	private String bor_subject;
	private String bor_content;
	private int bor_pos;
	private int bor_ref;
	private int bor_depth;
	private String bor_regdate;
	private String bor_pass;
	private String bor_ip;
	private int bor_count;
	private String bor_filename;
	private int bor_filesize;
	
	public int getBor_num() {
		return bor_num;
	}
	public void setBor_num(int bor_num) {
		this.bor_num = bor_num;
	}
	public String getBor_name() {
		return bor_name;
	}
	public void setBor_name(String bor_name) {
		this.bor_name = bor_name;
	}
	public String getBor_subject() {
		return bor_subject;
	}
	public void setBor_subject(String bor_subject) {
		this.bor_subject = bor_subject;
	}
	public String getBor_content() {
		return bor_content;
	}
	public void setBor_content(String bor_content) {
		this.bor_content = bor_content;
	}
	public int getBor_pos() {
		return bor_pos;
	}
	public void setBor_pos(int bor_pos) {
		this.bor_pos = bor_pos;
	}
	public int getBor_ref() {
		return bor_ref;
	}
	public void setBor_ref(int bor_ref) {
		this.bor_ref = bor_ref;
	}
	public int getBor_depth() {
		return bor_depth;
	}
	public void setBor_depth(int bor_depth) {
		this.bor_depth = bor_depth;
	}
	public String getBor_regdate() {
		return bor_regdate;
	}
	public void setBor_regdate(String bor_regdate) {
		this.bor_regdate = bor_regdate;
	}
	public String getBor_pass() {
		return bor_pass;
	}
	public void setBor_pass(String bor_pass) {
		this.bor_pass = bor_pass;
	}
	public String getBor_ip() {
		return bor_ip;
	}
	public void setBor_ip(String bor_ip) {
		this.bor_ip = bor_ip;
	}
	public int getBor_count() {
		return bor_count;
	}
	public void setBor_count(int bor_count) {
		this.bor_count = bor_count;
	}
	public String getBor_filename() {
		return bor_filename;
	}
	public void setBor_filename(String bor_filename) {
		this.bor_filename = bor_filename;
	}
	public int getBor_filesize() {
		return bor_filesize;
	}
	public void setBor_filesize(int bor_filesize) {
		this.bor_filesize = bor_filesize;
	}
	public BoardBean(int bor_num, String bor_name, String bor_subject, String bor_content, int bor_pos, int bor_ref,
			int bor_depth, String bor_regdate, String bor_pass, String bor_ip, int bor_count, String bor_filename,
			int bor_filesize) {
		super();
		this.bor_num = bor_num;
		this.bor_name = bor_name;
		this.bor_subject = bor_subject;
		this.bor_content = bor_content;
		this.bor_pos = bor_pos;
		this.bor_ref = bor_ref;
		this.bor_depth = bor_depth;
		this.bor_regdate = bor_regdate;
		this.bor_pass = bor_pass;
		this.bor_ip = bor_ip;
		this.bor_count = bor_count;
		this.bor_filename = bor_filename;
		this.bor_filesize = bor_filesize;
	}
	public BoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
