package uk.ac.bbsrc.tgac.miso.persistence.impl;

import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import uk.ac.bbsrc.tgac.miso.HibernatePaginatedDataSourceIT;

public class HibernateListWorksetViewDaoSearchIT extends HibernatePaginatedDataSourceIT {

  private static final EnumSet<SearchType> VALID_SEARCH_TYPES = EnumSet.of(SearchType.QUERY, SearchType.ID, SearchType.IDS,
      SearchType.CATEGORY, SearchType.STAGE, SearchType.ENTERED, SearchType.UPDATED, SearchType.CREATOR, SearchType.MODIFIER);
  private static final List<String> SORT_FIELDS = Arrays.asList("alias");

  public HibernateListWorksetViewDaoSearchIT() {
    super(VALID_SEARCH_TYPES, SORT_FIELDS, "alias");
  }

  @Override
  protected HibernatePaginatedDataSource<?> constructTestSubject() {
    HibernateListWorksetViewDao sut = new HibernateListWorksetViewDao();
    sut.setSessionFactory(getSessionFactory());
    return sut;
  }

}
