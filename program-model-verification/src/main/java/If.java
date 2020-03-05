public class If extends Cfg {
    public CfgNode condition;
    public Cfg thenCfg;
    public Cfg elseCfg;

    public If(CfgNode condition, Cfg thenCfg, Cfg elseCfg) {
        this.condition = condition;
        this.thenCfg = thenCfg;
        this.elseCfg = elseCfg;
    }

    @Override
    public CfgNode getStart() {
        return condition;
    }

    @Override
    public void setNext(Cfg cfg) {
        thenCfg.setNext(cfg);
        if (elseCfg != null) {
            elseCfg.setNext(cfg);
        }
    }
}
