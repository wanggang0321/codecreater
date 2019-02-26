
var _url = location.protocol + "//" + location.host + "/tenantadmin/rescissionapply";
$(function(){
	
	 /* 生成列表*/
    var _options = {
        "url": _url + '/selectrescissionapplydata', 
        "tableClass":"nick-table",
        "wordBreakTd":[0,1,2,3,4,5,6,7,8,9,10],
        "wordBreakThAll":true,
        "isLoading": true,
        "isIconBtn":true
    };
    $('#contTab').tableData(_options,initPage);

    function initPage(args){
        $(".pages").createPage(args,goPage);  /** goPage 点击翻页调用的方法 **/
    }

    /**
     * 翻页
     */
    function goPage(pn) {
        console.log('点击翻页调用的方法，使用后台自己的方法')
        $("#popDiv").show();
        var u = _url + "/selectrescissionapplylist?pn="+pn;
        $(".j-by-form-search").attr("action",u);
        $('.j-by-form-search').submit();
    }
    
    /**
     * 查询
     */
    $('.j-by-search').on('click',function(){
    	var t_regular = new RegExp("[`~!@#$^&*=|';'\\\\.<>/?~！@#￥……&*|；'。，、？]");
    	var str = $("#by-searchStr").val();
    	
    	if(!t_regular.test(str)) {
			$("#popDiv").show();
			$("#applyStartTime").val($("#ast").val());
			$("#applyEndTime").val($("#aet").val());
			$("#solveStatus").val($("#by-solveStatus").val());
			$("#searchContext").val($("#by-searchStr").val());
			$("#searchFlag").val("1");
			$("#pn").val("1");
			
			var u = _url + "/selectrescissionapplylist";
	        $(".j-by-form-search").attr("action",u);
			$('.j-by-form-search').submit();
    	} else {
    		toastr.warning('请输入正确的搜索内容（禁止输入非法字符不包含：_下划线）');
    		return false;
    	}
	});
    
    $('body').on('click','.div-click a:not(".readonly")',function(e){
        var _this = $(this);
        var iconName = _this.attr('data-icon');
        switch(iconName){
            case "browse": //补全款
                goDetail(_this,e);
                break;
            default:
                console.log('not find！')
        }
    });
    
    function goDetail(_this){
    	var _id = $(_this).attr("data-id");
        var _urls = $(_this).attr('data-url');
        //window.location.href = _url + _urls + '?applyId=' + _id;
        window.open(_url + _urls + '?applyId=' + _id);
    }
	
});
