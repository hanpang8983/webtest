package incosmos.test.util;

/**
 * Created by InCosmos on 2016/3/11.
 */
public class PagingUtil {
    private int currentPage=1;
    private int pageRow=5;
    private int totalRow;
    private int totalPage;
    private int start;
    private int pagingStart;
    private int pagingEnd;

    public void init(int totalrow){
        this.setStart((currentPage-1)*pageRow);
        this.totalRow=totalrow;
        this.totalPage=this.totalRow/this.pageRow+1;
        paging(2);
    }

    private void paging(int num){
        if (currentPage<=num){
            pagingStart=1;
        }else{
            pagingStart=currentPage-num;
        }
        if (currentPage>=totalPage-num){
            pagingEnd=totalPage;
        }else {
            pagingEnd=currentPage+num;
        }
    }


    public int getStart() {
        return start;
    }

    public int getPagingStart() {
        return pagingStart;
    }

    public void setPagingStart(int pagingStart) {
        this.pagingStart = pagingStart;
    }

    public int getPagingEnd() {
        return pagingEnd;
    }

    public void setPagingEnd(int pagingEnd) {
        this.pagingEnd = pagingEnd;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageRow() {
        return pageRow;
    }

    public void setPageRow(int pageRow) {
        this.pageRow = pageRow;
    }

    public int getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
