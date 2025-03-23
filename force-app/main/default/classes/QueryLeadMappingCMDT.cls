public with sharing virtual class QueryLeadMappingCMDT {
    public virtual List<Better_Lead_Field_Mapping__mdt> fetchMetadata() {
        return Better_Lead_Field_Mapping__mdt.getAll().values();
    }
}