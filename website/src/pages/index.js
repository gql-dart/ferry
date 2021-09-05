import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import useBaseUrl from '@docusaurus/useBaseUrl';
import styles from './styles.module.css';

const features = [
  {
    title: <>Fully Typed</>,
    imageUrl: 'img/code.svg',
    description: (
      <>
        Ferry provides fully typed cache operations, so you can easily and
        confidently read and write data with IDE autocomplete.
      </>
    ),
  },
  {
    title: <>Built-in Code Generator</>,
    imageUrl: 'img/automation.svg',
    description: (
      <>
        Ferry automatically generates immutable data types for all GraphQL
        operations and fragments based on your schema.
      </>
    ),
  },
  {
    title: <>Easy to Use</>,
    imageUrl: 'img/stream.svg',
    description: (
      <>
        Ferry uses a simple, powerful Stream-based architecture that is easy to
        understand and use.
      </>
    ),
  },
];

function Feature({ imageUrl, title, description }) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={clsx('col col--4', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={styles.featureImage} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function Home() {
  const context = useDocusaurusContext();
  const { siteConfig = {} } = context;
  const coverImageUrl = useBaseUrl('img/lighthouse.svg');
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="A GraphQL Client for Flutter & Dart"
    >
      <header
        className={clsx('hero hero--primary', styles.heroBanner)}
        style={{
          backgroundImage: `url("${coverImageUrl}")`,
        }}
      >
        <div className="container">
          <h1 className="hero__title">{siteConfig.title}</h1>
          <p className="hero__subtitle">{siteConfig.tagline}</p>
          <div className={styles.buttons}>
            <Link
              className={clsx(
                'button button--outline button--secondary button--lg',
                styles.getStarted
              )}
              to={useBaseUrl('docs/')}
            >
              Get Started
            </Link>
          </div>
        </div>
      </header>
      <main>
        {features && features.length > 0 && (
          <section className={styles.features}>
            <div className="container">
              <div className="row">
                {features.map((props, idx) => (
                  <Feature key={idx} {...props} />
                ))}
              </div>
            </div>
          </section>
        )}
      </main>
    </Layout>
  );
}

export default Home;
