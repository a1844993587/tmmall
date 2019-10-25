## 异常记录
- `The code of method _jspService(HttpServletRequest, HttpServletResponse) is exceeding the 65535 bytes limit`（jsp文件过大）
  
    - jsp动态包含`<jsp:include page="test.jsp" />`，静态包含`<%@ include file="test.jsp" %>`
    
    - web.xml中`<servlet>`标签中加入
    
      ```xml
      <init-param>
      	<param-name>mappedfile</param-name>
      	<param-value>false</param-value>
      </init-param>
      ```
    
      添加后的效果如下：
    
      ```xml
      <servlet>
              <servlet-name>jsp</servlet-name>
              <servlet-class>org.apache.jasper.servlet.JspServlet</servlet-class>
              <init-param>
                  <param-name>fork</param-name>
                  <param-value>false</param-value>
              </init-param>
              <init-param>
                  <param-name>xpoweredBy</param-name>
                  <param-value>false</param-value>
              </init-param>
      		<init-param>
                  <param-name>mappedfile</param-name>
                  <param-value>false</param-value>
              </init-param>
              <load-on-startup>3</load-on-startup>
      </servlet>
      ```
    
- 解决 Git 在 windows 下中文乱码的问题

    依次在Git控制台输入以下指令

    ```bash
    git config --global core.quotepath false  		# 显示 status 编码
    git config --global gui.encoding utf-8			# 图形界面编码
    git config --global i18n.commit.encoding utf-8	# 提交信息编码
    git config --global i18n.logoutputencoding utf-8	# 输出 log 编码
    export LESSCHARSET=utf-8
    # 最后一条命令是因为 git log 默认使用 less 分页，所以需要 bash 对 less 命令进行 utf-8 编码
    ```

    