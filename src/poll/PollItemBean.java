package poll;

public class PollItemBean {
	private int list_num;
	private int item_num; 
	private String item; 
	private int count; 
	String partici;
	
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public PollItemBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PollItemBean(int list_num, int item_num, String item, int count) {
		super();
		this.list_num = list_num;
		this.item_num = item_num;
		this.item = item;
		this.count = count;
	}
	public String getPartici() {
		return partici;
	}
	public void setPartici(String partici) {
		this.partici = partici;
	}
	
	
}
