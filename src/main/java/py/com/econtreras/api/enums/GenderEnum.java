package py.com.econtreras.api.enums;

public enum GenderEnum {
    MASCULINO("Masculino", "M"),
    FEMENINO("Femenino", "F"),;

    private final String name;
    private final String abbrev;

    private GenderEnum(String name, String abbrev) {
        this.name = name;
        this.abbrev = abbrev;
    }

    public String getName() {
        return name;
    }

    public String getAbbrev() {
        return abbrev;
    }

}
