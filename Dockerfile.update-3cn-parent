FROM 3cn-parent:0.0.3-SNAPSHOT
WORKDIR /3cn
COPY . .
RUN mvn install -DskipTests --file common/pom.xml \
    && mvn install -N -DskipTests --file pom.xml \
    && mvn install -DskipTests --file pom.xml \
    && mv /3cn/.git / \
    && rm -rf /3cn \
    && rm -rf /root/.m2/repository/com/ubaid/ms/currency-conversion \
    && rm -rf /root/.m2/repository/com/ubaid/ms/audit \
    && rm -rf /root/.m2/repository/com/ubaid/ms/country \
    && rm -rf /root/.m2/repository/com/ubaid/ms/math \
    && rm -rf /root/.m2/repository/com/ubaid/ms/currency-exchange \
    && rm -rf /root/.m2/repository/com/ubaid/ms/discovery \
    && rm -rf /root/.m2/repository/com/ubaid/ms/api-gateway \
    && rm -rf /root/.m2/repository/com/ubaid/ms/config \
    && rm -rf /root/.m2/repository/com/ubaid/ms/user