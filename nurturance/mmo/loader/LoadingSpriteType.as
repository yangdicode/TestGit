package mmo.loader {
    
    import mmo.loader.loadingsprite.FullScreenLoadingSprite;
    import mmo.loader.loadingsprite.ILoadingSprite;
    import mmo.loader.loadingsprite.LoadingSprite;
    import mmo.loader.loadingsprite.LoadingSpriteWithCancle;
    import mmo.loader.loadingsprite.LoadingSpriteWithoutCancle;
    
    public final class LoadingSpriteType {
        
        /**
         * 不显示下载提示
         */
        public static const none:int = -1;
        public static const NONE:int = -1;
        
        /**
         * 全屏方式
         */
        public static const fullScreen:int = 1;
        public static const FULL_SCREEN:int = 1;
        
        /**
         * 窗口方式，可关闭
         */
        public static const dialog:int = 2;
        public static const DIALOG:int = 2;

        /**
         * 窗口方式，不可关闭
         */
        public static const DIALOG_WITHOUT_CANCLE:int = 4;
        
        public function LoadingSpriteType() {
        }
        
        /**
         * 获得加载提示框
         * */
        public static function getLoadingSprite(type:int, loader:CustomLoader):ILoadingSprite {
            var loadingSprite:ILoadingSprite = null;
            
            switch(type) {
                case LoadingSpriteType.none:
//                    trace("****************LoadingSpriteType.none is disqualified******************");
//                    trace("****************LoadingSpriteType.none is disqualified******************");
//                    trace("****************LoadingSpriteType.none is disqualified******************");
//                    trace("****************LoadingSpriteType.none is disqualified******************");
//                    trace("****************LoadingSpriteType.none is disqualified******************");
                case LoadingSpriteType.NONE:
                    break;
                case LoadingSpriteType.fullScreen:
//                    trace("****************LoadingSpriteType.fullScreen is disqualified******************");
//                    trace("****************LoadingSpriteType.fullScreen is disqualified******************");
//                    trace("****************LoadingSpriteType.fullScreen is disqualified******************");
//                    trace("****************LoadingSpriteType.fullScreen is disqualified******************");
//                    trace("****************LoadingSpriteType.fullScreen is disqualified******************");
                case LoadingSpriteType.FULL_SCREEN:
                    loadingSprite = new FullScreenLoadingSprite();
                    break;
                case LoadingSpriteType.dialog:
                case LoadingSpriteType.DIALOG:
                    loadingSprite = new LoadingSpriteWithCancle(loader);
                    break;
                case LoadingSpriteType.DIALOG_WITHOUT_CANCLE:
                    loadingSprite = new LoadingSpriteWithoutCancle();
                    break;
            }
            
            return loadingSprite;
        }
        
    }
}