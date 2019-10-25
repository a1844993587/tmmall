package cn.tmmall.utils;

/**
 * @author BenCoper.Yu
 *后台分页工具PageHelper
 */
public class PageUtil {
    public class Page {
        /**
         *  每页从第几个开始
         */
        private int start;
        /**
         * 每页显示的个数
         */
        private int count;
        /**
         * 总数
         */
        private int total;
        /**
         * 参数
         */
        private String param;

        /**
         * 默认每页显示5条
         */
        private static final int defaultCount = 5;

        public int getStart() {
            return start;
        }

        public void setStart(int start) {
            this.start = start;
        }

        public int getCount() {
            return count;
        }

        public void setCount(int count) {
            this.count = count;
        }

        public int getTotal() {
            return total;
        }

        public void setTotal(int total) {
            this.total = total;
        }

        public String getParam() {
            return param;
        }

        public void setParam(String param) {
            this.param = param;
        }

        public Page(){
            count = defaultCount;
        }

        public Page(int start,int count){
            /**
             * 先调用无参构造方法
             */
            this();
            this.start = start;
            this.count = count;
        }

        /**
         * 判断是否有前一页
         * 判断是否有后一页
         * @return
         */
        public boolean isHasPreviouse(){
            if(start == 0) {
                return false;
            }
            return true;
        }

        /**
         * 判断是否有后一页
         * @return
         */
        public boolean isHasNext(){
            if (start == getLast()){
                return false;
            }else {
                return true;
            }
        }

        /**
         * @return totalPage
         * 根据每页显示的数量count以及总共有多少条数据total，计算出总共有多少页
         */
        public int getTotalPage(){
            //总页数
            int totalPage;

            if (total % count == 0){
                totalPage = total / count;
            }else {
                totalPage = total / count +1;
            }

            //初始页
            if (totalPage == 0){
                totalPage = 1;
            }
            return totalPage;
        }

        /**
         * 计算出最后一页的数值
         * @return last
         */
        public int getLast(){
            int last;

            if (total % count == 0){
                last = total - count;
            }
            else {
                last = total - total % count;
            }
            last = last < 0 ? 0 : last;
            return last;
        }

        @Override
        public String toString() {
            return "Page{" +
                    "start=" + start +
                    ", count=" + count +
                    ", total=" + total +
                    ", param='" + param + '\'' +
                    '}';
        }
    }

}
